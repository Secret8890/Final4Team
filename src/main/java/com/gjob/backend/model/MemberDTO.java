package com.gjob.backend.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
    private int u_seq;
    private String u_id;
    private String u_password;
    private String u_name;
    private String u_gender;
    private String u_birth;
    private String u_job;
    private String u_degree;
    private String u_email;
    private String u_major;
    private String u_phone;
    private String u_career;
    private String u_provider;
    private String isManager;
    private String u_lastschool;
    private Date u_memberSince; // alter table member add U_MemberSince DATE; ->10월 19일 추가된 컬럼
    private int countMember;

    @Builder
    public MemberDTO(String u_id, String u_password, String u_name, String u_gender, String u_birth, String u_email,
            String u_provider, String isManager, Date u_memberSince) {
        this.u_id = u_id;
        this.u_password = u_password;
        this.u_name = u_name;
        this.u_gender = u_gender;
        this.u_birth = u_birth;
        this.u_email = u_email;
        this.u_provider = u_provider;
        this.isManager = isManager;
        this.u_memberSince = u_memberSince;
    }
}
