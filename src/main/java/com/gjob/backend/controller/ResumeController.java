package com.gjob.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gjob.backend.model.CareerDTO;
import com.gjob.backend.model.LanguageDTO;
import com.gjob.backend.model.LicenseDTO;
import com.gjob.backend.model.ResumeDTO;
import com.gjob.backend.service.ResumeService;

@Controller
@RequestMapping("resume")
public class ResumeController {
    @Autowired
    private ResumeService service;

    @GetMapping("list")
    public ModelAndView list() {
        List<ResumeDTO> list = service.listS();
        ModelAndView mv = new ModelAndView("resume/list", "list", list);
        return mv;
    }

    @GetMapping("write.do")
    public String write(){
        return "resume/resume_write";
    }

    @PostMapping("write")
    public @ResponseBody boolean writeResume(ResumeDTO resume, List<CareerDTO> careers, List<LanguageDTO> languages,List<LicenseDTO> licenses) {
        service.insertResumeAll(resume,careers,languages,licenses);
        return true;
    }

    @GetMapping("del.do")
    public String delete(@RequestParam int re_seq) {
        service.deleteS(re_seq);
        return "redirect:list";
    }
}