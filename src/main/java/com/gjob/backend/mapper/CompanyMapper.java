package com.gjob.backend.mapper;

import java.util.List;
import java.util.Map;

import com.gjob.backend.model.CompanyDTO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CompanyMapper {
    List<CompanyDTO> select();

    List<CompanyDTO> selectAjax(Map<String, Object> map);

    int selectCount();

    CompanyDTO selectBySeq(String co_seq);

    void insert(CompanyDTO dto);

    void update(int co_seq);

    int selectByCount(int co_seq);

    void deleteByDate(String co_end_date);

    List<CompanyDTO> selectByCapitalArea();

    List<CompanyDTO> selectByEndDate();

    List<CompanyDTO> selectByEndDateLogin(String co_job_mid_name);

    int countByRegion(String co_location_name);

    List<CompanyDTO> searchByRegion(Map<String, Object> map);

    int countByWork(String co_job_mid_name);

    List<CompanyDTO> searchByWork(Map<String, Object> map);

    int countByRegionAndWork(String co_location_name, String co_job_mid_name);

    List<CompanyDTO> searchByRegionAndWork(Map<String, Object> map);
}
