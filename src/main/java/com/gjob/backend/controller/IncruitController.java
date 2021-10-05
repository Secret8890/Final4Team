package com.gjob.backend.controller;

import java.util.HashMap;
import java.util.Map;

import com.gjob.backend.model.Pager;
import com.gjob.backend.service.CompanyService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
