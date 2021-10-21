package com.gjob.backend.mapper;

import java.util.List;

import com.gjob.backend.model.ApplyDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ApplyMapper {
    List<ApplyDTO> list(int u_seq);

    void insert(ApplyDTO dto);

    List<ApplyDTO> listApply(int co_seq);
    List<ApplyDTO> listApplyMember(int u_seq);
    void isCheck(int re_seq);
    List<Boolean> readCheck(int u_seq);
}
