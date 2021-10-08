package com.gjob.backend.service;
import java.util.List;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Service;

import com.gjob.backend.model.*;

@Service
public interface ResumeService {
    List<ResumeDTO> listS();
    void insertResumeAll(ResumeDTO resume,JSONArray careers, JSONArray languages, JSONArray licenses);
    void deleteS(int re_seq);
    List<ResumeDTO> userSelectS(String u_seq);
}
