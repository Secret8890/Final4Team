package com.gjob.backend.controller;

import com.gjob.backend.model.ChatMessageDTO;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatController {
    private final SimpMessagingTemplate template;

    // 사용자가 처음 채팅 사용시
    @MessageMapping("/chat/enter")
    public void enter(ChatMessageDTO message) {
        message.setMessage(message.getNick() + "님이 채팅방에 참여하였습니다.");
        template.convertAndSend("/topic/chat/room/" + message.getRoomId(), message);
    }

    // 사용자들간의 대화 receive&send
    @MessageMapping("/chat/message")
    public void message(ChatMessageDTO message) {
        template.convertAndSend("/topic/chat/room/" + message.getRoomId(), message);
    }
}
