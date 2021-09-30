package com.gjob.backend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gjob.backend.config.auth.PrincipalDetails;
import com.gjob.backend.model.MailDTO;
import com.gjob.backend.model.MajorDTO;
import com.gjob.backend.model.MemberDTO;
import com.gjob.backend.model.UniversityDTO;
import com.gjob.backend.service.MailService;
import com.gjob.backend.service.MajorService;
import com.gjob.backend.service.MemberService;
import com.gjob.backend.service.UniversityService;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/login")
public class LoginController {
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    private MemberService memberService;
    private MailService mailService;
    private UniversityService universityService;
    private MajorService majorService;

    // loginForm.jsp 반환
    @GetMapping("/loginForm")
    public String loginForm() {
        return "login/loginForm";
    }

    // joinForm.jsp 반환
    @GetMapping("/joinForm")
    public String joinForm() {
        return "login/joinForm";
    }

    // 회원가입
    @PostMapping("/join")
    public String join(MemberDTO member, String u_birthyear, String u_birthmonth, String u_birthdate) {
        System.out.println("#member: " + member);
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
        memberService.joinS(member); // 회원 가입 실행
        return "redirect:/login/loginForm";
    }

    // joinForm 에서 ID중복확인
    @PostMapping("/join/checkID")
    public @ResponseBody int checkID(String u_id) throws Exception {
        if (memberService.findByIdS(u_id) != null) { // 중복일 경우
            return 1;
        } else {
            return 0;
        }
    }

    // joinForm에서 이메일중복확인
    @PostMapping("/join/checkEmail")
    public @ResponseBody int checkEmail(String u_email) {
        List<MemberDTO> member_list = memberService.findByEmailS(u_email);
        if (member_list.isEmpty()) { // 이메일 중복 없음
            return 0;
        } else { // 이메일 중복 존재
            System.out.println("이메일 중복 존재");
            for (MemberDTO member : member_list) {
                System.out.println("#member: " + member);
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

    // findId.jsp 반환
    @GetMapping("/findId")
    public String findIdView() {
        return "login/findId";
    }

    @GetMapping("/check/findId")
    public @ResponseBody int findId(String u_email) {
        System.out.println("#u_email: " + u_email);
        List<MemberDTO> member_result = memberService.findByEmailS(u_email);
        if (member_result.isEmpty()) { // 해당 이메일로 가입이 없는경우
            System.out.println("실행1");
            return 0;
        } else {
            for (MemberDTO member2 : member_result) {
                if (member2.getU_provider() == null) {
                    return 1;
                } else if (member2.getU_provider().equals("naver")) {
                    return 2;
                } else if (member2.getU_provider().equals("kakao")) {
                    return 3;
                }
            }
        }
        return -1;
    }

    @PostMapping("/findId/showId")
    public @ResponseBody String showId(String u_email) {
        List<MemberDTO> member_result = memberService.findByEmailS(u_email);
        for (MemberDTO member : member_result) {
            String u_id = member.getU_id();
            return u_id;
        }
        return null;
    }

    // findPwd.jsp 반환
    @GetMapping("/findPwd")
    public String findPwdView() {
        return "login/findPwd";
    }

    // 찾으려는 이메일과 이름이 존재하는지 체크
    @GetMapping("/check/findPwd")
    public @ResponseBody Map<String, Boolean> findPwd(String u_email, String u_name) {
        Map<String, Boolean> json = new HashMap<>();
        MemberDTO member = new MemberDTO();
        member.setU_email(u_email);
        member.setU_name(u_name);
        boolean pwdFindCheck = memberService.emailCheckS(member);
        List<MemberDTO> member_result = memberService.findByEmailS(u_email);
        System.out.println("#결과: " + pwdFindCheck);
        if (pwdFindCheck == false) {
            return json;
        } else {
            for (MemberDTO member2 : member_result) {
                if (member2.getU_provider() == null) {
                    json.put("check", pwdFindCheck);
                    return json;
                } else if (member2.getU_provider().equals("naver")) {
                    json.put("naver", pwdFindCheck);
                    return json;
                } else if (member2.getU_provider().equals("kakao")) {
                    json.put("kakao", pwdFindCheck);
                    return json;
                }
            }
        }
        return null;
    }

    // 임시 비밀번호를 사용자 이메일로 전송
    @PostMapping("/check/findPwd/sendEmail")
    public @ResponseBody void sendEmail(String u_email, String u_name) {
        // System.out.println("#u_email: " + u_email + ", u_name: " + u_name);
        MailDTO mail = mailService.createMailAndChangePassword(u_email, u_name);
        mailService.mailSend(mail);
    }

    @GetMapping("/changePwd")
    public String changePwdView(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        String provider = principalDetails.getMember().getU_provider();
        // System.out.println("#provider: " + provider);
        if (provider == null) {
            return "login/changePwd";
        } else if (provider.equals("naver") || provider.equals("kakao")) {
            return "redirect:/"; // 네이버나 카카오가입자->비밀번호 변경 권한 없음 페이지로
        }
        return null;
    }

    @PostMapping("/updateInfo")
    public @ResponseBody boolean updateInfo(@AuthenticationPrincipal PrincipalDetails principalDetails, String input_password, MemberDTO member){
        String user_password = principalDetails.getMember().getU_password();
        boolean flag = false;
        if(bCryptPasswordEncoder.matches(input_password, user_password)){
            memberService.updateInfoS(member);
            flag=true;
        }
        return flag;
    }

    @PostMapping("/changePwd")
    public @ResponseBody int changePwd(@AuthenticationPrincipal PrincipalDetails principalDetails, String u_password,
            String u_password_change) {
        String user_password = principalDetails.getMember().getU_password();
        if (bCryptPasswordEncoder.matches(u_password, user_password)) { // 입력한 기존 비밀번호=DB 회원 비밀번호인지 체크
            String change_password = bCryptPasswordEncoder.encode(u_password_change);
            memberService.changePwdS(change_password, principalDetails.getMember().getU_email());
            return 1;
        } else {
            return 2;
        }
    }

    // 추가정보 입력 값 저장
    @PostMapping("/additional")
    public String additional(@AuthenticationPrincipal PrincipalDetails principalDetails, MemberDTO member) {
        member.setU_id(principalDetails.getMember().getU_id());
        member.setU_birth(member.getU_birth() + "-" + principalDetails.getMember().getU_birth());
        System.out.println("#member additional: " + member);
        memberService.additionalS(member);
        return "redirect:/";
    }

    // 사용자가 검색한 대학교 정보 return
    @GetMapping("/search/school")
    public @ResponseBody List<UniversityDTO> searchSchool(String school) {
        List<UniversityDTO> dto = universityService.searchS(school);
        return dto;
    }

    // 사용자가 검색한 전공 정보 return
    @GetMapping("/search/major")
    public @ResponseBody List<MajorDTO> searchMajor(String major) {
        List<MajorDTO> dto = majorService.searchS(major);
        return dto;
    }
    @GetMapping("user/setting")
    public String userSetting() {
        return "client/setting";
    }
}
