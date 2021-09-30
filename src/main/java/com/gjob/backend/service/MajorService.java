package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.model.MajorDTO;

public interface MajorService {
    List<MajorDTO> searchS(String major_name);
}
