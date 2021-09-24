package com.gjob.backend.controller;

import com.gjob.backend.model.TestIntroDTO;
import com.gjob.backend.service.TestIntroService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.util.*;

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
        return "redirect:introduce_main.do";
    }

    @GetMapping("introduce_list.do")
    public ModelAndView intro_list(){
        List<TestIntroDTO> list = service.selectS();
        ModelAndView mv = new ModelAndView("intro_list","list",list);
        return mv;
    }

    @GetMapping("delete.do")
    public String delete(@RequestParam long seq){
        service.deleteS(seq);
        return "redirect:introduce_main.do";
    }

	@RequestMapping("/introduce_content.do")
	public ModelAndView content(TestIntroDTO selfintro, Model model)
	{
        TestIntroDTO selectedIntro = service.selectBySeqS(selfintro);
        ModelAndView mv = new ModelAndView("intro_content","selectedIntro",selectedIntro);
        return mv;
	}

    @PostMapping("update.do")
    public String update(TestIntroDTO selfintro){

        service.updateS(selfintro);
        System.out.println("CONTROLLER: " + selfintro);
        return "redirect:introduce_main.do";
    }

    @GetMapping("sign_up.do")
    public String signup(){
        return "sign_up";
    }
    @GetMapping("success_index.do")
    public String userinfo(){
        return "success_index";
    }
}
