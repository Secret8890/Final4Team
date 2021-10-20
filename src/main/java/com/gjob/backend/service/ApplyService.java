package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.model.ApplyDTO;

public interface ApplyService {
    List<ApplyDTO> listS(int u_seq);

    void insertS(ApplyDTO dto);

    List<ApplyDTO> listApplyS(int co_seq);
    List<ApplyDTO> listApplyMemberS(int u_seq);
}
