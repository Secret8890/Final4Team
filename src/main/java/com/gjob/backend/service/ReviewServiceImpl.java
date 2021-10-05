package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.mapper.ReviewMapper;
import com.gjob.backend.model.ReviewDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
    @Autowired
    private ReviewMapper mapper;

    @Override
    public List<ReviewDTO> listS(){
        return mapper.list();
    }
    @Override
    public void insertS(ReviewDTO review) {
        mapper.insert(review);
    }
    @Override
    public void deleteS(int review_seq){
        mapper.delete(review_seq);
    }
}
