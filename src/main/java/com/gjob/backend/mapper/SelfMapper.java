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
    List<SelfDTO> selectQA(SelfDTO selfdto);
    void insertSelf(SelfDTO selfdto);
    void insertQA(QuesDTO quesdto);
    void update(SelfDTO selfdto);
    void deleteQA(int qa_seq);
    void deleteSelf(int self_seq);
    int maxQA();
    List<SelfDTO> userSelf(String u_seq);
    int maxSelf();
}
