package com.gjob.backend.service;

import com.gjob.backend.mapper.LanguageMapper;
import com.gjob.backend.model.LanguageDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LanguageServiceImpl implements LanguageService{
    
    @Autowired
    private LanguageMapper mapper;

    @Override
    public LanguageDTO listS(int re_seq) {
        return mapper.list(re_seq);
    }
    
}
