package com.gjob.backend.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDTO {
    private int review_seq;
    private int u_seq;
    private String company_name;
    private String review_title;
    private String review_content;
    private Date review_date;
    private int pass_hit; // 조회수 컬럼 추가-> alter table reviewboard add pass_hit int(10) default 0;
}
