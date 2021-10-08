package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.mapper.SelfMapper;
import com.gjob.backend.model.SelfDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SelfServiceImpl implements SelfService {
    @Autowired
    SelfMapper mapper;

    @Override
    public void insertSelfS(SelfDTO selfdto){
        mapper.insertSelf(selfdto);
        
    }

    @Override
    public void insertQAS(SelfDTO selfdto){
        mapper.insertQA(selfdto);
    }

    @Override
    public List<SelfDTO> selectCompanyS(){
        return mapper.selectCompany();
    }

    @Override
    public List<SelfDTO> selectQAS(SelfDTO selfdto){
        return mapper.selectQA(selfdto);
    }

    @Override
    public List<SelfDTO> selectS(){
        return mapper.select();
    }

    @Override
    public void updateS(SelfDTO selfdto){
        mapper.update(selfdto);
    }
    @Override
    public void deleteQAS(int qa_seq){
        mapper.deleteQA(qa_seq);
    }
    @Override
    public void deleteSelfS(int self_seq){
        mapper.deleteSelf(self_seq);
    }

    @Override
    public int maxQAS() {
        return mapper.maxQA();
    }

    @Override
    public List<SelfDTO> userSelfS(String u_seq) {
        return mapper.userSelf(u_seq);
    }
}
