package com.gjob.backend.mapper;

import java.util.List;

import com.gjob.backend.model.ChatBotDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ChatBotMapper {
    List<ChatBotDTO> list(int u_seq);

    List<ChatBotDTO> selectContent(int u_seq, int interview_seq);
}