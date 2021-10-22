package com.gjob.backend.service;

import java.util.*;

import com.gjob.backend.model.ResumeDTO;

public interface ResumeService {
    void insertResumeAll(ResumeDTO resume, String careers, String languages, String licenses);

    void deleteS(int re_seq);

    List<ResumeDTO> userSelectS(int u_seq);

    Map<String, Object> resumeDetail(int re_seq);

    void updateResume(ResumeDTO resume, String careers, String languages, String licenses);

    ResumeDTO contentS(int re_seq);

    int getResumeCountS();

    void isCheckS(int re_seq);

    List<Boolean> readCheckS(int u_seq);
}
