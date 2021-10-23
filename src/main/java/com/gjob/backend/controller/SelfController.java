package com.gjob.backend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gjob.backend.model.QuesDTO;
import com.gjob.backend.model.SelfDTO;
import com.gjob.backend.service.SelfService;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SelfController {

    @Autowired
    SelfService service;


    // 자소서 글쓰기폼 요청
    @GetMapping("self/insert")
    public String selfInsert(SelfDTO selfdto) {
        return "self/intro_write";
    }
    // 자소서 글쓰기 DB 요청
    @PostMapping("self")
    @ResponseBody
    public boolean insertSelf(SelfDTO selfdto, String ques) {
        boolean flag = false;
        try {
            JSONParser parser = new JSONParser();
            JSONArray jsonQues = (JSONArray) parser.parse(ques);
            service.insertSelfS(selfdto, jsonQues);
            flag = true;
        } catch (Exception e) {
            System.out.println("QUES Parse Exception" + e);
            flag = false;
        }
        return flag;
    }

    //자소서 삭제 요청
    @DeleteMapping("self")
    @ResponseBody
    public boolean deleteSelf(int self_seq) {
        boolean flag = false; 
        try {
           service.deleteSelfS(self_seq);
           flag = true;
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    //자소서 수정폼 요청
    @GetMapping("self/update")
    public ModelAndView selfUpdateForm(SelfDTO self) {
        System.out.println(self.getSelf_seq());
        ModelAndView mv = new ModelAndView("self/intro_update");
        List<QuesDTO> quesList = service.quesDetailS(self.getSelf_seq());
        SelfDTO detailSelf = service.SelfDetailS(self);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("self",detailSelf);
        map.put("quesList",quesList);
        mv.addObject("map", map);
        return mv;
    }

    //데이터베이스 self, ques 수정요청
    @PutMapping("self")
    @ResponseBody
    public boolean selfUpdate(SelfDTO self, String quesArr, int count) {
        boolean flag = false;
        try{
            service.updateS(self, quesArr,count);
            flag = true;
        } catch(Exception e) {
            flag = false;
        }
        return flag;
    }

    // 자소서 상세내용 요청
    @GetMapping("self_content")
    public ModelAndView content(@RequestParam int self_seq){
        List<QuesDTO> quesdto = service.contentS(self_seq);
        service.isCheckS(self_seq);
        ModelAndView mv = new ModelAndView("self/content","content",quesdto);
        return mv;
    }
}
