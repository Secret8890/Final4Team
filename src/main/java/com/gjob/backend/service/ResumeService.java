package com.gjob.backend.service;
import java.util.List;

import org.springframework.stereotype.Service;

import com.gjob.backend.model.ResumeDTO;

@Service
public interface ResumeService {
    List<ResumeDTO> listS();
    void insertS(ResumeDTO resume);
    void deleteS(int re_seq);
}
