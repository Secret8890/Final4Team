package com.gjob.backend.controller;

import java.util.HashMap;
import java.util.Map;

import com.gjob.backend.model.Pager;
import com.gjob.backend.model.IncruitSearchDTO;
import com.gjob.backend.service.CompanyService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class IncruitController {
    CompanyService companyService;

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
}
