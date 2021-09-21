package com.gjob.backend.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;

import com.gjob.backend.model.SaraminDTO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

@Service
public class SaraminService {
    private static String accessKey = "MbPbeZQjFGxRQ8J3qKfwOjESFZvmtfXzJ8rIxflvzJCOomNvha"; // 발급받은 accessKey";
    public List<SaraminDTO> APItest(String apiURL) {
        List<SaraminDTO> array = new ArrayList<SaraminDTO>();
        try {
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Accept", "application/json");

            int responseCode = con.getResponseCode();
            BufferedReader br;

            if (responseCode == 200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            String strResponse = response.toString();
            //System.out.println(response.toString());
            //System.out.println(strResponse); 응답데이터 string

            JSONParser jsonParser = new JSONParser();
            try {
                JSONObject json = (JSONObject) jsonParser.parse(strResponse);
                //System.out.println("#json:" + json);
                JSONObject jobArray = (JSONObject) json.get("jobs");
                //System.out.println("#jobArray: " + jobArray);
                JSONArray jArray = (JSONArray) jobArray.get("job");
                
                for (int i = 0; i < jArray.size(); i++) {
                    ///// 제이슨데이터 분류
                    JSONObject jobsArray = (JSONObject) jArray.get(i);
                    JSONObject company = (JSONObject) jobsArray.get("company");
                    JSONObject companyD = null;
                    if(company.get("detail")!=null){
                        companyD = (JSONObject) company.get("detail");
                    }
                    JSONObject position = (JSONObject) jobsArray.get("position");
                    JSONObject positionJ = (JSONObject) position.get("job-mid-code");
                    JSONObject positionL = (JSONObject) position.get("location");
                    JSONObject positionE = (JSONObject) position.get("experience-level");
                    //////
                    String opening_timestamp = getTimestampToDate(jobsArray.get("opening-timestamp").toString());
                    String expiration_timestamp = getTimestampToDate(jobsArray.get("expiration-timestamp").toString());
                    SaraminDTO dto = new SaraminDTO();
                    dto.setCo_seq(jobsArray.get("id").toString());
                    ////// 제이슨데이터 널값 확인 후  String으로 변경후 객체에 주입
                    String co_name_href = "";
                    String co_name = "";
                    
                    if(companyD!=null){
                        //co_name_href = companyD.get("href").toString();
                        co_name = companyD.get("name").toString();
                    }
                    String co_seq = jobsArray.get("id").toString();
                    String co_title = position.get("title").toString();
                    //String co_job_name = positionJ.get("name").toString(); // 데이터가 없을경우가 있음.
                    String co_location_name = positionL.get("name").toString();
                    String co_career = positionE.get("name").toString();
                    String co_start_date = opening_timestamp;
                    String co_end_date = expiration_timestamp;
                    String co_url = jobsArray.get("url").toString();
                    if(!co_seq.isEmpty()) {
                        dto.setCo_seq(co_seq);
                    }
                    if(!co_name.isEmpty()) {
                        dto.setCo_name(co_name);
                    }
                    if(!co_name_href.isEmpty()) {
                        dto.setCo_name_href(co_name_href);
                    }
                    if(!co_title.isEmpty()) {
                        dto.setCo_title(co_title);
                    }
                    // if(!co_job_name.isEmpty()) {
                    //     dto.setCo_job_name(co_job_name);
                    // }
                    if(!co_location_name.isEmpty()) {
                        dto.setCo_location_name(co_location_name);
                    }
                    if(!co_career.isEmpty()) {
                        dto.setCo_career(co_career);
                    }
                    if(!co_start_date.isEmpty()) {
                        dto.setCo_start_date(co_start_date);
                    }
                    if(!co_end_date.isEmpty()) {
                        dto.setCo_end_date(co_end_date);
                    }
                    if(!co_url.isEmpty()) {
                        dto.setCo_url(co_url);
                    }
                    //////
                    array.add(dto);
                }
            } catch (Exception e) {
                System.out.println("error"+e);
                e.printStackTrace();
            }

            return array;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static String getTimestampToDate(String timestampStr) {
        long timestamp = Long.parseLong(timestampStr);
        Date date = new Date(timestamp * 1000L);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("GMT+9"));
        String formattedDate = sdf.format(date);
        return formattedDate;
    }

    // 공채속보
    // 30개
    public String bbsSearch(){
        SearchBox box = new SearchBox();
        box.setAccess_key(accessKey);
        box.setCount("100");
        box.setSr("directhire");
        box.setSort("rc");
        box.setStart("3");
        return box.getUrl();
    }

    //인덱스 개발자 , 서울 , 30개 , 직종코드 IT
    public String indexSearch(){
            //Date nowDate = new Date();
            //SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            //System.out.println(simpleDateFormat.format(nowDate));
            String count = "30";
            String keywords = "개발자";
            try{
                keywords = URLEncoder.encode(keywords, "UTF-8");
            }catch(Exception e) {
                System.out.println(e);
            }
            String loc_cd = "101000"; // 서울
            String job_mid_cd = "2";
            String apiURL = "https://oapi.saramin.co.kr/job-search?access-key=" + accessKey + "&count=" + count
                    + "&keywords=" + keywords + "&job_mid_cd" + job_mid_cd + "&loc_cd=" + loc_cd;
            return apiURL;
    }
}