package com.gjob.backend.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuesDTO {
    private int self_seq;
    private int qa_seq;
    private String qa_q;
    private String qa_a;    
}