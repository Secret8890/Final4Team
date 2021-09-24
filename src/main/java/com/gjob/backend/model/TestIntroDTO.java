package com.gjob.backend.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TestIntroDTO {
    private long seq;
    private String subject;
    private String combo;
    private String combo_title;
    private String content;
}
