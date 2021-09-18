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
    public List<SaraminDTO> APItest() {
        List<SaraminDTO> array = new ArrayList<SaraminDTO>();

        String accessKey = "MbPbeZQjFGxRQ8J3qKfwOjESFZvmtfXzJ8rIxflvzJCOomNvha"; // 발급받은 accessKey";

        try {
            Date nowDate = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            System.out.println(simpleDateFormat.format(nowDate));
            String count = "30";
            String keywords = "개발자";
            keywords = URLEncoder.encode(keywords, "UTF-8");
            String loc_cd = "101000"; // 서울
            String job_mid_cd = "2";
            String apiURL = "https://oapi.saramin.co.kr/job-search?access-key=" + accessKey + "&count=" + count
                    + "&keywords=" + keywords + "&job_mid_cd" + job_mid_cd + "&loc_cd=" + loc_cd;

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
            System.out.println(response.toString());
            System.out.println(strResponse);

            JSONParser jsonParser = new JSONParser();
            try {
                JSONObject json = (JSONObject) jsonParser.parse(strResponse);
                System.out.println("#json:" + json);
                JSONObject jobArray = (JSONObject) json.get("jobs");
                System.out.println("#jobArray: " + jobArray);
                JSONArray jArray = (JSONArray) jobArray.get("job");

                for (int i = 0; i < jArray.size(); i++) {
                    JSONObject jobsArray = (JSONObject) jArray.get(i);

                    // System.out.println("#"+i+": "+jobsArray);
                    // System.out.println("#"+i+": "+jobsArray.get("id")); //회사 고유번호
                    JSONObject company = (JSONObject) jobsArray.get("company");
                    JSONObject companyD = (JSONObject) company.get("detail");
                    // System.out.println("#"+i+": "+companyD.get("name")); //회사명
                    // System.out.println("#"+i+": "+companyD.get("href")); //회사 소개 링크
                    // System.out.println("#"+i+": "+jobsArray.get("url")); //회사 공고
                    JSONObject position = (JSONObject) jobsArray.get("position");
                    JSONObject positionJ = (JSONObject) position.get("job-mid-code");
                    // System.out.println("#"+i+": "+positionJ.get("name")); //직종명
                    JSONObject positionL = (JSONObject) position.get("location");
                    // System.out.println("#"+i+": "+positionL.get("name")); //지역
                    JSONObject positionE = (JSONObject) position.get("experience-level");
                    // System.out.println("#"+i+": "+positionE.get("name")); //신입/경력 여부
                    // System.out.println("#"+i+": "+jobsArray.get("opening-timestamp")); //공고시작일
                    // System.out.println("#"+i+": "+jobsArray.get("expiration-timestamp")); //공고마감일
                    String opening_timestamp = getTimestampToDate(jobsArray.get("opening-timestamp").toString());
                    String expiration_timestamp = getTimestampToDate(jobsArray.get("expiration-timestamp").toString());
                    SaraminDTO dto = new SaraminDTO(jobsArray.get("id").toString(), companyD.get("name").toString(),
                            companyD.get("href").toString(), position.get("title").toString(),
                            positionJ.get("name").toString(), positionL.get("name").toString(),
                            positionE.get("name").toString(), opening_timestamp, expiration_timestamp,
                            jobsArray.get("url").toString());
                    array.add(dto);
                }
            } catch (Exception e) {
                System.out.println("error");
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
}