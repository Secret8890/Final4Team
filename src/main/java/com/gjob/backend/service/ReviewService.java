package com.gjob.backend.service;

import java.util.List;
import java.util.Map;

import com.gjob.backend.model.IncruitDTO;
import com.gjob.backend.model.ReviewDTO;

public interface ReviewService {
    List<ReviewDTO> listS();

    void insertS(ReviewDTO review);

    void deleteS(int review_seq);

    int selectCountS();

    List<ReviewDTO> selectAjaxS(Map<String, Object> map);

    List<ReviewDTO> selectAjaxByHitS(Map<String, Object> map);

    ReviewDTO boardviewS(int review_seq);

    void updateS(ReviewDTO review);

    List<IncruitDTO> companyListS(String co_name);
}
