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
    private int co_seq;
    private String review_title;
    private String review_content;
    private Date review_date;
}
