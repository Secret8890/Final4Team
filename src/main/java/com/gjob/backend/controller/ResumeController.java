package com.gjob.backend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gjob.backend.config.auth.PrincipalDetails;
import com.gjob.backend.model.ApplyDTO;
import com.gjob.backend.model.LanguageDTO;
import com.gjob.backend.model.LicenseDTO;
import com.gjob.backend.model.QuesDTO;
import com.gjob.backend.model.ResumeDTO;
import com.gjob.backend.model.SelfDTO;
import com.gjob.backend.service.ApplyService;
import com.gjob.backend.service.LanguageService;
import com.gjob.backend.service.LicenseService;
import com.gjob.backend.service.ResumeService;
import com.gjob.backend.service.SelfService;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("resume")
public class ResumeController {
    @Autowired
    private ResumeService resumeService;
    @Autowired
    private SelfService selfService;
    @Autowired
    private ApplyService applyService;
    @Autowired
    private LanguageService languageService;
    @Autowired
    private LicenseService licenseService;

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
    public ModelAndView edit(String re_seq) {
        ModelAndView mv = new ModelAndView("resume/resume_update");
        mv.addObject("map", resumeService.updateDetail(re_seq));
        return mv;
    }

    @PostMapping(value = "insert", produces = "application/json; charset=UTF8")
    public @ResponseBody boolean writeResume(ResumeDTO resume, String careers, String languages, String licenses) {
        JSONParser parser = new JSONParser();
        try {

            JSONArray jsonCareer = (JSONArray) parser.parse(careers);
            JSONArray jsonLicense = (JSONArray) parser.parse(licenses);
            JSONArray jsonLanguage = (JSONArray) parser.parse(languages);
            System.out.println(jsonCareer);
            System.out.println(jsonLanguage);
            System.out.println(jsonLicense);
            resumeService.insertResumeAll(resume, jsonCareer, jsonLanguage, jsonLicense);
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

    @PutMapping("update")
    @ResponseBody
    public boolean update(ResumeDTO resume, String careers, String languages, String licenses) {
        boolean flag = false;
        JSONParser parser = new JSONParser();
        System.out.println(languages);
        System.out.println(licenses);
        try {
            JSONArray careerArray = (JSONArray) parser.parse(careers);
            JSONArray languageArray = (JSONArray) parser.parse(languages);
            JSONArray licenseArray = (JSONArray) parser.parse(licenses);
            resumeService.updateResume(resume, careerArray, languageArray, licenseArray);
            flag = true;
        } catch (ParseException pe) {
            System.out.println("Resume Controller Parse Exception");
            flag = false;
        }
        return flag;
    }

    @GetMapping("intro_manage")
    public ModelAndView intro_manage(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        String u_seq = "";
        u_seq = String.valueOf(principalDetails.getMember().getU_seq());
        ModelAndView mv = new ModelAndView("resume/intro_manage");
        List<ResumeDTO> resumeList = resumeService.userSelectS(u_seq);
        mv.addObject("resumeList", resumeList);
        List<SelfDTO> selfList = selfService.userSelfS(u_seq);
        mv.addObject("selfList", selfList);
        return mv;
    }

    @GetMapping("apply")
    public ModelAndView applyView(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        int u_seq = principalDetails.getMember().getU_seq();
        
        List<ApplyDTO> dto = applyService.listS(u_seq);
        ModelAndView mv = new ModelAndView("client/apply_list", "dto", dto);
        List<Boolean> read = resumeService.readCheckS(u_seq);
        mv.addObject("read", read);
        System.out.println(read);
        return mv;
    }

    // 제출한 이력서&자기소개서 보기
    @GetMapping("content")
    public ModelAndView resumeContentView(String self_seq, String re_seq) {
        ModelAndView mv = new ModelAndView("client/apply_content");
        mv.addObject("map", resumeService.applyResumeDetail(re_seq));
        
        SelfDTO dto = new SelfDTO();
        dto.setSelf_seq(Integer.parseInt(self_seq));
        List<QuesDTO> quesList = selfService.QuesDetailS(dto);
        SelfDTO detailSelf = selfService.SelfDetailApplyS(dto);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("self", detailSelf);
        map.put("quesList", quesList);
        mv.addObject("map1", map);
        return mv;
    }
    @GetMapping("re_content")
    public ModelAndView re_content(@RequestParam int re_seq){
        ResumeDTO redto = resumeService.contentS(re_seq);
        ModelAndView mv = new ModelAndView("resume/content","content",redto);
        LanguageDTO langdto = languageService.listS(re_seq);
        LicenseDTO lidto = licenseService.listS(re_seq);
        resumeService.isCheckS(re_seq);
        mv.addObject("langdto", langdto);
        mv.addObject("lidto", lidto);
        return mv;
    }

}