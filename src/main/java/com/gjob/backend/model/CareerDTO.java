package com.gjob.backend.model;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class CareerDTO {
    private int ca_seq;
    private int re_seq;
    private String ca_co_name;
    private String ca_position;
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date ca_start;
    private Date ca_end;
    private String ca_duration;
    private String ca_dept;
    private String ca_work;
}
