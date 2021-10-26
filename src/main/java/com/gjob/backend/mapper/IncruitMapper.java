package com.gjob.backend.mapper;

import java.util.List;
import java.util.Map;

import com.gjob.backend.model.IncruitDTO;
import com.gjob.backend.model.IncruitSearchDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface IncruitMapper {
    List<IncruitDTO> select();

    List<IncruitDTO> selectAjax(Map<String, Object> map);

    int selectCount();

    IncruitDTO selectBySeq(String co_seq);

    void insert(IncruitDTO dto);

    void update(int co_seq);

    int selectByCount(int co_seq);

    void deleteByDate(String co_end_date);

    List<IncruitDTO> selectByCapitalArea();

    List<IncruitDTO> selectByEndDate();

    List<IncruitDTO> selectByEndDateLogin(String co_job_mid_name);

    int countByDetailSearch(IncruitSearchDTO dto);

    List<IncruitDTO> searchByDetail(Map<String, Object> map);

    void updateCompany(IncruitDTO dto);

    void delete(int co_seq);

    List<IncruitDTO> selectName(String co_name);

    int getTodayIncruitCount();

    int getLastco_seq();

    List<IncruitDTO> temp1();

    List<IncruitDTO> temp2(String u_job);

    List<IncruitDTO> temp3(String u_job);
}
