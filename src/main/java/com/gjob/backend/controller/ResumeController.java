package com.gjob.backend.controller;

import java.util.List;

import com.gjob.backend.model.ResumeDTO;
import com.gjob.backend.model.SelfDTO;
import com.gjob.backend.service.ResumeService;
import com.gjob.backend.service.SelfService;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("resume")
public class ResumeController {
    @Autowired
    private ResumeService resumeService;
    @Autowired
    private SelfService selfService;

    @GetMapping("list")
    public ModelAndView list() {
        List<ResumeDTO> list = resumeService.listS();
        ModelAndView mv = new ModelAndView("resume/list", "list", list);
        return mv;
    }

    @GetMapping("write.do")
    public String write() {
        return "resume/resume_write";
    }

    @GetMapping("edit")
    public ModelAndView edit(String re_seq){
        ModelAndView mv = new ModelAndView("resume/resume_update");
        mv.addObject("map", resumeService.updateDetail(re_seq));
        return mv;
    }
    @PostMapping(value = "write" , produces = "application/json; charset=UTF8")
    public @ResponseBody boolean writeResume(ResumeDTO resume, String careers, String languages,String licenses) {
        JSONParser parser = new JSONParser();
        try {

            JSONArray jsonCareer = (JSONArray) parser.parse(careers);
            JSONArray jsonLicense = (JSONArray) parser.parse(licenses);
            JSONArray jsonLanguage = (JSONArray) parser.parse(languages);
            System.out.println(jsonCareer);
            System.out.println(jsonLanguage);
            System.out.println(jsonLicense);
            resumeService.insertResumeAll(resume,jsonCareer,jsonLanguage,jsonLicense);
        } catch (Exception e) {
            System.out.println(e + "Controller Parse Exception");
        }

        return true;
    }

    @DeleteMapping("delete")
    @ResponseBody
    public boolean delete(int re_seq) {
        resumeService.deleteS(re_seq);
        return true;
    }
    @PutMapping ("update")
    @ResponseBody
    public boolean update(ResumeDTO resume, String careers, String languages,String licenses) {
        boolean flag = false;
        JSONParser parser = new JSONParser();
        System.out.println(languages);
        System.out.println(licenses);
        try {
            JSONArray careerArray =(JSONArray) parser.parse(careers);
            JSONArray languageArray =(JSONArray) parser.parse(languages);
            JSONArray licenseArray =(JSONArray) parser.parse(licenses);
            resumeService.updateResume(resume, careerArray, languageArray, licenseArray);
            flag = true;
        } catch (ParseException pe) {
            System.out.println("Resume Controller Parse Exception");
            flag = false;
        }
        return flag;
    }
    @GetMapping("intro_manage")
    public ModelAndView intro_manage(String u_seq) {
        ModelAndView mv = new ModelAndView("resume/intro_manage");
        List<ResumeDTO> resumeList = resumeService.userSelectS(u_seq);
        mv.addObject("resumeList", resumeList);
        List<SelfDTO> selfList = selfService.userSelfS(u_seq);
        mv.addObject("selfList", selfList);
        return mv;
    }
}