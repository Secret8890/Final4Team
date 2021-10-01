package com.gjob.backend.controller;

import com.gjob.backend.service.SaraminService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IncruitController {
    @Autowired
    SaraminService service;
    @GetMapping("/incruit")
    public ModelAndView incruitIndex(){
        ModelAndView mv = new ModelAndView("incruit/incruit_list");
        mv.addObject("bbs", service.APItest(service.bbsSearch()));
        return mv;
    }
}
