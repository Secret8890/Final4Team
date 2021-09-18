package com.gjob.backend.model;

import lombok.AllArgsConstructor;
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
    private String u_carrer;
    private String u_address;
    private String u_provider;
    private String isManager;
    //치영
}
