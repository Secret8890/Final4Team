package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.mapper.introduceMapper;
import com.gjob.backend.model.TestIntroDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestIntroServiceImpl implements TestIntroService{

    @Autowired
    public introduceMapper mapper;

    @Override
    public void insertS(TestIntroDTO selfintro) {
        System.out.println("SERVICE: " + selfintro);
        mapper.insert(selfintro);
        
    }

    @Override
    public List<TestIntroDTO> selectS() {
        return mapper.select();
    }

    @Override
    public TestIntroDTO selectBySeqS(TestIntroDTO selfintro) {
        return mapper.selectBySeq(selfintro);
    }

    @Override
    public void updateS(TestIntroDTO selfintro) {
        System.out.println("SERVICE: " + selfintro);
        mapper.update(selfintro);
        
    }

    @Override
    public void deleteS(long seq) {
        mapper.delete(seq);
        
    }


    
}
