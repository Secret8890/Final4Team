package com.gjob.backend.mapper;

import java.util.List;

import com.gjob.backend.model.CompanyDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CompanyMapper {
    List<CompanyDTO> select();

    List<CompanyDTO> selectByEndDate(String co_end_date);

    CompanyDTO selectBySeq(String co_seq);

    void insert(CompanyDTO dto);
}
