package com.gjob.backend.service;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import com.gjob.backend.model.ChatRoomDTO;

import org.springframework.stereotype.Repository;

@Repository
public class ChatRoomRepository {
    private Map<String, ChatRoomDTO> chatRoomMap;

    @PostConstruct
    private void init() {
        chatRoomMap = new LinkedHashMap<>();
    }

    // 채팅방 생성 여부 확인
    public ChatRoomDTO findRoomByName(String name) {
        return chatRoomMap.get(name);
    }

    // 채팅방 생성
    public ChatRoomDTO createChatRoomDTO(String name) {
        ChatRoomDTO room = ChatRoomDTO.create(name);
        chatRoomMap.put(room.getName(), room);
        return room;
    }
}
