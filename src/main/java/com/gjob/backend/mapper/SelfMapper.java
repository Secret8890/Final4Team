package com.gjob.backend.mapper;

import java.util.List;

import com.gjob.backend.model.*;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface SelfMapper {
    //QUES 상세보기
    List<QuesDTO> quesDetail(int self_seq);
    //자소서 입력
    void insertSelf(SelfDTO selfdto);
    //자소서 질답 입력
    void insertQues(QuesDTO quesdto);
    //자소서 삭제
    void deleteSelf(int self_seq);
    
    //유저가쓴 자소서 불러오기
    List<SelfDTO> userSelf(int u_seq);
    //자소서 상세보기
    SelfDTO selfDetail(SelfDTO self);
    //지원자 자소서 상세보기
    SelfDTO selfDetailApply(SelfDTO self_seq);
    //질문답변 수정
    void quesUpdate(QuesDTO ques);
    //질문답변 모두삭제
    void quesReset(SelfDTO self);
    // 마지막으로 넣은 자소서가져오기 추후 임시저장 불러오기기능으로 쓰면될듯 ?
    SelfDTO lastInsertSelf();
    // 입사지원시 유저기준 수정불가능하게 카피해오기
    void copySelf(int self_seq);
    // ApplyCheck 수정하기
    void applyUpdate(int self_seq);
    // 자소서 수정
    void selfUpdate(SelfDTO self);
    // 자소서 갯수가져오기
    int getSelfCount();
}
