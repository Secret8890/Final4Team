package com.gjob.backend.service;
import java.util.List;

import org.springframework.stereotype.Service;

import com.gjob.backend.model.*;

@Service
public interface ResumeService {
    List<ResumeDTO> listS();
    void insertResumeAll(ResumeDTO resume,List<CareerDTO> careers, List<LanguageDTO> languages, List<LicenseDTO> licenses);
    void deleteS(int re_seq);
}
