package com.gjob.backend.controller;

import com.gjob.backend.model.ChatRoomDTO;
import com.gjob.backend.model.CompanyDTO;
import com.gjob.backend.service.ChatRoomRepository;
import com.gjob.backend.service.CompanyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
    private final ChatRoomRepository repository;

    @Autowired
    private CompanyService companyService;

    // 회원가입자만 공고별 채팅 가능하도록->spring security
    @GetMapping("/company/chat/{co_seq}")
    public ModelAndView check(@PathVariable String co_seq) {
        CompanyDTO companyDTO = companyService.selectBySeqS(co_seq);
        ModelAndView mv = new ModelAndView("chat-room/chat");

        if (repository.findRoomByName(co_seq) == null) {
            repository.createChatRoomDTO(co_seq);
            ChatRoomDTO chatRoomDTO = repository.findRoomByName(co_seq);
            System.out.println("#방 생성: " + chatRoomDTO.getName());
            mv.addObject("room", chatRoomDTO);
            mv.addObject("company", companyDTO);
        } else {
            ChatRoomDTO chatRoomDTO = repository.findRoomByName(co_seq);
            System.out.println("#존재하는 방: " + chatRoomDTO.getName());
            mv.addObject("room", chatRoomDTO);
            mv.addObject("company", companyDTO);
        }
        return mv;
    }
}
