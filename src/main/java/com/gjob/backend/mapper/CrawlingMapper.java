package com.gjob.backend.mapper;

import com.gjob.backend.model.CrawlingDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CrawlingMapper {
    void insertCL(CrawlingDTO crawlingdto);

    void insert(CrawlingDTO crawling);

    CrawlingDTO selectCL(int co_seq);
    void update(CrawlingDTO crawling);
}
