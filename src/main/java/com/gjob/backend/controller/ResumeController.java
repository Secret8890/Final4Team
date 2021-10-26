package com.gjob.backend.controller;

import java.util.*;
import com.gjob.backend.model.*;
import com.gjob.backend.service.*;
import com.gjob.backend.config.auth.PrincipalDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResumeController {
    @Autowired
    private ResumeServiceImpl resumeService; //이력서 서비스
    @Autowired
    private SelfService selfService; // 자소서 서비스
    @Autowired
    private ApplyService applyService; // 입사지원 서비스
    //이력서 작성
    @GetMapping("resume/write")
    public String write() {
        return "resume/resume_write";
    }

    //작성한 이력서 수정
    @GetMapping("resume/update")
    public ModelAndView edit(int re_seq) {
        ModelAndView mv = new ModelAndView("resume/resume_update");
        mv.addObject("map", resumeService.resumeDetail(re_seq));
        return mv;
    }

    //작성한 이력서 DB 인서트작업
    @PostMapping("resume")
    public @ResponseBody boolean writeResume(@AuthenticationPrincipal PrincipalDetails principalDetails,ResumeDTO resume, String careers, String languages, String licenses) {
        boolean flag = false;
        resume.setU_seq(principalDetails.getMember().getU_seq());
        try {
            resumeService.insertResumeAll(resume, careers, languages, licenses);
            flag = true;
        } catch (Exception e) {
            System.out.println(e + "Controller Parse Exception");
            flag = false;
        }

        return flag;
    }

    // 이력서 삭제작업
    @DeleteMapping("resume")
    @ResponseBody
    public boolean delete(int re_seq) {
        resumeService.deleteS(re_seq);
        return true;
    }

    // 이력서 업데이트 DB 적용
    @PutMapping("resume")
    @ResponseBody
    public boolean update(@AuthenticationPrincipal PrincipalDetails principalDetails,ResumeDTO resume, String careers, String languages, String licenses) {
        boolean flag = false;
        resume.setU_seq(principalDetails.getMember().getU_seq());
        try {
            resumeService.updateResume(resume, careers, languages, licenses);
            flag = true;
        } catch(Exception e) {
            System.out.println(e);
            flag = false;
        }
        return flag;
    }

    //이력서 관리에서 유저단위로 보여줄 이력서
    @GetMapping("resume/intro_manage")
    public ModelAndView intro_manage(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        int u_seq = principalDetails.getMember().getU_seq();
        ModelAndView mv = new ModelAndView("resume/intro_manage");
        List<ResumeDTO> resumeList = resumeService.userSelectS(u_seq);
        mv.addObject("resumeList", resumeList);
        List<SelfDTO> selfList = selfService.userSelfS(u_seq);
        mv.addObject("selfList", selfList);
        return mv;
    }

    // 제출한 이력서&자기소개서 보기
    @GetMapping("resume/content")
    public ModelAndView resumeContentView(SelfDTO self, int re_seq) {
        ModelAndView mv = new ModelAndView("client/apply_content");
        mv.addObject("map", resumeService.resumeDetail(re_seq));
        
        List<QuesDTO> quesList = selfService.quesDetailS(self.getSelf_seq());
        SelfDTO detailSelf = selfService.SelfDetailApplyS(self);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("self", detailSelf);
        map.put("quesList", quesList);
        mv.addObject("map1", map);
        return mv;
    }

    //기업입장 이력서 상세 컨텐츠보기
    @GetMapping("re_content")
    public ModelAndView re_content(@RequestParam int re_seq){
        Map<String, Object> map = new HashMap<String, Object>();
        // 해당이력서 번호의 모든내용을 가져오는 메소드 호출.
        map = resumeService.resumeDetail(re_seq);
        ModelAndView mv = new ModelAndView("resume/content","map",map);
        System.out.println("CONTENT MAP" + map);
        //이력서 읽음 처리
        applyService.isCheckS(re_seq);
        return mv;
    }
    
    @GetMapping("resume/index")
    public String selfIndex() {
        return "/resume/intro_main";
    }

}