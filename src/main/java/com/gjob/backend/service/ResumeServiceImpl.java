package com.gjob.backend.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Date;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gjob.backend.mapper.ResumeMapper;
import com.gjob.backend.model.*;

@Service
public class ResumeServiceImpl implements ResumeService{
    @Autowired
    private ResumeMapper mapper;


    JSONParser parser = new JSONParser();

    @Override
    public List<ResumeDTO> listS(){
        return mapper.list();
    }
    
    @Override
    public void insertResumeAll(ResumeDTO resume,JSONArray careers, JSONArray languages, JSONArray licenses){
        mapper.insertResume(resume);
        ResumeDTO lastInserter = mapper.FindlastInsert();
        
        if(!careers.isEmpty()){
            for(int i=0;i<careers.size();i++) {
                CareerDTO career = new CareerDTO();
                try{
                    JSONObject obj = (JSONObject)parser.parse(careers.get(i).toString());
                    career.setRe_seq(lastInserter.getRe_seq());
                    career.setCa_co_name(obj.get("ca_co_name").toString());
                    career.setCa_position(obj.get("ca_position").toString());
                    Date startDate = Date.valueOf(obj.get("ca_start").toString());
                    career.setCa_start(startDate);
                    Date endDate = Date.valueOf(obj.get("ca_end").toString());
                    career.setCa_end(endDate);
                    career.setCa_duration(obj.get("ca_duration").toString());
                    career.setCa_dept(obj.get("ca_duration").toString());
                    career.setCa_dept(obj.get("ca_dept").toString());
                    career.setCa_work(obj.get("ca_work").toString());
                } catch (Exception e) {
                    System.out.println("Career Paser Exception");
                }
                mapper.insertCareer(career);
            }
        }
        for(int i=0;i<languages.size();i++){
            LanguageDTO language = new LanguageDTO();
            try{
                JSONObject obj = (JSONObject)parser.parse(languages.get(i).toString());
                language.setRe_seq(lastInserter.getRe_seq());
                language.setLa_test_name(obj.get("la_test_name").toString());
                language.setLa_date(obj.get("la_date").toString());
                language.setLa_score(obj.get("la_score").toString());
                mapper.insertLanguage(language);
            }catch(Exception e) {
                System.out.println("Language Paser Exception" +e);
            }
        }
        
            LicenseDTO license = new LicenseDTO();
            try{
                for(int i=0; i<licenses.size();i++) {
                JSONObject obj = (JSONObject)parser.parse(licenses.get(i).toString());
                license.setRe_seq(lastInserter.getRe_seq());
                license.setLi_agency(obj.get("li_agency").toString());
                license.setLi_date(obj.get("li_date").toString());
                license.setLi_name(obj.get("li_name").toString());    
            
                }
                mapper.insertLicense(license);
            }catch (Exception e) {
                System.out.println("License Paser Exception" + e);
            }
        
    }
    @Override
    public void deleteS(int re_seq){
        mapper.delete(re_seq);
    }

