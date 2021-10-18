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

    // StompWebSocketConfig.java에서 설정한 prefix와 @Message 경로가 병합됨.
    // app/chat/enter
    @MessageMapping("/chat/enter")
    public void enter(ChatMessageDTO message) {
        message.setMessage(message.getWriter() + "님이 채팅방에 참여하였습니다.");
        template.convertAndSend("/topic/chat/room/" + message.getRoomId(), message);
        System.out.println("#message: " + message.getRoomId());
        // System.out.println("#입장 메시지: " + message);
        // '/sub/chat/room/[roomId]'->채팅방 구분
    }

    @MessageMapping("/chat/message")
    public void message(ChatMessageDTO message) {
        template.convertAndSend("/topic/chat/room/" + message.getRoomId(), message);
        // System.out.println("#들어온 메시지: " + message);
    }
}
