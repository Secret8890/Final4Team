package com.gjob.backend.service;

import com.gjob.backend.model.TestIntroDTO;
import java.util.*;

public interface TestIntroService {
    void insertS(TestIntroDTO selfintro);

    List<TestIntroDTO> selectS();

    TestIntroDTO selectBySeqS(TestIntroDTO selfintro);
    void updateS(TestIntroDTO selfintro);
    
    void deleteS(long seq);
}