    @Override
    public List<ResumeDTO> userSelectS(String u_seq) {
        return mapper.userSelect(u_seq);
    }
    @Override
    public Map<String, Object> updateDetail(String re_seq) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        map.put("resume",mapper.detailResume(re_seq));
        map.put("careerList",mapper.detailCareer(re_seq));
        map.put("languageList",mapper.detailLanguage(re_seq));
        map.put("licenseList",mapper.detailLicense(re_seq));
        return map;
    }
    @Override
    public void updateResume(ResumeDTO resume, JSONArray careers, JSONArray languages, JSONArray licenses) {
        mapper.updateResume(resume);
        careerUpdate(resume, careers);
        languageUpdate(resume, languages);
        licenseUpdate(resume, licenses);

    }
    private void careerUpdate(ResumeDTO resume, JSONArray careers) {
        try {
            if(mapper.careerCount(resume.getRe_seq())==careers.size()){
                for(int i=0;i<careers.size();i++){
                    JSONObject obj =(JSONObject) parser.parse(careers.get(i).toString());
                    mapper.updateCareer(careetSetDTO(resume,obj));
                }
            } else if(mapper.careerCount(resume.getRe_seq()) < careers.size()) { 
                // 새로 추가된 어레이가 있을때, 기존보다 어레이가 커질경우 
                for(int i=0;i<careers.size();i++){
                    if(i >= mapper.careerCount(resume.getRe_seq())){
                        //기존 요소의 사이즈를 검색하고 그보다 커질경우 insert문 적용
                        JSONObject obj =(JSONObject) parser.parse(careers.get(i).toString());
                        System.out.println(careetSetDTO(resume, obj));
                        mapper.insertCareer(careetSetDTO(resume, obj));
                    } else {
                        //기존요소보다 작을때는 업데이트문만 적용.
                        JSONObject obj =(JSONObject) parser.parse(careers.get(i).toString());
                        mapper.updateCareer(careetSetDTO(resume,obj));
                    }
                }
            } else if(mapper.careerCount(resume.getRe_seq()) > careers.size()) {
                // 오히려 어레이가 줄어들었을경우 car size = 3 , count = 5
                // 0~3 정상 업데이트 4, 5 삭제.
                int lastNum = 0;
                for(int i=0;i<careers.size();i++) {
                    JSONObject obj =(JSONObject) parser.parse(careers.get(i).toString());
                    mapper.updateCareer(careetSetDTO(resume,obj));
                    lastNum = careetSetDTO(resume,obj).getCa_seq();
                }
                if(lastNum != 0) {
                    mapper.careerDelete(resume.getRe_seq(), lastNum); 
                }
            }
        } catch (ParseException pe) {
            System.out.println("career parse Exception" + pe);
        } catch (IllegalArgumentException iae) {
            System.out.println("career date argument Exception" + iae);
        }
    }

    private void languageUpdate(ResumeDTO resume, JSONArray languages) {
        try{
            if(mapper.languageCount(resume.getRe_seq()) == languages.size()) {
                for(int i=0;i<languages.size();i++) {
                    JSONObject obj = (JSONObject) parser.parse(languages.get(i).toString());
                    LanguageDTO language = languageSetDTO(resume, obj);
                    mapper.updateLanguage(language);
                }
            } else if(mapper.languageCount(resume.getRe_seq()) < languages.size()) {
                for(int i=0;i<languages.size();i++) {
                    if(i < mapper.languageCount(resume.getRe_seq())){
                        JSONObject obj = (JSONObject) parser.parse(languages.get(i).toString());
                        LanguageDTO language = languageSetDTO(resume, obj);
                        mapper.updateLanguage(language);
                    } else {
                        JSONObject obj = (JSONObject) parser.parse(languages.get(i).toString());
                        LanguageDTO language = languageSetDTO(resume, obj);
                        mapper.insertLanguage(language);
                    }
                }
            } else if(mapper.languageCount(resume.getRe_seq()) > languages.size()) {
                int count = 0;
                for(int i=0;i<languages.size();i++) {
                    JSONObject obj = (JSONObject) parser.parse(languages.get(i).toString());
                    LanguageDTO language = languageSetDTO(resume, obj);
                    mapper.updateLanguage(language);
                    count = language.getLa_seq();
                }
                mapper.languageDelete(resume.getRe_seq(), count);
                
            }
        } catch (ParseException pe) {
            System.out.println("language parse Exception" + pe);
        } catch (IllegalArgumentException iae) {
            System.out.println("language date argument Exception" + iae);
        }
    }
    private void licenseUpdate(ResumeDTO resume, JSONArray licenses) {
        try {
            if(mapper.licenseCount(resume.getRe_seq())== licenses.size()) {
                for(int i=0;i<licenses.size();i++) {   
                    LicenseDTO license = new LicenseDTO();
                    JSONObject obj = (JSONObject) parser.parse(licenses.get(i).toString());
                    license = licenseSetDTO(resume, obj);
                    mapper.updateLicense(license);
                }
            } else if(mapper.licenseCount(resume.getRe_seq()) < licenses.size()) {
                for(int i=0;i<licenses.size();i++) {
                    if(i < mapper.licenseCount(resume.getRe_seq())) {
                        LicenseDTO license = new LicenseDTO();
                        JSONObject obj = (JSONObject) parser.parse(licenses.get(i).toString());
                        license = licenseSetDTO(resume, obj);
                        mapper.updateLicense(license);
                    } else {
                        LicenseDTO license = new LicenseDTO();
                        JSONObject obj = (JSONObject) parser.parse(licenses.get(i).toString());
                        license = licenseSetDTO(resume, obj);
                        mapper.insertLicense(license);
                    }
                }
            } else if(mapper.licenseCount(resume.getRe_seq()) > licenses.size()) {
                int count = 0;
                for(int i=0;i<licenses.size();i++) {
                    LicenseDTO license = new LicenseDTO();
                    JSONObject obj = (JSONObject) parser.parse(licenses.get(i).toString());
                    license = licenseSetDTO(resume, obj);
                    mapper.updateLicense(license);
                    count = license.getLi_seq();    
                }
                mapper.licenseDelete(resume.getRe_seq(), count);
            }
        } catch (ParseException pe) {
            System.out.println("licenses parse Exception");
        }
    }
    //JSON Array 형변환후 매퍼에서 데이터 업데이트처리까지
    private CareerDTO careetSetDTO(ResumeDTO resume,JSONObject obj) {
        CareerDTO career = new CareerDTO();
        //JSONObject obj = (JSONObject) parser.parse(careers.get(i).toString());
        career.setRe_seq(resume.getRe_seq());
        career.setCa_seq(Integer.parseInt(obj.get("ca_seq").toString()));
        career.setCa_co_name(obj.get("ca_co_name").toString());
        career.setCa_position(obj.get("ca_position").toString());
        career.setCa_start(Date.valueOf(obj.get("ca_start").toString()));
        career.setCa_end(Date.valueOf(obj.get("ca_start").toString()));
        career.setCa_duration(obj.get("ca_duration").toString());
        career.setCa_work(obj.get("ca_work").toString());
        return career;
    }
    private LicenseDTO licenseSetDTO(ResumeDTO resume, JSONObject obj) {
        LicenseDTO license = new LicenseDTO();
        license.setRe_seq(resume.getRe_seq());
        if(obj.get("li_seq") != null ) {
            license.setLi_seq(Integer.parseInt(obj.get("li_seq").toString()));
        }
        license.setLi_name(obj.get("li_name").toString());
        license.setLi_agency(obj.get("li_agency").toString());
        license.setLi_date(obj.get("li_date").toString());
        return license;
    }

    private LanguageDTO languageSetDTO(ResumeDTO resume, JSONObject obj) {
        LanguageDTO language = new LanguageDTO();
        language.setRe_seq(resume.getRe_seq());
        if(obj.get("la_seq") != null) {
            language.setLa_seq(Integer.parseInt(obj.get("la_seq").toString()));
        }
        language.setLa_test_name(obj.get("la_test_name").toString());
        language.setLa_date(obj.get("la_date").toString());
        language.setLa_score(obj.get("la_score").toString());
        return language;
    }

}

