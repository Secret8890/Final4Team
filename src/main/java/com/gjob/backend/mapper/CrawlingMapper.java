package com.gjob.backend.mapper;

import java.util.List;

import com.gjob.backend.model.CrawlingDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CrawlingMapper {
    void insertCL(CrawlingDTO crawlingdto);
    CrawlingDTO selectCL(int co_seq);
    
}
