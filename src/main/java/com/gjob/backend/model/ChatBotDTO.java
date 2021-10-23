package com.gjob.backend.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatBotDTO {
    private int u_seq;
    private int interview_seq;
    private int chat_seq;
    private String chat_q;
    private String chat_a;
    private Date chat_date;
    private int aiCount; // admin 페이지 조회수 뷰 추가
}