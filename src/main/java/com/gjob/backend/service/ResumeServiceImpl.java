package com.gjob.backend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gjob.backend.mapper.ResumeMapper;
import com.gjob.backend.model.*;

@Service
public class ResumeServiceImpl implements ResumeService{
    @Autowired
    private ResumeMapper mapper;

    @Override
    public List<ResumeDTO> listS(){
        return mapper.list();
    }
    
    @Override
    public void insertResumeAll(ResumeDTO resume,List<CareerDTO> careers, List<LanguageDTO> languages, List<LicenseDTO> licenses){
        mapper.insertResume(resume);
        ResumeDTO lastInserter = mapper.FindlastInsert();
        for(CareerDTO career : careers) {
            career.setRe_seq(lastInserter.getRe_seq());
            mapper.insertCareer(career);
        }
        for(LanguageDTO language : languages) {
            language.setRe_seq(lastInserter.getRe_seq());
            mapper.insertLanguage(language);
        }
        for(LicenseDTO license : licenses) {
            license.setRe_seq(lastInserter.getRe_seq());
            mapper.insertLicense(license);
        }
    }
    @Override
    public void deleteS(int re_seq){
        mapper.delete(re_seq);
    }
}
