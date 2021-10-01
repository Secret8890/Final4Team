package com.gjob.backend.controller;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.gjob.backend.model.SelfDTO;
import com.gjob.backend.service.SelfService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SelfController {
    
    @Autowired
    SelfService service;

    
    @GetMapping("insert.do")
    public String selfInsert(){
        return "selfInsert";
    }
    
    @GetMapping("insert2.do")

    public String selfInsert2(){
        return "selfInsertQA";
    }

    @PostMapping("insert.self")
    public String insertSelf(SelfDTO selfdto){
        service.insertSelfS(selfdto);
        return "redirect:select.do";
    }

    @PostMapping("insert.qa")
    public String insertQA(SelfDTO selfdto){
        service.insertQAS(selfdto);
        return "redirect:select.do";
    }

    @PostMapping("update.do")
    public String update(SelfDTO selfdto){
        service.updateS(selfdto);
        return "redirect:select.do";
    }
    @GetMapping("select.do")
    public ModelAndView select(){
        //List<SelfDTO> list=service.selectS();
        List<SelfDTO> list=service.selectCompanyS();
        ModelAndView mv=new ModelAndView("selfList");
        mv.addObject("list", list);
        System.out.println("mv: "+mv);
        return mv;
    }
    @GetMapping("selectQA.do")
    public ModelAndView selectQA(SelfDTO selfdto){
        System.out.println(selfdto.getCo_seq());
        List<SelfDTO> list=service.selectQAS(selfdto);
        System.out.println("========="+list+"===========");
        ModelAndView mv=new ModelAndView("selfList2");
        mv.addObject("list",list);
        mv.addObject("seq", selfdto.getSelf_seq());
        return mv;
    }
    @GetMapping("deleteQA.do")
	public String deleteQA(int qa_seq) {
		service.deleteQAS(qa_seq);
		return "redirect:select.do";
	}
    @GetMapping("deleteSelf.do")
	public String deleteSelf(int self_seq) {
		service.deleteSelfS(self_seq);
		return "redirect:select.do";
	}
}
