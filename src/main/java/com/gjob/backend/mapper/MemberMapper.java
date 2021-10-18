package com.gjob.backend.mapper;

import java.util.List;

import com.gjob.backend.model.MemberDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberMapper {
    void join(MemberDTO member);

    MemberDTO findById(String u_id);

    void additional(MemberDTO member);

    List<MemberDTO> emailCheck(MemberDTO member);

    List<MemberDTO> emailCheckByOnlyEmail(String u_email);

    void changePwd(String u_password, String u_email);

    List<MemberDTO> findByEmail(String u_email);

    void updateInfo(MemberDTO member);

    List<MemberDTO> getUserJoin();
}
