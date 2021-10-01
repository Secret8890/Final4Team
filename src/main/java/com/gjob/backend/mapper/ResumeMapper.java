package com.gjob.backend.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.gjob.backend.model.ResumeDTO;


@Repository
@Mapper
public interface ResumeMapper {
    List<ResumeDTO> list();
    void insert(ResumeDTO resume);
    void delete(int re_seq);
}