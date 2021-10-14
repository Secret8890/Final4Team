package com.gjob.backend.controller;

import java.util.List;

import com.gjob.backend.model.SelfDTO;
import com.gjob.backend.service.SelfService;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("self")
public class SelfController {

    @Autowired
    SelfService service;

    @GetMapping("insert.do")
    public ModelAndView selfInsert(SelfDTO selfdto) {
        int max_seq = service.maxSelfS();
        ModelAndView mv = new ModelAndView("self/intro_write");
        mv.addObject("max_seq", max_seq);
        return mv;
    }
    // @PostMapping("insertQA")
    // public String insertQA(SelfDTO selfdto){
    // service.insertQAS(selfdto);
    // return "redirect:select.do";
    // }

    // @GetMapping("insert2.do")
    // public String selfInsert2(){
    // return "selfInsertQA";
    // }

    @PostMapping("insert")
    @ResponseBody
    public String insertSelf(SelfDTO selfdto, String ques) {
        try {
            System.out.println(selfdto);
            System.out.println(ques);
            JSONParser parser = new JSONParser();
            JSONArray jsonQues = (JSONArray) parser.parse(ques);
            service.insertSelfS(selfdto, jsonQues);
        } catch (Exception e) {
            System.out.println("QUES Parse Exception" + e);
        }

        return "select.do";
    }

    @PostMapping("update.do")
    public String update(SelfDTO selfdto) {
        service.updateS(selfdto);
        return "redirect:select.do";
    }

    @GetMapping("select.do")
    public ModelAndView select() {
        // List<SelfDTO> list=service.selectS();
        List<SelfDTO> list = service.selectCompanyS();
        ModelAndView mv = new ModelAndView("self/selfList");
        mv.addObject("list", list);
        System.out.println("mv: " + mv);
        return mv;
    }

    @GetMapping("selectQA.do")
    public ModelAndView selectQA(SelfDTO selfdto) {
        // System.out.println(selfdto.getCo_seq());
        List<SelfDTO> list = service.selectQAS(selfdto);
        System.out.println("=========" + list + "===========");
        ModelAndView mv = new ModelAndView("self/selfList2");
        mv.addObject("list", list);
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

    @GetMapping("content")
    public String selfContentView(String seq) {
        System.out.println("#seq: " + seq);
        return null;
    }
}
