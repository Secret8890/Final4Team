package com.gjob.backend.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
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

    public List<ChatRoomDTO> findAllRooms() {
        List<ChatRoomDTO> result = new ArrayList<>(chatRoomMap.values());
        Collections.reverse(result);

        return result;
    }

    public ChatRoomDTO findRoomById(String id) {
        return chatRoomMap.get(id);
    }

    public ChatRoomDTO findRoomByName(String name) {
        System.out.println("#repository findRoomByName: " + chatRoomMap.get(name));
        return chatRoomMap.get(name);
    }

    public ChatRoomDTO createChatRoomDTO(String name) {
        ChatRoomDTO room = ChatRoomDTO.create(name);
        chatRoomMap.put(room.getName(), room);
        System.out.println("방 개수: " + chatRoomMap.size());
        return room;
    }
}
