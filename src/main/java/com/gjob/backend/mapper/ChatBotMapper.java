package com.gjob.backend.mapper;


import com.gjob.backend.model.ChatBotDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ChatBotMapper {
    void insert(ChatBotDTO chatbotdto);
}
