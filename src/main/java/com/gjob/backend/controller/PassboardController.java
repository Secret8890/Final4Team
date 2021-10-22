package com.gjob.backend.controller;

import java.util.HashMap;
import java.util.Map;

import com.gjob.backend.model.Pager;
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

    // 합격 자소서 게시판
    @GetMapping("/list")
    public ModelAndView list(@RequestParam(defaultValue = "1") int pageNum) {
        int totalBoard = passboardService.selectCountS();
        int pageSize = 18;
        int blockSize = 5;
        Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

        Map<String, Object> pagerMap = new HashMap<String, Object>();
        pagerMap.put("startRow", pager.getStartRow());
        pagerMap.put("endRow", pager.getEndRow());

        Map<String, Object> returnMap = new HashMap<String, Object>();
        returnMap.put("board", passboardService.selectAjaxByHitS(pagerMap));
        returnMap.put("pager", pager);
        ModelAndView mv = new ModelAndView("success/success_index");
        mv.addObject("map", returnMap);
        return mv;
    }

    // 합격 자소서 클릭->내용 보기 + 조회수 증가
    @GetMapping("/content")
    public @ResponseBody Map<String, Object> content(String num) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("content", passboardService.selectBySeqS(Integer.parseInt(num)));
        passboardService.updateHitS(Integer.parseInt(num));
        return map;
    }
}
