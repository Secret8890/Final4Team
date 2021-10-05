package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.model.ReviewDTO;

import org.springframework.stereotype.Service;

@Service
public interface ReviewService {
    List<ReviewDTO> listS();
    void insertS(ReviewDTO review);
    void deleteS(int review_seq);
}
