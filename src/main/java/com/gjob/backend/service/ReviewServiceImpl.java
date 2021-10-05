package com.gjob.backend.service;

import java.util.List;
import java.util.Map;

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
    @Override
    public int selectCountS(){
        return mapper.selectCount();
    }
    @Override
    public List<ReviewDTO> selectAjaxS(Map<String, Object> map) {
        return mapper.selectAjax(map);
    }

    @Override
    public List<ReviewDTO> selectAjaxByHitS(Map<String, Object> map) {
        return mapper.selectAjaxByHit(map);
    }
    @Override
    public ReviewDTO boardviewS(int review_seq){
        return mapper.boardview(review_seq);
    }
    @Override
    public void updateS(ReviewDTO review){
        mapper.update(review);
    }
}
