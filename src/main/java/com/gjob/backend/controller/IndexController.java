package com.gjob.backend.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.gjob.backend.config.auth.PrincipalDetails;
import com.gjob.backend.model.CompanyDTO;
import com.gjob.backend.model.SaraminDTO;
import com.gjob.backend.service.CompanyService;
import com.gjob.backend.service.MemberService;
import com.gjob.backend.service.SaraminService;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class IndexController {
    SaraminService service;
    CompanyService companyService;

    // @RequestMapping(value = "/", method = RequestMethod.GET)
    // public ModelAndView index() {
    // List<SaraminDTO> array = service.APItest(service.indexSearch());
    // System.out.println("==========" + service.bbsSearch() + "===========");
    // List<SaraminDTO> bbs = service.APItest(service.bbsSearch());
    // ModelAndView mv = new ModelAndView("index", "array", array);
    // mv.addObject("bbs", bbs);
    // return mv;
    // }

    private MemberService memberService;

    @GetMapping("/")
    public String index(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        if (principalDetails == null) {
            return "index2";
        } else if (principalDetails.getMember() != null
                && memberService.findByIdS(principalDetails.getMember().getU_id()).getU_phone() == null) {
            // login/additionalForm.jsp(추가정보 입력페이지) 리턴
            return "login/additionalForm";
        } else if (principalDetails.getMember() != null
                && memberService.findByIdS(principalDetails.getMember().getU_id()).getU_phone() != null) {
            return "index2";
        }
        return null;
    }

    // test
    @PreAuthorize("hasRole('ROLE_USER')")
    @GetMapping("/info")
    public @ResponseBody String info() {
        return "ROLE_USER";
    }

    // 기존 방식
    @GetMapping("/list")
    public ModelAndView list() {
        List<SaraminDTO> array = service.APItest(service.indexSearch());
        System.out.println("==========" + service.bbsSearch() + "===========");
        List<SaraminDTO> bbs = service.APItest(service.bbsSearch());
        ModelAndView mv = new ModelAndView("index", "array", array);
        mv.addObject("bbs", bbs);
        return mv;
    }

    // 데이터를 DB에 저장 (임시로 아무 링크 설정->index.jsp에서 이력서관리 메뉴)
    @GetMapping("/list/save")
    public String notice2save() {
        companyService.createUrl("0");
        return "redirect:/";
    }

    // DB의 데이터를 호출 (임시로 아무 링크 설정->index.jsp에서 자기소개서 메뉴)
    @GetMapping("/list/notice2")
    public ModelAndView notice2() {
        // List<CompanyDTO> array = companyService.selectS();
        Date nowDate = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String co_end_date = simpleDateFormat.format(nowDate);
        List<CompanyDTO> array = companyService.selectByEndDateS(co_end_date);
        ModelAndView mv = new ModelAndView("notice2", "array", array);
        return mv;
    }

    // test
    @GetMapping("/list/notice/{co_seq}")
    public ModelAndView notice3(@PathVariable String co_seq) {
        System.out.println("#co_seq: " + co_seq);
        if (co_seq.equals("styles.css")) { // styles.css -> print 찍힘
            System.out.println("error");
        } else {
            CompanyDTO dto = companyService.selectBySeqS(co_seq);
            String co_url = dto.getCo_url();
            String html = companyService.loadContent(co_url);
            ModelAndView mv = new ModelAndView("incruit/incruit_detail", "dto", dto);
            mv.addObject("html", html);
            System.out.println("##Controller");
            System.out.println(html);
            return mv;
        }
        return null;
    }
    @RequestMapping("self")
    public String selfIndex() {
        return "resume/intro_main"; 
    }

    @RequestMapping("terms") 
    public String terms(){
        return "client/terms";
    }
    @RequestMapping("register")
    public String register(){
        return "client/register";
    }


}
