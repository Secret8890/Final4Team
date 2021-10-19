package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.model.MemberDTO;

public interface MemberService {
    void joinS(MemberDTO member);

    MemberDTO findByIdS(String u_id);

    void additionalS(MemberDTO member);

    boolean emailCheckS(MemberDTO member);

    List<MemberDTO> findByEmailS(String u_email);

    void changePwdS(String u_password, String u_email);

    void updateInfoS(MemberDTO member);

    List<MemberDTO> getUserJoinS();

    int getUserCountS();
}
