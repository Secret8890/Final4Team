package com.gjob.backend.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SelfDTO {
    private int qa_seq;
    private String qa_q;
    private String qa_a;
    private int u_seq;
    private String self_name;
    private int self_seq;
}
