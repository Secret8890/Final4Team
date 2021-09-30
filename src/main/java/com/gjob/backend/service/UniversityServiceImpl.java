package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.mapper.UniversityMapper;
import com.gjob.backend.model.UniversityDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UniversityServiceImpl implements UniversityService {
    @Autowired
    private UniversityMapper mapper;

    @Override
    public List<UniversityDTO> searchS(String univ_name) {
        return mapper.search(univ_name);
    }

}
