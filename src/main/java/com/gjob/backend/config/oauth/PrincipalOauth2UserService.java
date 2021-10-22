package com.gjob.backend.config.oauth;

import java.util.Date;
import java.util.Map;

import com.gjob.backend.config.auth.PrincipalDetails;
import com.gjob.backend.mapper.MemberMapper;
import com.gjob.backend.model.MemberDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {
    String provider, id, password, gender, email, name, birthday, role = "";

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private MemberMapper membermapper;

    @SuppressWarnings("unchecked")
    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        System.out.println("#getClientRegistration: " + userRequest.getClientRegistration()); // appliction.properties에
                                                                                              // 관한 정보
        System.out.println("#getAccessToken: " + userRequest.getAccessToken().getTokenValue()); // token 값

        OAuth2User oAth2User = super.loadUser(userRequest);
        System.out.println("#getAttributes: " + oAth2User.getAttributes()); // 받아오는 정보 형태 확인 가능
        NaverUserInfo naverUserInfo = null;
        KakaoUserInfo kakaoUserInfo = null;

        if (userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
            System.out.println("네이버 로그인 요청");
            naverUserInfo = new NaverUserInfo((Map<String, Object>) oAth2User.getAttributes().get("response"));
            provider = naverUserInfo.getProvider();
            id = naverUserInfo.getId();
            password = bCryptPasswordEncoder.encode("그것이알고잡다");
            gender = naverUserInfo.getGender();
            email = naverUserInfo.getEmail();
            name = naverUserInfo.getName();
            birthday = naverUserInfo.getBirthday();
            role = naverUserInfo.getIsManager();
        } else if (userRequest.getClientRegistration().getRegistrationId().equals("kakao")) {
            System.out.println("카카오 로그인 요청");
            kakaoUserInfo = new KakaoUserInfo((Map<String, Object>) oAth2User.getAttributes());
            provider = kakaoUserInfo.getProvider();
            id = kakaoUserInfo.getId();
            password = bCryptPasswordEncoder.encode("그것이알고잡다");
            gender = kakaoUserInfo.getGender();
            email = kakaoUserInfo.getEmail();
            name = kakaoUserInfo.getName();
            birthday = kakaoUserInfo.getBirthday().substring(0, 2) + "-" + kakaoUserInfo.getBirthday().substring(2);
            role = kakaoUserInfo.getIsManager();
        }

        MemberDTO memberEntity = membermapper.findById(id);
        if (memberEntity == null) {
            Date date = new Date();
            long timeInMilliSeconds = date.getTime();
            java.sql.Date date1 = new java.sql.Date(timeInMilliSeconds);
            System.out.println("회원 가입 진행&중복된 이메일 없음");
            memberEntity = MemberDTO.builder().u_id(id).u_password(password).u_name(name).u_gender(gender)
                    .u_birth(birthday).u_email(email).u_provider(provider).isManager(role).u_memberSince(date1).build();
            System.out.println("#memberEntity: " + memberEntity);
            membermapper.join(memberEntity);
        } else {
            System.out.println("이미 회원가입되어있음");
        }

        return new PrincipalDetails(memberEntity, oAth2User.getAttributes());
    }
}