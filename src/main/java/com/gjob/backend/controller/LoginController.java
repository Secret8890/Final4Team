package com.gjob.backend.controller;

import java.util.HashMap;
import java.util.Map;

import com.gjob.backend.config.auth.PrincipalDetails;
import com.gjob.backend.model.MailDTO;
import com.gjob.backend.model.MemberDTO;
import com.gjob.backend.service.MailService;
import com.gjob.backend.service.MemberService;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/login")
public class LoginController {
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    private MemberService memberService;
    private MailService mailService;

    // 테스트용으로 임시 추가
    @GetMapping("/ad")
    public String view() {
        return "login/additionalForm";
    }

    @PostMapping("/additional")
    public String additional(MemberDTO member, String u_school) {
        System.out.println("#u_school: " + u_school);
        // member.setU_id(principalDetails.getMember().getU_id());
        member.setU_birth(member.getU_birth());
        // member.setIs_manager("ROLE_USER");
        System.out.println("#member additional: " + member);
        // memberService.additionalS(member);
        // return "redirect:/";
        return null;
    }

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
        MemberDTO member = memberService.findByEmailS(u_email);
        if (member == null) {
            return 0;
        } else if (member != null && member.getU_provider() == null) { // 이미 중복된 아이디 존재(일반 회원가입으로)
            return 1;
        } else if (member != null && member.getU_provider().equals("naver")) {// 이미 중복된 아이디 존재(naver로)
            return 2;
        } else if (member != null && member.getU_provider().equals("kakao")) {// 이미 중복된 아이디 존재(kakao로)
            return 3;
        }
        return -1;
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
        // System.out.println("#넘기려는 객체: " + member);
        boolean pwdFindCheck = memberService.emailCheckS(member);
        MemberDTO member_result = memberService.findByEmailS(u_email);
        System.out.println("#결과: " + pwdFindCheck);
        if (pwdFindCheck == true) {
            json.put("check", pwdFindCheck);
            return json;
        } else if (pwdFindCheck == true && member_result.getU_provider().equals("naver")) {
            json.put("naver", pwdFindCheck);
            return json;
        } else if (pwdFindCheck == true && member_result.getU_provider().equals("kakao")) {
            json.put("kakao", pwdFindCheck);
            return json;
        } else {
            return json;
        }
    }

    // 임시 비밀번호를 사용자 이메일로 전송
    @PostMapping("/check/findPwd/sendEmail")
    public @ResponseBody void sendEmail(String u_email, String u_name) {
        // System.out.println("#u_email: " + u_email + ", u_name: " + u_name);
        MailDTO mail = mailService.createMailAndChangePassword(u_email, u_name);
        mailService.mailSend(mail);
    }

    @GetMapping("/changePwd")
    public String changePwdView() {
        return "login/changePwd";
    }

    // ajax로 유연하게 처리하기
    @PostMapping("/changePwd")
    public @ResponseBody int changePwd(@AuthenticationPrincipal PrincipalDetails principalDetails, String u_password,
            String u_password_change) {
        String user_password = principalDetails.getMember().getU_password();
        if (bCryptPasswordEncoder.matches(u_password, user_password)) { // 입력한 기존 비밀번호=DB 회원 비밀번호
            String change_password = bCryptPasswordEncoder.encode(u_password_change);
            memberService.changePwdS(change_password, principalDetails.getMember().getU_email());
            return 1;
        } else {
            return 2;
        }
    }
    // public String changePwd(@AuthenticationPrincipal PrincipalDetails
    // principalDetails, String u_password,
    // String u_password_change) {
    // String user_password = principalDetails.getMember().getU_password();
    // if (bCryptPasswordEncoder.matches(u_password, user_password)) { // 입력한 기존
    // 비밀번호=DB 회원 비밀번호
    // String change_password = bCryptPasswordEncoder.encode(u_password_change);
    // memberService.changePwdS(change_password,
    // principalDetails.getMember().getU_email());
    // } else {
    // System.out.println("비밀번호 안 똑같음 ㅇㅇ");
    // }
    // return "redirect:/";
    // }
}
