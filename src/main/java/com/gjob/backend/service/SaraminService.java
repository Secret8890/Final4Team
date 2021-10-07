package com.gjob.backend.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;

import com.gjob.backend.model.CompanyDTO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

@Service
public class SaraminService {
    private static String[] box = { "MbPbeZQjFGxRQ8J3qKfwOjESFZvmtfXzJ8rIxflvzJCOomNvha",
            "qzddmxO7zEodTywzlYNTjVsrsizpTMB6uAGFCfj86obvJ34a" };
    private static String accessKey = box[0]; // 발급받은 accessKey";
    public List<CompanyDTO> APIexecute(String apiURL) {
        List<CompanyDTO> array = new ArrayList<CompanyDTO>();
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

            JSONParser jsonParser = new JSONParser();

            JSONObject json = (JSONObject) jsonParser.parse(strResponse);
            JSONObject jobArray = (JSONObject) json.get("jobs");

            JSONArray jArray = (JSONArray) jobArray.get("job");
            for (int i = 0; i < jArray.size(); i++) {
                JSONObject jobsArray = (JSONObject) jArray.get(i);
                JSONObject company = (JSONObject) jobsArray.get("company");
                JSONObject companyD = (JSONObject) company.get("detail");
                JSONObject position = (JSONObject) jobsArray.get("position");
                JSONObject salary = (JSONObject) jobsArray.get("salary");
                JSONObject positionT = (JSONObject) position.get("job-type");
                JSONObject positionM = (JSONObject) position.get("job-mid-code");
                JSONObject positionJ = (JSONObject) position.get("job-code");
                JSONObject positionL = (JSONObject) position.get("location");
                JSONObject positionE = (JSONObject) position.get("experience-level");
                String opening_timestamp = getTimestampToDate(jobsArray.get("opening-timestamp").toString());
                String expiration_timestamp = getTimestampToDate(jobsArray.get("expiration-timestamp").toString());
                CompanyDTO dto = new CompanyDTO();

                dto.setCo_seq(jobsArray.get("id").toString());
                dto.setCo_name(companyD.get("name").toString());
                if (companyD.get("href") == null)
                    dto.setCo_name_href("");
                else
                    dto.setCo_name_href(companyD.get("href").toString());

                if (position.get("title") == null)
                    dto.setCo_title("");
                else
                    dto.setCo_title(position.get("title").toString());

                if (salary.get("name") == null)
                    dto.setCo_salary("");
                else
                    dto.setCo_salary(salary.get("name").toString());

                if (positionT.get("name") == null)
                    dto.setCo_job_type("");
                else
                    dto.setCo_job_type(positionT.get("name").toString());

                if (positionM.get("name") == null)
                    dto.setCo_job_mid_name("");
                else
                    dto.setCo_job_mid_name(positionM.get("name").toString());

                if (positionJ.get("name") == null)
                    dto.setCo_job_name("");
                else
                    dto.setCo_job_name(positionJ.get("name").toString());

                if (positionL.get("name") == null)
                    dto.setCo_location_name("");
                else
                    dto.setCo_location_name(positionL.get("name").toString());

                if (positionE.get("name") == null)
                    dto.setCo_career("");
                else
                    dto.setCo_career(positionE.get("name").toString());

                dto.setCo_start_date(opening_timestamp);
                dto.setCo_end_date(expiration_timestamp);
                dto.setCo_url(jobsArray.get("url").toString());
                array.add(dto);
            }
        } catch (Exception e) {
            System.out.println("#error1 -> 하루 호출 횟수 초과");
            // if (flag == false) {
            // accessKey = box[1];
            // flag = true;
            // APIexecute(apiURL);
            // }
            System.out.println(e);
        }
        return array;
    }

    public static String getTimestampToDate(String timestampStr) {
        long timestamp = Long.parseLong(timestampStr);
        Date date = new Date(timestamp * 1000L);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("GMT+9"));
        String formattedDate = sdf.format(date);
        return formattedDate;
    }

    public String indexBreaking(String u_job) {
        String count = "30";
        String apiURL = "";
        if (u_job.equals("LoginYet")) {
            apiURL = "https://oapi.saramin.co.kr/job-search?access-key=" + accessKey
                    + "&bbs_gb=1&sr=directhire&job_type=1&sort=rc&count=" + count;
        } else {
            String u_job_code = SaraminJobMidCodeCase(u_job);
            apiURL = "https://oapi.saramin.co.kr/job-search?access-key=" + accessKey
                    + "&bbs_gb=1&sr=directhire&job_type=1&sort=rc&count=" + count + "&job_mid_cd=" + u_job_code;
        }
        System.out.println("api: " + apiURL);
        return apiURL;
    }

    public String indexClick(String u_job) {
        String count = "30";
        String u_job_code = SaraminJobMidCodeCase(u_job);
        String apiURL = "https://oapi.saramin.co.kr/job-search?access-key=" + accessKey
                + "&bbs_gb=0&sr=directhire&sort=rc&count=" + count + "&job_mid_cd=" + u_job_code;
        System.out.println("api: " + apiURL);
        return apiURL;
    }

    public String SaraminJobMidCodeCase(String u_job) {
        switch (u_job) {
            case "기획·전략":
                return "16";
            case "마케팅·홍보·조사":
                return "14";
            case "회계·세무·재무":
                return "3";
            case "인사·노무·HRD":
                return "5";
            case "총무·법무·사무":
                return "4";
            case "IT개발·데이터":
                return "2";
            case "디자인":
                return "15";
            case "영업·판매·무역":
                return "8";
            case "고객상담·TM":
                return "21";
            case "구매·자재·물류":
                return "18";
            case "상품기획·MD":
                return "12";
            case "운전·운송·배송":
                return "7";
            case "서비스":
                return "10";
            case "생산":
                return "11";
            case "건설·건축":
                return "22";
            case "의료":
                return "6";
            case "연구·R":
                return "9";
            case "교육":
                return "19";
            case "미디어·문화·스포츠":
                return "13";
            case "금융·보험":
                return "17";
            case "공공·복지":
                return "20";
        }
        return null;
    }
}