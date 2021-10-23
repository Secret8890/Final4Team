package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.mapper.SelfMapper;
import com.gjob.backend.model.QuesDTO;
import com.gjob.backend.model.SelfDTO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SelfServiceImpl implements SelfService {
    @Autowired
    SelfMapper mapper;

    @Override
    public void insertSelfS(SelfDTO selfdto, JSONArray jsonQues) {
        try {
            mapper.insertSelf(selfdto);
            int count = mapper.lastInsertSelf().getSelf_seq();
            JSONParser parser = new JSONParser();
            for (int i = 0; i < jsonQues.size(); i++) {
                QuesDTO ques = new QuesDTO();
                JSONObject obj = (JSONObject) parser.parse(jsonQues.get(i).toString());
                ques.setQa_q(obj.get("qa_q").toString());
                ques.setQa_a(obj.get("qa_a").toString());
                ques.setSelf_seq(count);
                mapper.insertQues(ques);
            }
        } catch (Exception e) {
            System.out.println("service Parse Exception" + e);
        }
        // mapper.insertQA(selfdto);
    }
    @Override
    public void insertQAS(QuesDTO quesdto) {
        mapper.insertQues(quesdto);
    }
    @Override
    public List<QuesDTO> quesDetailS(int self_seq) {
        return mapper.quesDetail(self_seq);
    }
    @Override
    public void deleteSelfS(int self_seq) {
        mapper.deleteSelf(self_seq);
    }
    @Override
    public List<SelfDTO> userSelfS(int u_seq) {
        return mapper.userSelf(u_seq);
    }
    @Override
    public SelfDTO SelfDetailS(SelfDTO self) {
        return mapper.selfDetail(self);
    }
    @Override
    public SelfDTO SelfDetailApplyS(SelfDTO self) {
        return mapper.selfDetailApply(self);
    }
    @Override
    public void updateS(SelfDTO selfdto, String quesArr, int count) {
        JSONParser parser = new JSONParser();
        try {
            JSONArray jsonQues = (JSONArray) parser.parse(quesArr);
            // 추가한데이터가 저장된것보다 적을경우
            mapper.quesReset(selfdto);
            for (int i = 0; i < jsonQues.size(); i++) {
                JSONObject obj = (JSONObject) parser.parse(jsonQues.get(i).toString());
                QuesDTO ques = quesSetDTO(selfdto, obj);
                mapper.insertQues(ques);
            }
            mapper.selfUpdate(selfdto);

        } catch (ParseException e) {

        }
    }
    private QuesDTO quesSetDTO(SelfDTO selfdto, JSONObject obj) {
        QuesDTO ques = new QuesDTO();
        ques.setQa_q(obj.get("qa_q").toString());
        ques.setQa_a(obj.get("qa_a").toString());
        if (obj.get("qa_seq") != null) {
            ques.setQa_seq(Integer.parseInt(obj.get("qa_seq").toString()));
        }
        ques.setSelf_seq(selfdto.getSelf_seq());
        return ques;
    }
    @Override
    public int getSelfCountS() {
        return mapper.getSelfCount();
    }
    @Override
    public List<QuesDTO> contentS(int self_seq) {
        return mapper.content(self_seq);
    }

    @Override
    public void isCheckS(int self_seq) {
        mapper.isCheck(self_seq);
        
    }
}
