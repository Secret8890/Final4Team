package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.mapper.CrawlingMapper;
import com.gjob.backend.model.CrawlingDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CrawlingServiceImpl implements CrawlingService {
    @Autowired
    CrawlingMapper mapper;

    @Override
    public List<CrawlingDTO> selectS(int co_seq){
        return mapper.selectCL(co_seq);
    }
}
