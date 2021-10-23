package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.model.*;

import org.json.simple.JSONArray;

public interface SelfService {
    void insertSelfS(SelfDTO selfdto, JSONArray jsonQues);

    void insertQAS(QuesDTO quesdto);

    void deleteSelfS(int self_seq);

    List<SelfDTO> userSelfS(int u_seq);

    SelfDTO SelfDetailS(SelfDTO self);

    SelfDTO SelfDetailApplyS(SelfDTO self);

    List<QuesDTO> quesDetailS(int self_seq);

    void updateS(SelfDTO selfdto, String quesArr, int count);

    int getSelfCountS();

    List<QuesDTO> contentS(int self_seq);

    void isCheckS(int self_seq);
}
