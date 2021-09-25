package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.mapper.MajorMapper;
import com.gjob.backend.model.MajorDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MajorServiceImpl implements MajorService {
    @Autowired
    private MajorMapper mapper;

    @Override
    public List<MajorDTO> searchS(String major_name) {
        return mapper.search(major_name);
    }

}
