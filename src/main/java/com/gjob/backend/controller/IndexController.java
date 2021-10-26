package com.gjob.backend.controller;

import java.util.List;

import com.gjob.backend.config.auth.PrincipalDetails;
import com.gjob.backend.model.IncruitDTO;
import com.gjob.backend.service.IncruitService;
import com.gjob.backend.service.MemberService;
import com.gjob.backend.service.IndexService;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class IndexController {
    private IndexService indexService;
    private IncruitService incruitService;
    private MemberService memberService;

    @GetMapping("/")
    public ModelAndView index(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        ModelAndView mv = new ModelAndView("index");
        if (principalDetails == null) {
            // 대기업 공채 속보
            // List<IncruitDTO> array =
            // incruitService.APIexecute(indexService.indexBreaking("LoginYet"));
            // mv.addObject("array", array);
            // 임시
            List<IncruitDTO> array = incruitService.temp1S();
            mv.addObject("array", array);
            // 마감 앞둔 공고
            mv.addObject("list", incruitService.selectByEndDateS());
            // 수도권 마감 앞둔 공고
            mv.addObject("bbs", incruitService.selectByCapitalAreaS());
        } else if (principalDetails.getMember() != null
                && memberService.findByIdS(principalDetails.getMember().getU_id()).getU_phone() == null) {
            return new ModelAndView("client/additionalForm");
        } else if (principalDetails.getMember() != null
                && memberService.findByIdS(principalDetails.getMember().getU_id()).getU_phone().length() != 0) {
            String u_job = memberService.findByIdS(principalDetails.getMember().getU_id()).getU_job(); // 사용자의 희망 직종
            // 대기업 공채 속보
            // List<IncruitDTO> array =
            // incruitService.APIexecute(indexService.indexBreaking(u_job));
            // mv.addObject("array", array);
            // 임시
            List<IncruitDTO> array = incruitService.temp2S(u_job);
            mv.addObject("array", array);
            // 마감 앞둔 공고
            mv.addObject("list", incruitService.selectByEndDateLoginS(u_job));
            // 좋아할만한 공고
            // List<IncruitDTO> bbs =
            // incruitService.APIexecute(indexService.indexClick(u_job));
            // mv.addObject("bbs", bbs);
            // 임시
            List<IncruitDTO> bbs = incruitService.temp3S(u_job);
            mv.addObject("bbs", bbs);
        }
        return mv;
    }
}
