package com.gjob.backend.service;

import java.util.List;
import java.util.Map;

import com.gjob.backend.model.MemberDTO;

public interface MemberService {
    void joinS(MemberDTO member, String u_birthyear, String u_birthmonth, String u_birthdate);

    MemberDTO findByIdS(String u_id);

    int findByEmailS(String u_email);

    String checkIDS(String u_email);

    Map<String, Boolean> findPwdS(MemberDTO dto);

    void changePwdS(String u_password, String u_email);

    void updateInfoS(MemberDTO member);

    void additionalS(MemberDTO member);

    // 사용

    boolean emailCheckS(MemberDTO member);

    List<MemberDTO> getUserJoinS();

    int getUserCountS();

    List<MemberDTO> selectMemberS();

    void updateGrantS(MemberDTO memberdto);
}
