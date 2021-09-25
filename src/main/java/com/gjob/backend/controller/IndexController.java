package com.gjob.backend.controller;

import java.util.List;

import com.gjob.backend.config.auth.PrincipalDetails;
import com.gjob.backend.model.SaraminDTO;
import com.gjob.backend.service.MemberService;
import com.gjob.backend.service.SaraminService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class IndexController {
    // SaraminService service;

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
    @GetMapping("/admin")
    public @ResponseBody String admin() {
        return "admin";
    }

    // test
    @PreAuthorize("hasRole('ROLE_USER')")
    @GetMapping("/info")
    public @ResponseBody String info() {
        return "ROLE_USER";
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
