package com.gjob.backend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gjob.backend.model.Pager;
import com.gjob.backend.model.PassboardDTO;
import com.gjob.backend.service.PassboardService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/pass")
@AllArgsConstructor
public class PassboardController {
    private PassboardService passboardService;

    @GetMapping("/list")
    public String passboardListView() {
        return "success/success_index";
    }

    @GetMapping("/listGet")
    public @ResponseBody Map<String, Object> passboardList(@RequestParam(defaultValue = "1") int pageNum) {
        int totalBoard = passboardService.selectCountS();
        int pageSize = 16;
        int blockSize = 5;

        Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

        Map<String, Object> pagerMap = new HashMap<String, Object>();
        pagerMap.put("startRow", pager.getStartRow());
        pagerMap.put("endRow", pager.getEndRow());

        Map<String, Object> returnMap = new HashMap<String, Object>();
        returnMap.put("board", passboardService.selectAjaxByHitS(pagerMap));
        returnMap.put("pager", pager);

        return returnMap;
    }

    @GetMapping("/content")
    public @ResponseBody Map<String, Object> content(String num) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("content", passboardService.selectBySeqS(Integer.parseInt(num)));
        passboardService.updateHitS(Integer.parseInt(num)); // 클릭한 글 조회수 증가
        return map;
    }
}
