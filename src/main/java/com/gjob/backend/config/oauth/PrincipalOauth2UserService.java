package com.gjob.backend.config.oauth;

import java.util.Map;

import com.gjob.backend.mapper.MemberMapper;

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

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        System.out.println("#getClientRegistration: " + userRequest.getClientRegistration()); // appliction.properties에
                                                                                              // 관한 정보
        System.out.println("#getAccessToken: " + userRequest.getAccessToken().getTokenValue()); // token 값

        OAuth2User oAth2User = super.loadUser(userRequest);
        System.out.println("#getAttributes: " + oAth2User.getAttributes()); // 받아오는 정보 형태 확인 가능->여기에 찍히는 값 보고 카카오 정보
                                                                            // 가공하면 될 것 같아요
        // 네이버 #getAttributes: {resultcode=00, message=success,
        // response={id=3tAmhLbb5y3LSSkYlbKcwB_oU7DbMM1bljA9qS__bA4, gender=F,
        // email=jiakarin@naver.com, mobile=010-3003-4882, mobile_e164=+821030034882,
        // name=김지아, birthday=04-25, birthyear=1997}}
        // 카카오 #getAttributes: {id=1913651176, connected_at=2021-09-17T09:25:53Z,
        // properties={nickname=김지아},
        // kakao_account={profile_nickname_needs_agreement=false,
        // profile={nickname=김지아}, has_email=true, email_needs_agreement=false,
        // is_email_valid=true, is_email_verified=true, email=jiakarin25@gmail.com,
        // has_birthday=true, birthday_needs_agreement=false, birthday=0425,
        // birthday_type=SOLAR, has_gender=true, gender_needs_agreement=false,
        // gender=female}}
        NaverUserInfo naverUserInfo = null;
        KakaoUserInfo kakaoUserInfo = null;

        if (userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
            System.out.println("네이버 로그인 요청");
            naverUserInfo = new NaverUserInfo((Map) oAth2User.getAttributes().get("response"));
            provider = naverUserInfo.getProvider();
            id = naverUserInfo.getId();
            password = bCryptPasswordEncoder.encode("그것이알고잡다");
            gender = naverUserInfo.getGender();
            email = naverUserInfo.getEmail();
            name = naverUserInfo.getName();
            birthday = naverUserInfo.getBirthday();
            role = "ROLE_USER";
        } else if (userRequest.getClientRegistration().getRegistrationId().equals("kakao")) {
            System.out.println("카카오 로그인 요청");
            // 여기서 카카오 객체(KakaoUserInfo.java)를 만든거 가공해서 위와 같이 정보 받아오기
            kakaoUserInfo = new KakaoUserInfo((Map) oAth2User.getAttributes());
            provider = kakaoUserInfo.getProvider();
            id = kakaoUserInfo.getId();
            password = bCryptPasswordEncoder.encode("그것이알고잡다");
            gender = kakaoUserInfo.getGender();
        }

        // Member memberEntity = membermapper.findById(id);

        // if (memberEntity == null) {
        // System.out.println("회원 가입 진행");
        // memberEntity =
        // Member.builder().u_id(id).u_password(password).u_name(name).u_gender(gender)
        // .u_birth(birthday).u_email(email).u_provider(provider).isManager(role).build();
        // System.out.println("#memberEntity: " + memberEntity);
        // membermapper.join(memberEntity);
        // } else {
        // System.out.println("이미 회원가입되어있음");
        // }
        // return new PrincipalDetails(memberEntity, oAth2User.getAttributes());
        // 아이디, 이름, 이메일, 성별, 생일
        return super.loadUser(userRequest);
    }
}