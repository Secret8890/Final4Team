package com.gjob.backend.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SelfDTO {
    private int u_seq;
    private String self_name;
    private int self_seq;
    private int max_seq;
}
