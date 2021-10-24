package com.gjob.backend.mapper;

import java.util.*;

import com.gjob.backend.model.IncruitDTO;
import com.gjob.backend.model.ReviewDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ReviewMapper {
    List<ReviewDTO> list();

    void insert(ReviewDTO review);

    void delete(int review_seq);

    int selectCount();

    List<ReviewDTO> selectAjax(Map<String, Object> map);

    List<ReviewDTO> selectAjaxByHit(Map<String, Object> map);

    ReviewDTO boardview(int review_seq);

    void update(ReviewDTO review);

    List<IncruitDTO> companylist(String co_name);
}