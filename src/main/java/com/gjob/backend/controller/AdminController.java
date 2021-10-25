package com.gjob.backend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gjob.backend.model.ChatBotDTO;
import com.gjob.backend.model.MemberDTO;
import com.gjob.backend.model.Pager;
import com.gjob.backend.model.PassboardDTO;

import com.gjob.backend.service.ChatBotService;

import com.gjob.backend.service.IncruitService;
import com.gjob.backend.service.MemberService;
import com.gjob.backend.service.PassboardService;
import com.gjob.backend.service.ResumeService;
import com.gjob.backend.service.SelfService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
    private IncruitService companyService;
    private ChatBotService chatbotService;

    @GetMapping("/passboard/list")
    public String passboardView() {
        return "admin/admin_passboard_list";
    }

    // 합격자소서 글 가져오기
    @GetMapping("/passboard/listGet")
    public @ResponseBody Map<String, Object> passboardList(@RequestParam(defaultValue = "1") int pageNum) {
        int totalBoard = passboardService.selectCountS();
        int pageSize = 20;
        int blockSize = 4;

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
    public String passboardUploadView() {
        return "admin/admin_passboard_upload";
    }

    // 합격자소서 글 올리기
    @PostMapping("/passboard/upload")
    public @ResponseBody String passboardUpload(@RequestBody PassboardDTO passboard) {
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

    // 합격자소서 글 수정
    @PutMapping("/passboard/content/{pass_seq}/update")
    public @ResponseBody String passboardUpdate(@PathVariable String pass_seq, @RequestBody PassboardDTO passboard) {
        passboardService.updateS(passboard);
        return "SUCCESS";
    }

    // 합격자소서 글 삭제
    @DeleteMapping("/passboard/delete")
    public @ResponseBody String passboardDelete(String pass_seq) {
        passboardService.delete(Integer.parseInt(pass_seq));
        return "DELETE";
    }

    @GetMapping("/statistics")
    public String passDash() {
        return "admin/admin_dash";
    }

    // 차트 정보
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
        map.put("ailist", aiCount);
        return map;
    }

    @GetMapping("/usermanagement")
    public String usermanagementView() {
        return "admin/admin_user_management";
    }

    // 회원 권한 변경
    @PutMapping("/updateUserGrant")
    @ResponseBody
    public void updateUserGrant(MemberDTO memberdto) {
        memberService.updateGrantS(memberdto);

    }

    // 가입한 회원 정보 가져오기 (페이징)
    @GetMapping("/userListGet")
    public @ResponseBody Map<String, Object> userList(@RequestParam(defaultValue = "1") int pageNum) {
        int totalBoard = memberService.getUserCountS();
        int pageSize = 15; // 한 페이지에 들어갈 글 개수
        int blockSize = 4; // 한 라인에 1-4까지보임

        Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

        Map<String, Object> pagerMap = new HashMap<String, Object>();
        pagerMap.put("startRow", pager.getStartRow());
        pagerMap.put("endRow", pager.getEndRow());

        Map<String, Object> returnMap = new HashMap<String, Object>();
        returnMap.put("board", memberService.selectAjaxS(pagerMap));
        returnMap.put("pager", pager);

        return returnMap;
    }

    // 데이터를 DB에 저장 (admin 페이지에 버튼 달아주세요)
    @GetMapping("/list/save")
    public String notice2save() {
        companyService.createUrl("0");
        return "redirect:/";
    }
}
