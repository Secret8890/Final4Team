package com.gjob.backend.service;

import java.util.List;
import java.util.Map;

import com.gjob.backend.model.AdminboardDTO;

public interface AdminboardService {
    List<AdminboardDTO> selectAjaxS(Map<String, Object> map);

    int selectCountS();

    AdminboardDTO selectBySeqS(int u_seq);
}
