package com.gjob.backend.service;

import com.gjob.backend.mapper.LicenseMapper;
import com.gjob.backend.model.LicenseDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LicenseServiceImpl implements LicenseService{
    @Autowired
    private LicenseMapper mapper;

    @Override
    public LicenseDTO listS(int re_seq) {

        return mapper.list(re_seq);
    }
    
}
