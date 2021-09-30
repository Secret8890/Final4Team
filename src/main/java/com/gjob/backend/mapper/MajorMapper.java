package com.gjob.backend.mapper;

import java.util.List;

import com.gjob.backend.model.MajorDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MajorMapper {
    List<MajorDTO> search(String major_name);
}
