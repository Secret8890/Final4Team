package com.gjob.backend.controller;

import java.util.HashMap;
import java.util.Map;

import com.gjob.backend.model.Pager;
import com.gjob.backend.model.PassboardDTO;
import com.gjob.backend.service.PassboardService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;

@RequestMapping("/admin")
@Controller
@AllArgsConstructor
public class AdminController {
    private PassboardService passboardService;

    @GetMapping("/passboard/list")
    public String passboardListView() {
        return "admin/admin_passboard_list";
    }

    @GetMapping("/passboard/listGet")
    public @ResponseBody Map<String, Object> passboardList(@RequestParam(defaultValue = "1") int pageNum) {
        int totalBoard = passboardService.selectCountS();
        int pageSize = 20; // 한 페이지에 들어갈 글 개수
        int blockSize = 4; // 한 라인에 1-4까지보임

        Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

        Map<String, Object> pagerMap = new HashMap<String, Object>();
        pagerMap.put("startRow", pager.getStartRow());
        pagerMap.put("endRow", pager.getEndRow());

        Map<String, Object> returnMap = new HashMap<String, Object>();
        returnMap.put("board", passboardService.selectAjaxS(pagerMap));
        returnMap.put("pager", pager);

        return returnMap;
    }

    @GetMapping("/passboard/upload")
    public String adminUploadView() {
        return "admin/admin_passboard_upload";
    }

    @PostMapping("/passboard/upload")
    public @ResponseBody String adminUpload(@RequestBody PassboardDTO passboard) {
        passboardService.insertS(passboard);
        return "SUCCESS";
    }

    @GetMapping("/passboard/content/{pass_seq}")
    public ModelAndView passboardContentView(@PathVariable String pass_seq) {
        int pass_seq_num = Integer.parseInt(pass_seq);
        PassboardDTO dto = passboardService.selectBySeqS(pass_seq_num);
        ModelAndView mv = new ModelAndView("admin/admin_passboard_content", "dto", dto);
        return mv;
    }

    @GetMapping("/passboard/content/{pass_seq}/update")
    public ModelAndView passboardUpdateView(@PathVariable String pass_seq) {
        int pass_seq_num = Integer.parseInt(pass_seq);
        PassboardDTO dto = passboardService.selectBySeqS(pass_seq_num);
        String str2 = dto.getPass_content().replace("<br/>", "\r\n");
        dto.setPass_content(str2);
        ModelAndView mv = new ModelAndView("admin/admin_passboard_update", "dto", dto);
        return mv;
    }

    @PostMapping("/passboard/content/{pass_seq}/update")
    public @ResponseBody String passboardUpdate(@PathVariable String pass_seq, @RequestBody PassboardDTO passboard) {
        passboardService.updateS(passboard);
        return "SUCCESS";
    }

    @PostMapping("/passboard/delete")
    public @ResponseBody String passboardDelete(String pass_seq) {
        int pass_seq_num = Integer.parseInt(pass_seq);
        passboardService.delete(pass_seq_num);
        return "DELETE";
    }
}
