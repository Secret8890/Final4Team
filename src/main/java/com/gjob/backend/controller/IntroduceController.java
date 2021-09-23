package com.gjob.backend.controller;

import com.gjob.backend.model.TestIntroDTO;
import com.gjob.backend.service.TestIntroService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("test/*")
@AllArgsConstructor
public class IntroduceController {
    @Autowired
    private TestIntroService service;

    @RequestMapping("introduce_main.do")
    public String intro_main(){
        return "intro_main";
    }

	@RequestMapping("introduce_write.do")
    public String intro_write(){
        return "intro_write";
    }

    @PostMapping("write.do")
    public String intro_write(TestIntroDTO selfintro){
        System.out.println(selfintro);
        service.insertS(selfintro);
        return "redirect:intro_main";
    }
}
