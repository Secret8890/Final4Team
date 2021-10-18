package com.gjob.backend.mapper;

import com.gjob.backend.model.LicenseDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface LicenseMapper {
    LicenseDTO list(int re_seq);
}
