package com.gjob.backend.service;
import java.util.List;


import com.gjob.backend.model.*;

public interface ResumeService {
    List<ResumeDTO> listS();
    void insertResumeAll(ResumeDTO resume,List<CareerDTO> careers, List<LanguageDTO> languages, List<LicenseDTO> licenses);
    void deleteS(int re_seq);
}
