package com.gjob.backend.controller;

import java.util.HashMap;
import java.util.Map;

import com.gjob.backend.model.Pager;
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
    public ModelAndView search(String workSelected, String regionSelected,
            @RequestParam(defaultValue = "1") int pageNum) {
        int pageSize = 20;
        int blockSize = 5;

        ModelAndView mv = new ModelAndView("/incruit/incruit_search_result");
        Map<String, Object> pagerMap = new HashMap<String, Object>();
        Map<String, Object> returnMap = new HashMap<String, Object>();
        System.out.println("#work: " + workSelected + ", region: " + regionSelected + ", pageNum: " + pageNum);
        if (workSelected.length() == 0) { // 지역만 제출한 경우
            int totalBoard = companyService.countByRegionS(regionSelected);
            Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

            pagerMap.put("startRow", pager.getStartRow());
            pagerMap.put("endRow", pager.getEndRow());
            pagerMap.put("co_location_name", regionSelected);

            returnMap.put("board", companyService.searchByRegionS(pagerMap));
            returnMap.put("pager", pager);
        } else if (regionSelected.length() == 0) { // 직종만 제출한 경우
            int totalBoard = companyService.countByWorkS(workSelected);
            Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

            pagerMap.put("startRow", pager.getStartRow());
            pagerMap.put("endRow", pager.getEndRow());
            pagerMap.put("co_job_mid_name", workSelected);

            returnMap.put("board", companyService.searchByWorkS(pagerMap));
            returnMap.put("pager", pager);
        } else { // 지역&직종
            int totalBoard = companyService.countByRegionAndWorkS(regionSelected, workSelected);
            Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

            pagerMap.put("startRow", pager.getStartRow());
            pagerMap.put("endRow", pager.getEndRow());
            pagerMap.put("co_location_name", regionSelected);
            pagerMap.put("co_job_mid_name", workSelected);

            returnMap.put("board", companyService.searchByRegionAndWorkS(pagerMap));
            returnMap.put("pager", pager);
        }
        returnMap.put("work", workSelected);
        returnMap.put("region", regionSelected);
        mv.addObject("map", returnMap);
        return mv;
    }
}
