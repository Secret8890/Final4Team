package com.gjob.backend.service;

import java.util.List;
import java.util.Map;
import org.json.simple.JSONArray;
import com.gjob.backend.model.*;

public interface ResumeService {
    List<ResumeDTO> listS();

    void insertResumeAll(ResumeDTO resume, JSONArray careers, JSONArray languages, JSONArray licenses);

    void deleteS(int re_seq);

    List<ResumeDTO> userSelectS(String u_seq);

    Map<String, Object> updateDetail(String re_seq);

    Map<String, Object> applyResumeDetail(String re_seq);

    void updateResume(ResumeDTO resume, JSONArray careers, JSONArray languages, JSONArray licenses);

    ResumeDTO contentS(int re_seq);

}
