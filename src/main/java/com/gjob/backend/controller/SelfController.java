package com.gjob.backend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gjob.backend.model.*;
import com.gjob.backend.service.SelfService;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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

    @PostMapping("insert")
    @ResponseBody
    public String insertSelf(SelfDTO selfdto, String ques) {
        try {
            JSONParser parser = new JSONParser();
            JSONArray jsonQues = (JSONArray) parser.parse(ques);
            service.insertSelfS(selfdto, jsonQues);
        } catch (Exception e) {
            System.out.println("QUES Parse Exception" + e);
        }

        return "select.do";
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
    @GetMapping("update")
    public ModelAndView selfUpdateForm(SelfDTO self) {
        ModelAndView mv = new ModelAndView("self/intro_update");
        List<QuesDTO> quesList = service.QuesDetailS(self);
        SelfDTO detailSelf = service.SelfDetailS(self);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("self",detailSelf);
        map.put("quesList",quesList);
        mv.addObject("map", map);
        return mv;
    }
    @PutMapping("update")
    @ResponseBody
    public boolean selfUpdate(SelfDTO self, String quesArr, int count) {
        boolean flag = false;
        try{
            System.out.println(count);
            service.updateS(self, quesArr,count);
            flag = true;
        } catch(Exception e) {
            flag = false;
        }
        return flag;
    }
}
