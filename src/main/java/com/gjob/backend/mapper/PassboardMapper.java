package com.gjob.backend.mapper;

import java.util.List;
import java.util.Map;

import com.gjob.backend.model.PassboardDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PassboardMapper {
    List<PassboardDTO> selectAjax(Map<String, Object> map);

    int selectCount();

    PassboardDTO selectBySeq(int pass_seq);

    void insert(PassboardDTO passboard);

    void update(PassboardDTO passboard);

    void delete(int pass_seq);
}
