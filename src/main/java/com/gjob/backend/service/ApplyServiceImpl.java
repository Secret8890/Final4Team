package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.mapper.ApplyMapper;
import com.gjob.backend.model.ApplyDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApplyServiceImpl implements ApplyService {
    @Autowired
    private ApplyMapper mapper;

    @Override
    public List<ApplyDTO> listS(int u_seq) {
        return mapper.list(u_seq);
    }

    @Override
    public void insertS(ApplyDTO dto) {
        mapper.insert(dto);
    }

}
