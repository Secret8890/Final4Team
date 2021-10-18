package com.gjob.backend.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CrawlingDTO {
    private int cl_seq;
    private int co_seq;
    private String cl_recruitment;
    private String cl_workingconditions;
    private String cl_screeningproce;
    private String cl_applicationperiod;
    private String cl_notice;
    private String cl_img;
    private String cl_iframe;
    private String cl_status;
}