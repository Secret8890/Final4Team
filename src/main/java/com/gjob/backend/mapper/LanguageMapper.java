package com.gjob.backend.mapper;

import com.gjob.backend.model.LanguageDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface LanguageMapper {
    LanguageDTO list(int re_seq);
}
