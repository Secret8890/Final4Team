package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.model.*;

public interface ChatBotService {
    List<ChatBotDTO> listS(int u_seq);
    void insertS(ChatBotDTO chatbotdto);
    List<ChatBotDTO> selectContentS(int u_seq, int interview_seq);
}
