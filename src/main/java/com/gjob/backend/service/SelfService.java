package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.model.*;

import org.json.simple.JSONArray;

public interface SelfService {
    List<SelfDTO> selectS();

    List<SelfDTO> selectCompanyS();

    void insertSelfS(SelfDTO selfdto, JSONArray jsonQues);

    void insertQAS(QuesDTO quesdto);

    void deleteQAS(int qa_seq);

    void deleteSelfS(int self_seq);

    int maxQAS();

    int maxSelfS();

    List<SelfDTO> userSelfS(String u_seq);

    SelfDTO SelfDetailS(SelfDTO self);

    SelfDTO SelfDetailApplyS(SelfDTO self);

    List<QuesDTO> QuesDetailS(SelfDTO self);

    void updateS(SelfDTO selfdto, String quesArr, int count);

}
