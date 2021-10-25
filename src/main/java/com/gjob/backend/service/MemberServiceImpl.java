package com.gjob.backend.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gjob.backend.mapper.MemberMapper;
import com.gjob.backend.mapper.UniversityAndMajorMapper;
import com.gjob.backend.model.MemberDTO;
import com.gjob.backend.model.UniversityAndMajorDTO;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
    private MemberMapper memberMapper;
    private UniversityAndMajorMapper universityAndMajorMapper;
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    // 회원 가입
    @Override
    public void joinS(MemberDTO member, String u_birthyear, String u_birthmonth, String u_birthdate) {
        if (Integer.parseInt(u_birthmonth) < 10) {
            u_birthmonth = "0" + u_birthmonth;
        }
        if (Integer.parseInt(u_birthdate) < 10) {
            u_birthdate = "0" + u_birthdate;
        }
        String u_birth = u_birthyear + "-" + u_birthmonth + "-" + u_birthdate;
        member.setU_birth(u_birth);
        member.setIsManager("ROLE_USER");
        String rawPassword = member.getU_password();
        String encPassword = bCryptPasswordEncoder.encode(rawPassword); // 비밀번호 암호화
        member.setU_password(encPassword);
        System.out.println("member: " + member);
        memberMapper.join(member);
    }

    @Override
    public MemberDTO findByIdS(String u_id) {
        return memberMapper.findById(u_id);
    }

    // 이메일 중복 여부 체크
    @Override
    public int findByEmailS(String u_email) {
        List<MemberDTO> member_list = memberMapper.findByEmail(u_email);
        if (member_list.isEmpty()) { // 이메일 중복 없음
            return 0;
        } else { // 이메일 중복 존재
            for (MemberDTO member : member_list) {
                if (member != null && member.getU_provider() == null) { // 이미 중복된 아이디 존재(일반 회원가입으로)
                    return 1;
                } else if (member != null && member.getU_provider().equals("naver")) {// 이미 중복된 아이디 존재(naver로)
                    return 2;
                } else if (member != null && member.getU_provider().equals("kakao")) {// 이미 중복된 아이디 존재(kakao로)
                    return 3;
                }
            }
        }
        return -1;
    }

    // 아이디 찾기 서비스
    @Override
    public String checkIDS(String u_email) {
        List<MemberDTO> member_result = memberMapper.findByEmail(u_email);
        if (member_result.isEmpty()) {
            return "해당 아이디가 없습니다.";
        }
        for (MemberDTO member : member_result) {
            if (member.getU_provider() == null) {
                String u_id = member.getU_id();
                return u_id;
            }
            if (member.getU_provider().equals("naver"))
                return "네이버 가입자입니다.";
            if (member.getU_provider().equals("kakao"))
                return "카카오 가입자입니다.";
        }
        return null;
    }

    // 비밀번호 찾기 서비스
    @Override
    public Map<String, Boolean> findPwdS(MemberDTO dto) {
        Map<String, Boolean> json = new HashMap<>();
        boolean pwdFindCheck = emailCheckS(dto);
        List<MemberDTO> member_result = memberMapper.findByEmail(dto.getU_email());
        if (pwdFindCheck == false) {
            return json;
        }
        for (MemberDTO member : member_result) {
            if (member.getU_provider() == null) {
                json.put("check", pwdFindCheck);
                return json;
            }
            if (member.getU_provider().equals("naver")) {
                json.put("naver", pwdFindCheck);
                return json;
            }
            if (member.getU_provider().equals("kakao")) {
                json.put("kakao", pwdFindCheck);
                return json;
            }
        }
        return null;
    }

    // 비밀번호 변경
    @Override
    public void changePwdS(String u_password, String u_email) {
        memberMapper.changePwd(u_password, u_email);
    }

    // 정보 변경 (마이페이지 안에서)
    @Override
    public void updateInfoS(MemberDTO member) {
        memberMapper.updateInfo(member);
    }

    // 추가정보 입력(네이버, 카카오 가입 후)
    @Override
    public void additionalS(MemberDTO member) {
        memberMapper.additional(member);
    }

    @Override
    public boolean emailCheckS(MemberDTO member) {
        if (memberMapper.emailCheck(member).isEmpty()) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public List<MemberDTO> getUserJoinS() {
        return memberMapper.getUserJoin();
    }

    @Override
    public int getUserCountS() {
        return memberMapper.getUserCount();
    }

    @Override
    public List<MemberDTO> selectMemberS() {
        return memberMapper.selectMember();
    }

    @Override
    public void updateGrantS(MemberDTO memberdto) {
        memberMapper.updateGrant(memberdto);
    }

    @Override
    public List<MemberDTO> selectAjaxS(Map<String, Object> map) {
        return memberMapper.selectAjax(map);
    }

    @Override
    public MemberDTO selectBySeqS(int u_seq) {
        return memberMapper.selectBySeq(u_seq);
    }

    @Override
    public List<UniversityAndMajorDTO> searchUNIVS(String univ_name) {
        return universityAndMajorMapper.searchUNIV(univ_name);
    }

    @Override
    public List<UniversityAndMajorDTO> searchMAJORS(String major_name) {
        return universityAndMajorMapper.searchMAJOR(major_name);
    }
}