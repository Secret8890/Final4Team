package com.gjob.backend.mapper;

import java.util.List;

import com.gjob.backend.model.*;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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

    List<ResumeDTO> userSelect(int u_seq);

    ResumeDTO detailResume(int re_seq);

    ResumeDTO detailResumeApply(int re_seq);

    List<CareerDTO> detailCareer(int re_seq);

    List<LanguageDTO> detailLanguage(int re_seq);

    List<LicenseDTO> detailLicense(int re_seq);

    void updateResume(ResumeDTO resume);

    void updateCareer(CareerDTO career);

    void updateLanguage(LanguageDTO language);

    void updateLicense(LicenseDTO license);

    int careerCount(int re_seq);

    int languageCount(int re_seq);

    int licenseCount(int re_seq);

    void careerDelete(@Param("re_seq") int re_seq, @Param("ca_seq") int ca_seq);

    void languageDelete(@Param("re_seq") int re_seq, @Param("la_seq") int la_seq);

    void licenseDelete(@Param("re_seq") int re_seq, @Param("li_seq") int la_seq);

    ResumeDTO content(int re_seq);

    void copyResume(int re_seq);

    void applyUpdate(int re_seq);

    int getResumeCount();

    List<Boolean> readCheck(int u_seq);
}