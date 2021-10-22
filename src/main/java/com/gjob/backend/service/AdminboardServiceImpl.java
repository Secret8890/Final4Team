package com.gjob.backend.service;

import java.util.List;
import java.util.Map;

import com.gjob.backend.mapper.AdminboardMapper;
import com.gjob.backend.model.AdminboardDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminboardServiceImpl implements AdminboardService {
    @Autowired
    private AdminboardMapper mapper;

    @Override
    public List<AdminboardDTO> selectAjaxS(Map<String, Object> map) {
        return mapper.selectAjax(map);
    }

    @Override
    public int selectCountS() {
        return mapper.selectCount();
    }

    @Override
    public AdminboardDTO selectBySeqS(int u_seq) {
        return mapper.selectBySeq(u_seq);
    }
}
