package com.gjob.backend.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApplyDTO {
    private int u_seq;
    private int co_seq;
    private Date apply_date;
    private int re_seq;
    private int self_seq;
    private String co_title;
}

// table 생성문
// create table APPLY(
// U_SEQ int(10),
// CO_SEQ int(10),
// APPLY_DATE DATE,
// RE_SEQ int(10),
// SELF_SEQ int(10),
// FOREIGN KEY (U_SEQ) REFERENCES MEMBER(U_SEQ),
// FOREIGN KEY (CO_SEQ) REFERENCES COMPANY(CO_SEQ),
// FOREIGN KEY (RE_SEQ) REFERENCES RESUME(RE_SEQ),
// FOREIGN KEY (SELF_SEQ) REFERENCES SELFINTRO(SELF_SEQ)
// );