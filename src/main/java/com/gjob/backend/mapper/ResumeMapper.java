package com.gjob.backend.mapper;

import java.util.List;

import com.gjob.backend.model.*;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ResumeMapper {
    List<ResumeDTO> list();
    void delete(int re_seq);
    ResumeDTO FindlastInsert();
    void insertCareer(CareerDTO careerDTO);
    void insertResume(ResumeDTO resume);
    void insertLanguage(LanguageDTO languageDTO);
    void insertLicense(LicenseDTO licenseDTO);
    List<ResumeDTO> userSelect(String u_seq);
    ResumeDTO detailResume(String re_seq);
    List<CareerDTO> detailCareer(String re_seq);
    List<LanguageDTO> detailLanguage(String re_seq);
    List<LicenseDTO> detailLicense(String re_seq);
}