package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.mapper.MemberMapper;
import com.gjob.backend.model.MemberDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper mapper;

    @Override
    public void joinS(MemberDTO member) {
        mapper.join(member);
    }

    @Override
    public MemberDTO findByIdS(String u_id) {
        return mapper.findById(u_id);
    }

    @Override
    public void additionalS(MemberDTO member) {
        mapper.additional(member);
    }

    @Override
    public boolean emailCheckS(MemberDTO member) {
        if (mapper.emailCheck(member).isEmpty()) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public List<MemberDTO> findByEmailS(String u_email) {
        return mapper.findByEmail(u_email);
    }

    @Override
    public void changePwdS(String u_password, String u_email) {
        mapper.changePwd(u_password, u_email);
    }
    
    @Override
    public void updateInfoS(MemberDTO member) {
        mapper.updateInfo(member);
    }
}