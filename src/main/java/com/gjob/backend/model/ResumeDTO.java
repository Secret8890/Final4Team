package com.gjob.backend.model;


import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
    public class ResumeDTO {
    private int re_seq;
    private int u_seq;
    private String re_title;
    private String re_zipcode;
    private String re_address;
    private String re_high;
    private String re_highstatus;
    private Date re_highstartdate;
    private Date re_highenddate;
    private String re_univ;
    private String re_univstatus;
    private Date re_univsdate;
    private Date re_univedate;
    private String re_univgrade;
    private String re_univmajor;
    private String re_master;
    private String re_masterstatus;
    private Date re_mastersdate;
    private Date re_masteredate;
    private String re_mastergrade;
    private String re_mastermajor;
    private String re_status;
    private String re_military;
    private String re_birth;
    private String re_gender;
    private String re_phone;
    private String re_email;
    private String re_highmajor;
    private String re_name;
}