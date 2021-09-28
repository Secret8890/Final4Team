package com.gjob.backend.service;

import java.util.List;
import java.util.Map;

import com.gjob.backend.model.PassboardDTO;

public interface PassboardService {
    List<PassboardDTO> selectAjaxS(Map<String, Object> map);

    int selectCountS();

    PassboardDTO selectBySeqS(int pass_seq);

    void insertS(PassboardDTO passboard);

    void updateS(PassboardDTO passboard);

    void delete(int pass_seq);
}
