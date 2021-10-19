package com.gjob.backend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gjob.backend.config.auth.PrincipalDetails;
import com.gjob.backend.model.ApplyDTO;
import com.gjob.backend.model.CompanyDTO;
import com.gjob.backend.model.CrawlingDTO;
import com.gjob.backend.model.IncruitSearchDTO;
import com.gjob.backend.model.Pager;
import com.gjob.backend.model.ResumeDTO;
import com.gjob.backend.model.SelfDTO;
import com.gjob.backend.service.ApplyService;
import com.gjob.backend.service.CompanyService;
import com.gjob.backend.service.ResumeService;
import com.gjob.backend.service.SelfService;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class IncruitController {
    CompanyService companyService;
    ApplyService applyService;
    ResumeService resumeService;
    SelfService selfService;

    @GetMapping("/incruit")
    public String incruitIndex() {
        return "incruit/incruit_list";
    }

    @PostMapping("/incruit/getList")
    public @ResponseBody Map<String, Object> getList(int page) {
        System.out.println(("###page: " + page));
        int totalBoard = companyService.selectCountS();
        int pageSize = 20;
        int blockSize = 5;

        Pager pager = new Pager(page, totalBoard, pageSize, blockSize);

        Map<String, Object> pagerMap = new HashMap<String, Object>();
        pagerMap.put("startRow", pager.getStartRow());
        pagerMap.put("endRow", pager.getEndRow());

        Map<String, Object> returnMap = new HashMap<String, Object>();
        returnMap.put("board", companyService.selectAjaxS(pagerMap));
        returnMap.put("pager", pager);

        return returnMap;
    }

    @GetMapping("/incruit/search")
    public ModelAndView searchDetail(IncruitSearchDTO dto, @RequestParam(defaultValue = "1") int pageNum) {
        int pageSize = 20;
        int blockSize = 5;

        ModelAndView mv = new ModelAndView("/incruit/incruit_search_result");
        Map<String, Object> pagerMap = new HashMap<String, Object>();
        Map<String, Object> returnMap = new HashMap<String, Object>();

        int totalBoard = companyService.countByDetailSearchS(dto);
        Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

        pagerMap.put("startRow", pager.getStartRow());
        pagerMap.put("endRow", pager.getEndRow());
        pagerMap.put("workSelected", dto.getWorkSelected());
        pagerMap.put("regionSelected", dto.getRegionSelected());
        pagerMap.put("career", dto.getCareer());
        pagerMap.put("work_type", dto.getWork_type());
        pagerMap.put("education", dto.getEducation());

        returnMap.put("board", companyService.searchByDetailS(pagerMap));
        returnMap.put("pager", pager);
        returnMap.put("work", dto.getWorkSelected());
        returnMap.put("region", dto.getRegionSelected());
        returnMap.put("career", dto.getCareer());
        returnMap.put("work_type", dto.getWork_type());
        returnMap.put("education", dto.getEducation());
        mv.addObject("map", returnMap);
        return mv;
    }

    @GetMapping("/notice/{co_seq}")
    public ModelAndView notice3(@PathVariable String co_seq,
            @AuthenticationPrincipal PrincipalDetails principalDetails) {
        int u_seq = principalDetails.getMember().getU_seq();
        if (co_seq.equals("styles.css")) { // styles.css -> print 찍힘
            System.out.println("error");
        } else {
            CompanyDTO dto = companyService.selectBySeqS(co_seq);
            String co_url = dto.getCo_url();
            // String html = companyService.loadContent(co_url,co_seq);
            CrawlingDTO craw = companyService.loadContent(co_url, co_seq);
            List<ResumeDTO> resumeList = resumeService.userSelectS(String.valueOf(u_seq));
            List<SelfDTO> selfList = selfService.userSelfS(String.valueOf(u_seq));
            ModelAndView mv = new ModelAndView("incruit/incruit_detail", "dto", dto);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("company", dto);
            map.put("crawling", craw);
            map.put("resumeList", resumeList);
            map.put("selfList", selfList);
            mv.addObject("map", map);
            return mv;
        }
        return null;
    }

    // 회사 지원 메소드
    @PostMapping("/incruit/apply")
    @ResponseBody
    public boolean apply(ApplyDTO dto, @AuthenticationPrincipal PrincipalDetails principalDetails) {
        dto.setU_seq(principalDetails.getMember().getU_seq());
        boolean flag = false;
        try {
            applyService.insertS(dto);
            flag = true;
        } catch (Exception e) {
            System.out.println(e);
            flag = false;
        }
        return flag;
    }

    @GetMapping("test3")
    public void test3() {
        List<CompanyDTO> list = companyService.testS();
        System.out.println(list);
    }
}
