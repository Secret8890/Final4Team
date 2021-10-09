package com.gjob.backend.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Date;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
    public void insertResumeAll(ResumeDTO resume,JSONArray careers, JSONArray languages, JSONArray licenses){
        mapper.insertResume(resume);
        ResumeDTO lastInserter = mapper.FindlastInsert();
        JSONParser parser = new JSONParser();
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
                System.out.println("Language Paser Exception");
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
                System.out.println("License Paser Exception");
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
}
