package com.gjob.backend.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class LanguageDTO {
    private int la_seq;
    private String la_test_name;
    private int re_seq;
    private String la_score;
    private String la_date;
}
