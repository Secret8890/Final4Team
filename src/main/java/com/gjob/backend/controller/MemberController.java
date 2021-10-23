package com.gjob.backend.controller;

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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MemberController {
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    private MemberService memberService;
    private MailService mailService;
    private UniversityService universityService;
    private MajorService majorService;

    // 로그인 실패 페이지
    @GetMapping("login")
    public String loginFail() {
        return "client/loginFail"; // login_fail jsp 페이지(회원가입, 아이디찾기, 비밀번호 찾기 링크 수정)
    }

    // 이용약관 정보 페이지
    @GetMapping("terms")
    public String terms() {
        return "client/terms";
    }

    // 회원가입 페이지
    @GetMapping("join")
    public String join() {
        return "client/register";
    }

    // 회원가입
    @PostMapping("join")
    public String join(MemberDTO member, String u_birthyear, String u_birthmonth, String u_birthdate) {
        memberService.joinS(member, u_birthyear, u_birthmonth, u_birthdate);
        return "redirect:/";
    }

    // 회원가입 -> 아이디 체크
    @GetMapping("join/checkID")
    public @ResponseBody int checkID(String u_id) throws Exception {
        if (memberService.findByIdS(u_id) != null) { // 중복일 경우
            return 1;
        } else {
            return 0;
        }
    }

    // 회원가입 -> 이메일 체크
    @GetMapping("join/checkEmail")
    public @ResponseBody int checkEmail(String u_email) {
        int result = memberService.findByEmailS(u_email);
        return result;
    }

    // 아이디 찾기
    @PostMapping("findId")
    public @ResponseBody String showId(String u_email) {
        String result = memberService.checkIDS(u_email);
        return result;
    }

    // 비밀번호 찾기 -> 이름과 이메일로 가입한 사람 있는지 찾기
    @PostMapping("findPwd")
    public @ResponseBody Map<String, Boolean> findPwd(MemberDTO dto) {
        Map<String, Boolean> result = memberService.findPwdS(dto);
        return result;
    }

    // 임시 비밀번호를 사용자 이메일로 전송
    @PostMapping("findPwd/sendEmail")
    public @ResponseBody void sendEmail(String u_name, String u_email) {
        MailDTO mail = mailService.createMailAndChangePassword(u_email, u_name);
        mailService.mailSend(mail);
    }

    // 로그인 후 마이페이지
    @GetMapping("user/setting")
    public String userSetting() {
        return "client/setting";
    }

    // 비밀번호 변경 (마이페이지 안에서)
    @PutMapping("changePwd")
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

    // 정보 변경 (마이페이지 안에서)
    @PutMapping("updateInfo")
    public @ResponseBody boolean updateInfo(@AuthenticationPrincipal PrincipalDetails principalDetails,
            String input_password, MemberDTO member) {
        String user_password = principalDetails.getMember().getU_password();
        boolean flag = false;
        if (bCryptPasswordEncoder.matches(input_password, user_password)) { // 회원 비밀번호=입력한 비밀번호 인지 체크
            memberService.updateInfoS(member);
            flag = true;
        }
        return flag;
    }

    // 희망직종 선택 페이지
    @GetMapping("jobSearch")
    public String jobSearch() {
        return "client/job_search";
    }

    // 대학교 검색 페이지
    @GetMapping("schoolSearch")
    public String schoolSearch() {
        return "client/school_search";
    }

    // 전공 검색 페이지
    @GetMapping("majorSearch")
    public String majorSearch() {
        return "client/major_search";
    }

    // 네이버, 카카오 추가 정보 입력 update
    @PostMapping("additional")
    public String additional(MemberDTO member, @AuthenticationPrincipal PrincipalDetails principalDetails) {
        member.setU_id(principalDetails.getMember().getU_id());
        member.setU_birth(member.getU_birth() + "-" + principalDetails.getMember().getU_birth());
        memberService.additionalS(member);
        return "redirect:/";
    }

    // 검색한 대학교 정보 return
    @GetMapping("search/school")
    public @ResponseBody List<UniversityDTO> searchSchool(String school) {
        List<UniversityDTO> dto = universityService.searchS(school);
        return dto;
    }

    // 검색한 전공 정보 return
    @GetMapping("search/major")
    public @ResponseBody List<MajorDTO> searchMajor(String major) {
        List<MajorDTO> dto = majorService.searchS(major);
        return dto;
    }

    // 기업 공고 등록 페이지->추후 수정?
    @GetMapping("company")
    public String forCompany() {
        return "client/company_write";
    }
}
