package com.gjob.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gjob.backend.model.ResumeDTO;
import com.gjob.backend.service.ResumeService;

@Controller
@RequestMapping("resume")
public class ResumeController {
    @Autowired
    private ResumeService service;

    @GetMapping("list.do")
    public ModelAndView list(){
        List<ResumeDTO> list = service.listS();
        ModelAndView mv = new ModelAndView("resume/list","list",list);
        return mv;
    }
    
    @GetMapping("write.do")
    public String write(){
        return "resume/resume_write";
    }
    @PostMapping("write.do")
    public String write(ResumeDTO resume){
        service.insertS(resume);
        return "redirect:list.do";
    }
    @GetMapping("del.do")
    public String delete(@RequestParam int re_seq){
        service.deleteS(re_seq);
        return "redirect:list.do";
    }
    
}
