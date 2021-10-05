package com.gjob.backend.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LicenseDTO {
    private String li_name;
    private int re_seq;
    private String li_agency;
    private String li_date;
}
