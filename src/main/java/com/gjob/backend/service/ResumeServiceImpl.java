package com.gjob.backend.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gjob.backend.mapper.ResumeMapper;
import com.gjob.backend.model.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResumeServiceImpl implements ResumeService {
    @Autowired
    private ResumeMapper mapper;

    JSONParser parser = new JSONParser();

    //이력서 모든 요소를 데이터베이스에 입력하는 메소드
    @Override
    public void insertResumeAll(ResumeDTO resume, String careers, String languages, String licenses) {
        mapper.insertResume(resume);
        ResumeDTO lastInserter = mapper.FindlastInsert();
        try {
            JSONArray careerArray = (JSONArray) parser.parse(careers);
            JSONArray languageArray = (JSONArray) parser.parse(languages);
            JSONArray licenseArray = (JSONArray) parser.parse(licenses);
            careerInsert(resume, careerArray, lastInserter);
            languageInsert(resume, languageArray, lastInserter);
            licenseInsert(resume, licenseArray, lastInserter);

        } catch (Exception e) {
            System.out.println("insert Parse Exception " + e);
        }
    }

    @Override
    public void deleteS(int re_seq) {
        mapper.delete(re_seq);
    }

    @Override
    public List<ResumeDTO> userSelectS(int u_seq) {
        return mapper.userSelect(u_seq);
    }

    // 이력서 수정폼 , 이력서 상세보기에서 사용하는 서비스
    @Override
    public Map<String, Object> resumeDetail(int re_seq) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("resume", mapper.detailResume(re_seq));
        map.put("careerList", mapper.detailCareer(re_seq));
        map.put("languageList", mapper.detailLanguage(re_seq));
        map.put("licenseList", mapper.detailLicense(re_seq));
        return map;
    }

    //수정 _ 상위테이블 이력서
    @Override
    public void updateResume(ResumeDTO resume, String careers, String languages, String licenses) {
        JSONArray careerArray;
        JSONArray languageArray;
        JSONArray licenseArray;
        try {
            languageArray = (JSONArray) parser.parse(languages);
            licenseArray = (JSONArray) parser.parse(licenses);
            careerArray = (JSONArray) parser.parse(careers);
            careerUpdate(resume, careerArray);
            languageUpdate(resume, languageArray);
            licenseUpdate(resume, licenseArray);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        mapper.updateResume(resume);
    }

    //수정 _ 하위테이블 경력
    private void careerUpdate(ResumeDTO resume, JSONArray careers) {
        try {
            if (mapper.careerCount(resume.getRe_seq()) == careers.size()) {
                for (int i = 0; i < careers.size(); i++) {
                    JSONObject obj = (JSONObject) parser.parse(careers.get(i).toString());
                    mapper.updateCareer(careetSetDTO(resume, obj));
                }
            } else if (mapper.careerCount(resume.getRe_seq()) < careers.size()) {
                // 새로 추가된 어레이가 있을때, 기존보다 어레이가 커질경우
                for (int i = 0; i < careers.size(); i++) {
                    if (i >= mapper.careerCount(resume.getRe_seq())) {
                        // 기존 요소의 사이즈를 검색하고 그보다 커질경우 insert문 적용
                        JSONObject obj = (JSONObject) parser.parse(careers.get(i).toString());
                        System.out.println(careetSetDTO(resume, obj));
                        mapper.insertCareer(careetSetDTO(resume, obj));
                    } else {
                        // 기존요소보다 작을때는 업데이트문만 적용.
                        JSONObject obj = (JSONObject) parser.parse(careers.get(i).toString());
                        mapper.updateCareer(careetSetDTO(resume, obj));
                    }
                }
            } else if (mapper.careerCount(resume.getRe_seq()) > careers.size()) {
                // 오히려 어레이가 줄어들었을경우 car size = 3 , count = 5
                // 0~3 정상 업데이트 4, 5 삭제.
                int lastNum = 0;
                for (int i = 0; i < careers.size(); i++) {
                    JSONObject obj = (JSONObject) parser.parse(careers.get(i).toString());
                    mapper.updateCareer(careetSetDTO(resume, obj));
                    lastNum = careetSetDTO(resume, obj).getCa_seq();
                }
                if (lastNum != 0) {
                    mapper.careerDelete(resume.getRe_seq(), lastNum);
                }
            }
        } catch (ParseException pe) {
            System.out.println("career parse Exception" + pe);
        } catch (IllegalArgumentException iae) {
            System.out.println("career date argument Exception" + iae);
        }
    }
    //수정 _ 하위테이블 어학점수
    private void languageUpdate(ResumeDTO resume, JSONArray languages) {
        try {
            if (mapper.languageCount(resume.getRe_seq()) == languages.size()) {
                for (int i = 0; i < languages.size(); i++) {
                    JSONObject obj = (JSONObject) parser.parse(languages.get(i).toString());
                    LanguageDTO language = languageSetDTO(resume, obj);
                    mapper.updateLanguage(language);
                }
            } else if (mapper.languageCount(resume.getRe_seq()) < languages.size()) {
                for (int i = 0; i < languages.size(); i++) {
                    if (i < mapper.languageCount(resume.getRe_seq())) {
                        JSONObject obj = (JSONObject) parser.parse(languages.get(i).toString());
                        LanguageDTO language = languageSetDTO(resume, obj);
                        mapper.updateLanguage(language);
                    } else {
                        JSONObject obj = (JSONObject) parser.parse(languages.get(i).toString());
                        LanguageDTO language = languageSetDTO(resume, obj);
                        mapper.insertLanguage(language);
                    }
                }
            } else if (mapper.languageCount(resume.getRe_seq()) > languages.size()) {
                int count = 0;
                for (int i = 0; i < languages.size(); i++) {
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
    //수정 _ 하위테이블 자격증
    private void licenseUpdate(ResumeDTO resume, JSONArray licenses) {
        try {
            if (mapper.licenseCount(resume.getRe_seq()) == licenses.size()) {
                for (int i = 0; i < licenses.size(); i++) {
                    LicenseDTO license = new LicenseDTO();
                    JSONObject obj = (JSONObject) parser.parse(licenses.get(i).toString());
                    license = licenseSetDTO(resume, obj);
                    mapper.updateLicense(license);
                }
            } else if (mapper.licenseCount(resume.getRe_seq()) < licenses.size()) {
                for (int i = 0; i < licenses.size(); i++) {
                    if (i < mapper.licenseCount(resume.getRe_seq())) {
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
            } else if (mapper.licenseCount(resume.getRe_seq()) > licenses.size()) {
                int count = 0;
                for (int i = 0; i < licenses.size(); i++) {
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

    //입력 _ 하위테이블 경력
    private void careerInsert(ResumeDTO resume, JSONArray careerArray, ResumeDTO lastInserter) {
        if (!careerArray.isEmpty()) {
            for (int i = 0; i < careerArray.size(); i++) {

                CareerDTO career = new CareerDTO();
                try {
                    JSONObject obj = (JSONObject) parser.parse(careerArray.get(i).toString());
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
    }
    //입력 _ 하위테이블 어학점수
    private void languageInsert(ResumeDTO resume,JSONArray languageArray, ResumeDTO lastInserter) {
        if(!languageArray.isEmpty()){
            for (int i = 0; i < languageArray.size(); i++) {
                LanguageDTO language = new LanguageDTO();
                try {
                    JSONObject obj = (JSONObject) parser.parse(languageArray.get(i).toString());
                    language.setRe_seq(lastInserter.getRe_seq());
                    language.setLa_test_name(obj.get("la_test_name").toString());
                    language.setLa_date(obj.get("la_date").toString());
                    language.setLa_score(obj.get("la_score").toString());
                    mapper.insertLanguage(language);

                } catch (Exception e) {
                    System.out.println("Language Paser Exception" + e);

                }
            }
        }
    }
    //입력 _ 하위테이블 자격증
    private void licenseInsert(ResumeDTO resume, JSONArray licenseArray, ResumeDTO lastInserter) {
        if(!licenseArray.isEmpty()) {   
            LicenseDTO license = new LicenseDTO();
            try {
                for (int i = 0; i < licenseArray.size(); i++) {
                    JSONObject obj = (JSONObject) parser.parse(licenseArray.get(i).toString());
                    license.setRe_seq(lastInserter.getRe_seq());
                    license.setLi_agency(obj.get("li_agency").toString());
                    license.setLi_date(obj.get("li_date").toString());
                    license.setLi_name(obj.get("li_name").toString());
                    System.out.println(license.getLi_name());
                    System.out.println(license.getRe_seq());
                    mapper.insertLicense(license);
                }
            } catch (Exception e) {
                System.out.println("License Paser Exception" + e);

            }
        }
    }

    // JSON Object를 매개로 받아 DTO에 값을 세팅하고 반환해주는메소드 / 경력
    private CareerDTO careetSetDTO(ResumeDTO resume, JSONObject obj) {
        CareerDTO career = new CareerDTO();
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
    // JSON Object를 매개로 받아 DTO에 값을 세팅하고 반환해주는메소드 / 언어
    private LanguageDTO languageSetDTO(ResumeDTO resume, JSONObject obj) {
        LanguageDTO language = new LanguageDTO();
        language.setRe_seq(resume.getRe_seq());
        if (obj.get("la_seq") != null) {
            language.setLa_seq(Integer.parseInt(obj.get("la_seq").toString()));
        }
        language.setLa_test_name(obj.get("la_test_name").toString());
        language.setLa_date(obj.get("la_date").toString());
        language.setLa_score(obj.get("la_score").toString());
        return language;
    }
    // JSON Object를 매개로 받아 DTO에 값을 세팅하고 반환해주는메소드 / 자격증
    private LicenseDTO licenseSetDTO(ResumeDTO resume, JSONObject obj) {
        LicenseDTO license = new LicenseDTO();
        license.setRe_seq(resume.getRe_seq());
        if (obj.get("li_seq") != null) {
            license.setLi_seq(Integer.parseInt(obj.get("li_seq").toString()));
        }
        license.setLi_name(obj.get("li_name").toString());
        license.setLi_agency(obj.get("li_agency").toString());
        license.setLi_date(obj.get("li_date").toString());
        return license;
    }
    
    @Override
    public ResumeDTO contentS(int re_seq) {
        return mapper.content(re_seq);
    }

    @Override
    public int getResumeCountS() {
        return mapper.getResumeCount();
    }

    @Override
    public void isCheckS(int re_seq) {
        mapper.isCheck(re_seq);
        
    }
    @Override
    public List<Boolean> readCheckS(int u_seq) {
        return mapper.readCheck(u_seq);
    }
}
