package com.gjob.backend.service;

import java.util.List;
import java.util.Map;

import com.gjob.backend.mapper.PassboardMapper;
import com.gjob.backend.model.PassboardDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PassboardServiceImpl implements PassboardService {
    @Autowired
    private PassboardMapper mapper;

    @Override
    public List<PassboardDTO> selectAjaxS(Map<String, Object> map) {
        return mapper.selectAjax(map);
    }

    @Override
    public List<PassboardDTO> selectAjaxByHitS(Map<String, Object> map) { //
        return mapper.selectAjaxByHit(map);
    }

    @Override
    public int selectCountS() { //
        return mapper.selectCount();
    }

    @Override
    public List<PassboardDTO> selectByHitS() {
        return mapper.selectByHit();
    }

    @Override
    public PassboardDTO selectBySeqS(int pass_seq) { //
        return mapper.selectBySeq(pass_seq);
    }

    @Override
    public void insertS(PassboardDTO passboard) {
        mapper.insert(passboard);
    }

    @Override
    public void updateS(PassboardDTO passboard) {
        mapper.update(passboard);
    }

    @Override
    public void delete(int pass_seq) {
        mapper.delete(pass_seq);
    }

    @Override
    public void updateHitS(int pass_seq) { //
        mapper.updateHit(pass_seq);
    }
}
