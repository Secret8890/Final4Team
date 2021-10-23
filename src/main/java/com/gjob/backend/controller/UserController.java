package com.gjob.backend.controller;

import java.util.List;

import com.gjob.backend.config.auth.PrincipalDetails;
import com.gjob.backend.model.ApplyDTO;
import com.gjob.backend.model.ChatRoomDTO;
import com.gjob.backend.model.CompanyDTO;
import com.gjob.backend.service.ApplyService;
import com.gjob.backend.service.ChatRoomRepository;
import com.gjob.backend.service.CompanyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("user")
@RequiredArgsConstructor
public class UserController {
    private final ChatRoomRepository repository;

    @Autowired
    private CompanyService companyService;
    @Autowired
    private ApplyService applyService;

    // 공고별 채팅방 운영
    @GetMapping("/chat/{co_seq}")
    public ModelAndView check(@PathVariable String co_seq) {
        CompanyDTO companyDTO = companyService.selectBySeqS(co_seq);
        ModelAndView mv = new ModelAndView("chat-room/chat");

        if (repository.findRoomByName(co_seq) == null) {
            repository.createChatRoomDTO(co_seq);
        }
        ChatRoomDTO chatRoomDTO = repository.findRoomByName(co_seq);
        mv.addObject("room", chatRoomDTO);
        mv.addObject("company", companyDTO);
        return mv;
    }

    @GetMapping("aibot")
    public String view() {
        return "ai-bot/ai_index";
    }

    // 지원하기목록 (-> 추후 UserController 로 넘기기)
    @GetMapping("apply")
    public ModelAndView applyView(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        int u_seq = principalDetails.getMember().getU_seq();

        List<ApplyDTO> dto = applyService.listS(u_seq);
        ModelAndView mv = new ModelAndView("client/apply_list", "dto", dto);
        List<Boolean> read = applyService.readCheckS(u_seq);
        mv.addObject("read", read);
        System.out.println(read);
        return mv;
    }
}
