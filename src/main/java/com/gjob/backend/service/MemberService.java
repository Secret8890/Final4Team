package com.gjob.backend.service;

import com.gjob.backend.model.MemberDTO;

public interface MemberService {
    void joinS(MemberDTO member);

    MemberDTO findByIdS(String u_id);

    void additionalS(MemberDTO member);

    boolean emailCheckS(MemberDTO member);

    MemberDTO findByEmailS(String u_email);

    void changePwdS(String u_password, String u_email);
}
