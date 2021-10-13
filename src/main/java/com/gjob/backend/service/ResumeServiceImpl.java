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
        for(int i=0; i<licenses.size();i++) {
            LicenseDTO license = new LicenseDTO();
            try{
                JSONObject obj = (JSONObject)parser.parse(licenses.get(i).toString());
                license.setRe_seq(lastInserter.getRe_seq());
                license.setLi_agency(obj.get("li_agency").toString());
                license.setLi_date(obj.get("li_date").toString());
                license.setLi_name(obj.get("li_name").toString());
                mapper.insertLicense(license);
            }catch (Exception e) {
                System.out.println("License Paser Exception" + e);
            }
            
            
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
    public void updateResueme(ResumeDTO resume, JSONArray careers, JSONArray languages, JSONArray licenses) {
        mapper.updateResume(resume);
        try {
            if(mapper.careerCount(resume.getRe_seq())==careers.size()){
                for(int i=0;i<careers.size();i++){
                    JSONObject obj =(JSONObject) parser.parse(careers.get(i).toString());
                    mapper.updateCareer(careerUpdate(resume,obj));
                }
            } else if(mapper.careerCount(resume.getRe_seq()) < careers.size()) { 
                // 새로 추가된 어레이가 있을때, 기존보다 어레이가 커질경우 
                for(int i=0;i<careers.size();i++){
                    if(i >= mapper.careerCount(resume.getRe_seq())){
                        //기존 요소의 사이즈를 검색하고 그보다 커질경우 insert문 적용
                        JSONObject obj =(JSONObject) parser.parse(careers.get(i).toString());
                        System.out.println(careerUpdate(resume, obj));
                        mapper.insertCareer(careerUpdate(resume, obj));
                    } else {
                        //기존요소보다 작을때는 업데이트문만 적용.
                        JSONObject obj =(JSONObject) parser.parse(careers.get(i).toString());
                        mapper.updateCareer(careerUpdate(resume,obj));
                    }
                }
            } else if(mapper.careerCount(resume.getRe_seq()) > careers.size()) {
                // 오히려 어레이가 줄어들었을경우 car size = 3 , count = 5
                // 0~3 정상 업데이트 4, 5 삭제.
                int lastNum = 0;
                for(int i=0;i<careers.size();i++) {
                    JSONObject obj =(JSONObject) parser.parse(careers.get(i).toString());
                    mapper.updateCareer(careerUpdate(resume,obj));
                    lastNum = careerUpdate(resume,obj).getCa_seq();
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
        
        languageUpdate(resume, languages);
        licenseUpdate(resume, licenses);

    }


    void languageUpdate(ResumeDTO resume, JSONArray languages) {
        try{
            for(int i=0;i<languages.size();i++) {
                LanguageDTO language = new LanguageDTO();
                JSONObject obj = (JSONObject) parser.parse(languages.get(i).toString());
                language.setRe_seq(resume.getRe_seq());
                language.setLa_test_name(obj.get("la_test_name").toString());
                language.setLa_score(obj.get("la_score").toString());
                language.setLa_date(obj.get("la_date").toString());
                mapper.updateLanguage(language);
            }
        } catch (ParseException pe) {

        } catch (IllegalArgumentException iae) {
            
        }
    }
    void licenseUpdate(ResumeDTO resume, JSONArray licenses) {
        for(int i=0;i<licenses.size();i++){            
            try {
                LicenseDTO license = new LicenseDTO();
                JSONObject obj = (JSONObject) parser.parse(licenses.get(i).toString());
                license.setRe_seq(resume.getRe_seq());
                license.setLi_name(obj.get("li_name").toString());
                license.setLi_agency(obj.get("li_agency").toString());
                license.setLi_date(obj.get("li_date").toString());
                mapper.updateLicense(license);
            } catch (ParseException pe) {
                System.out.println("licenses parse Exception");
            }
        }
    }
    //JSON Array 형변환후 매퍼에서 데이터 업데이트처리까지
    CareerDTO careerUpdate(ResumeDTO resume,JSONObject obj) {
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
}

