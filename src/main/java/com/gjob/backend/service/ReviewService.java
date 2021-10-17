package com.gjob.backend.service;

import java.util.List;
import java.util.Map;

import com.gjob.backend.model.CompanyDTO;
import com.gjob.backend.model.ReviewDTO;

import org.springframework.stereotype.Service;

@Service
public interface ReviewService {
    List<ReviewDTO> listS();
    void insertS(ReviewDTO review);
    void deleteS(int review_seq);
    int selectCountS();
    List<ReviewDTO> selectAjaxS(Map<String, Object> map);
    List<ReviewDTO> selectAjaxByHitS(Map<String, Object> map);
    ReviewDTO boardviewS(int review_seq);
    void updateS(ReviewDTO review);
    List<CompanyDTO> companyListS(String co_name);
}
