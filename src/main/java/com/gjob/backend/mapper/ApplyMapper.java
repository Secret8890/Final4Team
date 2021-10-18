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

    List<ApplyDTO> listApply(String u_name);
}
