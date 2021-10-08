package com.gjob.backend.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompanyDTO {
    private String co_seq; // 공고번호
    private String co_name; // 회사명
    private String co_name_href; // 회사url
    private String co_title; // 공고명
    private String co_job_mid_name; // alter table company add CO_JOB_MID_NAME varchar(1000); 컬럼 추가 //상위 직무명
    private String co_job_name; // 직무명
    private String co_location_name; // 지역
    private String co_career; // 신입 경력
    private String co_start_date; // 시작일
    private String co_end_date; // 마감일
    private String co_url; // 공고url
    private int co_read_count;
    private String co_salary; // 연봉 alter table company add CO_SALARY varchar(1000);
    private String co_job_type; // 근무형태 alter table company add CO_JOB_TYPE varchar(1000);
}
