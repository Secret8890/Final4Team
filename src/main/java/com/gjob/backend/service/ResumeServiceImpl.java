package com.gjob.backend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gjob.backend.mapper.ResumeMapper;
import com.gjob.backend.model.ResumeDTO;

@Service
public class ResumeServiceImpl implements ResumeService{
    @Autowired
    private ResumeMapper mapper;

    @Override
    public List<ResumeDTO> listS(){
        return mapper.list();
    }
    
    @Override
    public void insertS(ResumeDTO resume) {
        mapper.insert(resume);
    }
    @Override
    public void deleteS(int re_seq){
        mapper.delete(re_seq);
    }
}
