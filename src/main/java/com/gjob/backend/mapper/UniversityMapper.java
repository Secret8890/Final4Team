package com.gjob.backend.mapper;

import java.util.List;

import com.gjob.backend.model.UniversityDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UniversityMapper {
    List<UniversityDTO> search(String univ_name);
}
