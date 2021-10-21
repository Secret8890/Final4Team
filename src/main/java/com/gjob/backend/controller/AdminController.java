package com.gjob.backend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.gjob.backend.model.ChatBotDTO;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import com.gjob.backend.model.MemberDTO;
import com.gjob.backend.model.Pager;
import com.gjob.backend.model.PassboardDTO;
import com.gjob.backend.service.ChatBotService;
import com.gjob.backend.service.CompanyService;
import com.gjob.backend.service.MemberService;
import com.gjob.backend.service.PassboardService;
import com.gjob.backend.service.ResumeService;
import com.gjob.backend.service.SelfService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;

@RequestMapping("/admin")
@Controller
@AllArgsConstructor
public class AdminController {
    private PassboardService passboardService;
    private MemberService memberService;
    private ResumeService resumeService;
    private SelfService selfService;
    private CompanyService companyService;
    private ChatBotService chatbotService;

    @GetMapping("/passboard/list")
    public String passboardListView() {
        return "admin/admin_passboard_list";
    }

    @GetMapping("/passboard/listGet")
    public @ResponseBody Map<String, Object> passboardList(@RequestParam(defaultValue = "1") int pageNum) {
        int totalBoard = passboardService.selectCountS();
        int pageSize = 20; // 한 페이지에 들어갈 글 개수
        int blockSize = 4; // 한 라인에 1-4까지보임

        Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

        Map<String, Object> pagerMap = new HashMap<String, Object>();
        pagerMap.put("startRow", pager.getStartRow());
        pagerMap.put("endRow", pager.getEndRow());

        Map<String, Object> returnMap = new HashMap<String, Object>();
        returnMap.put("board", passboardService.selectAjaxS(pagerMap));
        returnMap.put("pager", pager);

        return returnMap;
    }

    @GetMapping("/passboard/upload")
    public String adminUploadView() {
        return "admin/admin_passboard_upload";
    }

    @PostMapping("/passboard/upload")
    public @ResponseBody String adminUpload(@RequestBody PassboardDTO passboard) {
        passboardService.insertS(passboard);
        return "SUCCESS";
    }

    @GetMapping("/passboard/content/{pass_seq}")
    public ModelAndView passboardContentView(@PathVariable String pass_seq) {
        int pass_seq_num = Integer.parseInt(pass_seq);
        PassboardDTO dto = passboardService.selectBySeqS(pass_seq_num);
        ModelAndView mv = new ModelAndView("admin/admin_passboard_content", "dto", dto);
        return mv;
    }

    @GetMapping("/passboard/content/{pass_seq}/update")
    public ModelAndView passboardUpdateView(@PathVariable String pass_seq) {
        int pass_seq_num = Integer.parseInt(pass_seq);
        PassboardDTO dto = passboardService.selectBySeqS(pass_seq_num);
        String str2 = dto.getPass_content().replace("<br/>", "\r\n");
        dto.setPass_content(str2);
        ModelAndView mv = new ModelAndView("admin/admin_passboard_update", "dto", dto);
        return mv;
    }

    @PostMapping("/passboard/content/{pass_seq}/update")
    public @ResponseBody String passboardUpdate(@PathVariable String pass_seq, @RequestBody PassboardDTO passboard) {
        passboardService.updateS(passboard);
        return "SUCCESS";
    }

    @PostMapping("/passboard/delete")
    public @ResponseBody String passboardDelete(String pass_seq) {
        int pass_seq_num = Integer.parseInt(pass_seq);
        passboardService.delete(pass_seq_num);
        return "DELETE";
    }

    @GetMapping("passboard/dash")
    public String passDash() {
        return "admin/admin_dash";
    }

    @GetMapping("/getChartInfo")
    public @ResponseBody Map<String, Object> getUser() {
        Map<String, Object> map = new HashMap<String, Object>();
        // 총 회원수
        int totalMember = memberService.getUserCountS();
        map.put("totalMember", totalMember);
        // 회원이 작성한 총 이력서 개수
        int totalResume = resumeService.getResumeCountS();
        map.put("totalResume", totalResume);
        // 회원이 작성한 총 자소서 개수
        int totalSelf = selfService.getSelfCountS();
        map.put("totalSelf", totalSelf);
        // 오늘 올라온 공고 개수
        int totalIncruit = companyService.getTodayIncruitCountS();
        map.put("totalIncruit", totalIncruit);
        // 일주일 간 가입한 사용자 수 정보
        List<MemberDTO> list = memberService.getUserJoinS();
        map.put("list", list);
        // AI 챗봇 사용량 카운트
        List<ChatBotDTO> aiCount = chatbotService.aiCountS();
        map.put("totalAichatbot", aiCount);
        System.out.println("aiCount: "+aiCount);
        
        return map;
    }
    @GetMapping("/usermanagement")
    public ModelAndView selectUser(){
        List<MemberDTO> list=memberService.selectMemberS();
        System.out.println("!!!!!!!!!!!!!list : " + list);
        ModelAndView mv=new ModelAndView("admin/admin_user_management");
        mv.addObject("list", list);
        return mv;
    }
    @PostMapping("/updateAdmin")
    @ResponseBody
    public void updateAdmin(int u_seq){
        memberService.updateAdminS(u_seq);
       ;
    }
    @PostMapping("/updateUser")
    @ResponseBody
    public void updateUser(int u_seq){
        memberService.updateUserS(u_seq);
       
    }
    @PostMapping("/updateBlack")
    @ResponseBody
    public void updateBlack(int u_seq){
        memberService.updateBlackS(u_seq);
        
    }
}
