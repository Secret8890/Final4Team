package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.model.CrawlingDTO;

public interface CrawlingService {
    List<CrawlingDTO> selectS(int co_seq);
}
