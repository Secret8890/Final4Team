package com.gjob.backend.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import netscape.javascript.JSObject;

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
    public String write() {
        return "resume/resume_write";
    }
    @GetMapping("edit")
    public String edit(int re_seq){
        return "resume/resume_write";
    }

    @PostMapping(value = "write" , produces = "application/json; charset=UTF8")
    public @ResponseBody boolean writeResume(ResumeDTO resume, String careers, String languages,String licenses) {
        
        JSONParser parser = new JSONParser();
        try{
            
            JSONArray jsonCareer = (JSONArray) parser.parse(careers);
            JSONArray jsonLicense = (JSONArray) parser.parse(licenses);
            JSONArray jsonLanguage = (JSONArray)parser.parse(languages);
            System.out.println(jsonCareer);
            System.out.println(jsonLanguage);
            System.out.println(jsonLicense);
            service.insertResumeAll(resume,jsonCareer,jsonLanguage,jsonLicense);
            
        } catch (Exception e) {
            System.out.println(e + "Controller Parse Exception");
        }
        
        return true;
    }

    @GetMapping("del.do")
    public String delete(int re_seq) {
        service.deleteS(re_seq);
        return "redirect:list";
    }

    @GetMapping("intro_manage.do")
    public String intro_manage() {
        return "resume/intro_manage";
    }
}