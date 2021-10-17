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
    private String cl_1;
    private String cl_2;
    private String cl_3;
    private String cl_4;
    private String cl_5;
    private String cl_img;
    private String cl_iframe;
    private String cl_status;
}

// alter table crawling modify cl_iframe MEDIUMBLOB default null;