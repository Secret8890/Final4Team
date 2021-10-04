package com.gjob.backend.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import com.gjob.backend.mapper.CompanyMapper;
import com.gjob.backend.model.CompanyDTO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyService {
    private static String accessKey = "MbPbeZQjFGxRQ8J3qKfwOjESFZvmtfXzJ8rIxflvzJCOomNvha"; // 발급받은 accessKey
    private String total, start_res, count_res = "";

    private WebDriver driver;
    private WebElement element, element2, element3;

    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    // https://chromedriver.chromium.org/downloads 에 접속해서 각자 chrome 버전에 맞는 드라이버
    // 다운로드->.exe실행
    public static String WEB_DRIVER_PATH = "C:/chromedriver_win32/chromedriver.exe"; // 드라이버.exe 있는 경로 설정

    @Autowired
    private CompanyMapper mapper;

    public List<CompanyDTO> selectS() {
        return mapper.select();
    }

    public List<CompanyDTO> selectAjaxS(Map<String, Object> map) {
        return mapper.selectAjax(map);
    }

    public int selectCountS() {
        return mapper.selectCount();
    }

    public CompanyDTO selectBySeqS(String co_seq) {
        return mapper.selectBySeq(co_seq);
    }

    public void insertS(CompanyDTO dto) {
        mapper.insert(dto);
    }

    public void deleteByDateS(String co_end_date) {
        mapper.deleteByDate(co_end_date);
    }

    public List<CompanyDTO> selectByCapitalAreaS() {
        return mapper.selectByCapitalArea();
    }

    public List<CompanyDTO> selectByEndDateS() {
        return mapper.selectByEndDate();
    }

    public List<CompanyDTO> selectByEndDateLoginS(String co_job_mid_name) {
        return mapper.selectByEndDateLogin(co_job_mid_name);
    }

    // 기본 (매일 공고 URL)
    // URL 생성하는 함수
    // ->조건 : 헤드헌팅.파견업체공고제외/오늘 날짜
    public void createUrl(String start) {
        Date nowDate = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(simpleDateFormat.format(nowDate));
        String published = simpleDateFormat.format(nowDate);
        String count = "100";
        String apiURL = "https://oapi.saramin.co.kr/job-search?access-key=" + accessKey + "&sr=directhire&start="
                + start + "&count=" + count + "&published=" + published;
        execute(apiURL);
    }

    // 대기업 공채 속보(로그인 X)
    public void createUrlRecruitment() {
        String count = "30";
        String apiURL = "https://oapi.saramin.co.kr/job-search?access-key=MbPbeZQjFGxRQ8J3qKfwOjESFZvmtfXzJ8rIxflvzJCOomNvha&bbs_gb=1&sr=directhire&job_type=1&sort=rc&count="
                + count;
        execute(apiURL);
    }

    // JSONArray 리턴 함수
    public void execute(String apiURL) {
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
            total = jobArray.get("total").toString();
            start_res = jobArray.get("start").toString();
            count_res = jobArray.get("count").toString();

            JSONArray jArray = (JSONArray) jobArray.get("job");
            save(jArray);
        } catch (Exception e) {
            System.out.println("#error1 -> 하루 호출 횟수 초과");
            System.out.println(e);
        }
    }

    // 받은 jArray를 DB에 저장
    public void save(JSONArray jArray) {
        try {
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
                mapper.insert(dto);
            }
            if ((Integer.parseInt(count_res) != 0)
                    && (Integer.parseInt(start_res) != Integer.parseInt(total) / Integer.parseInt(count_res))) {
                start_res = Integer.toString(Integer.parseInt(start_res) + 1);
                createUrl(start_res);
            }
        } catch (Exception e) {
            System.out.println("#error2");
            e.printStackTrace();
        }
    }

    public static String getTimestampToDate(String timestampStr) {
        long timestamp = Long.parseLong(timestampStr);
        Date date = new Date(timestamp * 1000L);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("GMT+9"));
        String formattedDate = sdf.format(date);
        return formattedDate;
    }

    public String loadContent(String url) {
        System.out.println("url: " + url);
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

        ChromeOptions options = new ChromeOptions();
        options.addArguments("--disable-popup-blocking");
        options.addArguments("--headless"); // chrome창 안뜨게
        options.addArguments("lang=ko_KR");
        // chrome://version/ 접속해서 각자 사용자 에이전트로(uer-agent={개인 사용자 에이전트 경로})->headless 이슈
        options.addArguments(
                "user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36");

        driver = new ChromeDriver(options);

        try {
            driver.get(url);
            // Thread.sleep(2000);

            element = driver.findElement(By.xpath("//*[@id=\"iframe_content_0\"]"));
            driver.switchTo().frame(element); // iframe 안의 내용 출력
            element2 = driver.findElement(By.xpath("/html/body/div"));
            String html = element2.getAttribute("innerHTML");
            return html;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (driver != null) {
                    driver.close();
                    driver.quit();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
