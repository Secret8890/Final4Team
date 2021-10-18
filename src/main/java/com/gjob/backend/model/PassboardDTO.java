package com.gjob.backend.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PassboardDTO {
    private int pass_seq;
    private String pass_title; // 제목
    private String pass_company; // 기업명
    private String pass_career; // 신입/경력
    private String pass_job; // 지원분야
    private String pass_univ; // 학교
    private String pass_grade; // 학점
    private String pass_toeic; // 토익
    private String pass_content; // 내용
    private int pass_hit; // 조회수 컬럼 추가-> alter table PASSBOARD add pass_hit int(10) default 0;
}