package com.gjob.backend.mapper;

import java.util.List;

import com.gjob.backend.model.*;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface SelfMapper {
    List<SelfDTO> select();

    List<SelfDTO> selectCompany();

    List<QuesDTO> QuesDetail(int self_seq);

    void insertSelf(SelfDTO selfdto);

    void insertQues(QuesDTO quesdto);

    void update(SelfDTO selfdto);

    void deleteQA(int qa_seq);

    void deleteSelf(int self_seq);

    int maxQA();

    List<SelfDTO> userSelf(String u_seq);

    int maxSelf();

    SelfDTO SelfDetail(SelfDTO self);

    SelfDTO SelfDetailApply(SelfDTO self);

    void quesUpdate(QuesDTO ques);

    void quesDeleteData(int qa_seq);

    void quesReset(SelfDTO self);

    SelfDTO lastInsertSelf();

    void copySelf(int self_seq);

    void applyUpdate(int self_seq);

    void selfUpdate(SelfDTO self);

    int getSelfCount();
  
    QuesDTO content(int self_seq);
}
