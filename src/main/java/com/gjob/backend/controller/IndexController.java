package com.gjob.backend.controller;

import java.util.List;

import com.gjob.backend.config.auth.PrincipalDetails;
import com.gjob.backend.model.CompanyDTO;
import com.gjob.backend.model.CrawlingDTO;
import com.gjob.backend.model.SaraminDTO;

import com.gjob.backend.service.CompanyService;
import com.gjob.backend.service.MemberService;
import com.gjob.backend.service.SaraminService;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class IndexController {
    private SaraminService saraminService;
    private CompanyService companyService;
    private MemberService memberService;

    @GetMapping("/")
    public ModelAndView index(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        if (principalDetails == null) {
            // 대기업 공채 속보(30개)
            List<CompanyDTO> array = saraminService.APIexecute(saraminService.indexBreaking("LoginYet"));
            companyService.insertSaramin(array);
            ModelAndView mv = new ModelAndView("index", "array", array);
            // 마감 앞둔 공고(30개)
            List<CompanyDTO> list = companyService.selectByEndDateS();
            mv.addObject("list", list);
            // 수도권 공고(30개)
            List<CompanyDTO> bbs = companyService.selectByCapitalAreaS();
            mv.addObject("bbs", bbs);
            return mv;
        } else if (principalDetails.getMember() != null
                && memberService.findByIdS(principalDetails.getMember().getU_id()).getU_phone() == null) {
            // login/additionalForm.jsp(추가정보 입력페이지) 리턴
            return new ModelAndView("login/additionalForm");
        } else if (principalDetails.getMember() != null
                && memberService.findByIdS(principalDetails.getMember().getU_id()).getU_phone() != null) {
            String u_job = memberService.findByIdS(principalDetails.getMember().getU_id()).getU_job(); // 사용자의 희망 직종
            // 대기업 공채 속보(30개)
            List<CompanyDTO> array = saraminService.APIexecute(saraminService.indexBreaking(u_job));
            companyService.insertSaramin(array);
            ModelAndView mv = new ModelAndView("index", "array", array);
            // 마감 앞둔 공고(30개)
            List<CompanyDTO> list = companyService.selectByEndDateLoginS(u_job);
            mv.addObject("list", list);
            // 가장 많이 클릭한 공고(30개)
            List<CompanyDTO> bbs = saraminService.APIexecute(saraminService.indexClick(u_job));
            companyService.insertSaramin(bbs);
            mv.addObject("bbs", bbs);
            return mv;
        }
        return null;
    }

    // 데이터를 DB에 저장 (임시로 아무 링크 설정->index.jsp에서 이력서관리 메뉴)
    @GetMapping("/list/save")
    public String notice2save() {
        companyService.createUrl("0");
        return "redirect:/";
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
            //String html = companyService.loadContent(co_url,co_seq);
            List<CrawlingDTO> list= companyService.loadContent(co_url,co_seq);
            ModelAndView mv = new ModelAndView("incruit/incruit_detail", "dto", dto);
            mv.addObject("list", list);
            System.out.println("##Controller");
            System.out.println(list);
            return mv;
        }
        return null;
    }

    @RequestMapping("self")
    public String selfIndex() {
        return "resume/intro_main";
    }

    @RequestMapping("terms")
    public String terms() {
        return "client/terms";
    }

    @RequestMapping("register")
    public String register() {
        return "client/register";
    }
}
