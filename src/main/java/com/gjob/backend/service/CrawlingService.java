package com.gjob.backend.service;
import com.gjob.backend.model.CrawlingDTO;

public interface CrawlingService {
    CrawlingDTO selectS(int co_seq);
    CrawlingDTO selectCLS(int co_seq);
    void insertS(CrawlingDTO crawling);
    void updateS(CrawlingDTO crawling);
}
