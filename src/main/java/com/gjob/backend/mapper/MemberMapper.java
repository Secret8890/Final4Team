package com.gjob.backend.mapper;

import com.gjob.backend.model.MemberDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberMapper {
    void join(MemberDTO member);

    MemberDTO findById(String u_id);

    void additional(MemberDTO member);

    MemberDTO emailCheck(MemberDTO member);

    void changePwd(String u_password, String u_email);

    MemberDTO findByEmail(String u_email);
}
