package com.gjob.backend.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.gjob.backend.model.SaraminDTO;
import com.gjob.backend.service.SaraminService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
    @Autowired
    SaraminService service;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index() {
        List<SaraminDTO> array = service.APItest(service.indexSearch());
        System.out.println("=========="+service.bbsSearch()+"===========");
        List<SaraminDTO> bbs = service.APItest(service.bbsSearch());
        ModelAndView mv = new ModelAndView("index", "array", array);
        mv.addObject("bbs", bbs);
        return mv;
    }
    @RequestMapping("self")
    public String selfIndex() {
        return "resume/intro_main"; 
    }

    @RequestMapping("terms") 
    public String terms(){
        return "client/terms";
    }
    @RequestMapping("register")
    public String register(){
        return "client/register";
    }
}
