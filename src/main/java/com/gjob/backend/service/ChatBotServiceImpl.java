package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.mapper.ChatBotMapper;
import com.gjob.backend.model.ChatBotDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatBotServiceImpl implements ChatBotService {
    @Autowired
    private ChatBotMapper mapper;

    @Override
    public List<ChatBotDTO> listS(int u_seq) {
        return mapper.list(u_seq);
    }

    @Override
    public List<ChatBotDTO> selectContentS(int u_seq, int interview_seq) {
        return mapper.selectContent(u_seq, interview_seq);
    }

}
