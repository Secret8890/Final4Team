package com.gjob.backend.mapper;

import java.util.List;

import com.gjob.backend.model.ReviewDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ReviewMapper {
    List<ReviewDTO> list();
    void insert(ReviewDTO review);
    void delete(int review_seq);
}
