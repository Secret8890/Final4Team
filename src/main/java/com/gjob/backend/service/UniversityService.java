package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.model.UniversityDTO;

public interface UniversityService {
    List<UniversityDTO> searchS(String univ_name);
}
