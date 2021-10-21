package com.gjob.backend.mapper;

import java.util.List;
import java.util.Map;

import com.gjob.backend.model.AdminboardDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AdminboardMapper {
    List<AdminboardDTO> selectAjax(Map<String, Object> map);

    int selectCount();

    AdminboardDTO selectBySeq(int u_seq);
}
