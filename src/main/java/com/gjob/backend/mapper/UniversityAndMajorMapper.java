package com.gjob.backend.mapper;

import java.util.List;

import com.gjob.backend.model.UniversityAndMajorDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UniversityAndMajorMapper {
    List<UniversityAndMajorDTO> searchUNIV(String univ_name);

    List<UniversityAndMajorDTO> searchMAJOR(String major_name);
}
