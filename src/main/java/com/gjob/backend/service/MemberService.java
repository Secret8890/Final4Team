package com.gjob.backend.service;

import java.util.List;
import java.util.Map;

import com.gjob.backend.model.MemberDTO;
import com.gjob.backend.model.UniversityAndMajorDTO;

public interface MemberService {
    void joinS(MemberDTO member, String u_birthyear, String u_birthmonth, String u_birthdate);

    MemberDTO findByIdS(String u_id);

    int findByEmailS(String u_email);

    String checkIDS(String u_email);

    Map<String, Boolean> findPwdS(MemberDTO dto);

    void changePwdS(String u_password, String u_email);

    void updateInfoS(MemberDTO member);

    void additionalS(MemberDTO member);

    boolean emailCheckS(MemberDTO member);

    List<MemberDTO> getUserJoinS();

    int getUserCountS();

    List<MemberDTO> selectMemberS();

    void updateGrantS(MemberDTO memberdto);

    List<MemberDTO> selectAjaxS(Map<String, Object> map);

    MemberDTO selectBySeqS(int u_seq);

    List<UniversityAndMajorDTO> searchUNIVS(String univ_name);

    List<UniversityAndMajorDTO> searchMAJORS(String major_name);
}
