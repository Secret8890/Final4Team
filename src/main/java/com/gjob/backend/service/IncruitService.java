package com.gjob.backend.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import com.gjob.backend.mapper.IncruitMapper;
import com.gjob.backend.mapper.CrawlingMapper;
import com.gjob.backend.model.IncruitDTO;
import com.gjob.backend.model.CrawlingDTO;
import com.gjob.backend.model.IncruitSearchDTO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IncruitService {

    private static String[] box = { "MbPbeZQjFGxRQ8J3qKfwOjESFZvmtfXzJ8rIxflvzJCOomNvha",
            "qzddmxO7zEodTywzlYNTjVsrsizpTMB6uAGFCfj86obvJ34a" };
    private static String accessKey = box[0]; // 발급받은 accessKey";
    private boolean flag = false;

    private String total, start_res, count_res, html, html_7 = "";

    private WebDriver driver;
    private WebElement element, element2, element3, element4, element5, element6, element7, element8, element9;

    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    // https://chromedriver.chromium.org/downloads 에 접속해서 각자 chrome 버전에 맞는 드라이버
    // 다운로드->.exe실행
    public static String WEB_DRIVER_PATH = "C:/chromedriver_win32/chromedriver.exe"; // 드라이버.exe 있는 경로 설정

    @Autowired
    private IncruitMapper mapper;

    @Autowired
    private CrawlingMapper mapper_cl;

    public List<IncruitDTO> selectS() {
        return mapper.select();
    }

    public List<IncruitDTO> selectAjaxS(Map<String, Object> map) {
        return mapper.selectAjax(map);
    }

    public int selectCountS() {
        return mapper.selectCount();
    }

    public IncruitDTO selectBySeqS(String co_seq) {
        return mapper.selectBySeq(co_seq);
    }

    public List<IncruitDTO> selectNameS(String co_name) {
        return mapper.selectName(co_name);
    }

    public void insertS(IncruitDTO dto) {
        mapper.insert(dto);
    }

    public void deleteByDateS(String co_end_date) {
        mapper.deleteByDate(co_end_date);
    }

    public void deleteS(int co_seq) {
        mapper.delete(co_seq);
    }

    public void updateCompanyS(IncruitDTO dto) {
        System.out.println("UPDATE" + dto);
        mapper.updateCompany(dto);
    }

    public List<IncruitDTO> selectByCapitalAreaS() {
        return mapper.selectByCapitalArea();
    }

    public List<IncruitDTO> selectByEndDateS() {
        return mapper.selectByEndDate();
    }

    public List<IncruitDTO> selectByEndDateLoginS(String co_job_mid_name) {
        return mapper.selectByEndDateLogin(co_job_mid_name);
    }

    public int countByDetailSearchS(IncruitSearchDTO dto) {
        return mapper.countByDetailSearch(dto);
    }

    public List<IncruitDTO> searchByDetailS(Map<String, Object> map) {
        return mapper.searchByDetail(map);
    }

    public int getTodayIncruitCountS() {
        return mapper.getTodayIncruitCount();
    }

    public int getLastco_seqS(){
        return mapper.getLastco_seq();
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

    // JSONArray 리턴 함수
    public void execute(String apiURL) {
        try {
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Accept", "application/json");

            int responseCode = con.getResponseCode();
            BufferedReader br;

            if (responseCode == 200) {
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {
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
            System.out.println("#error2 -> 하루 호출 횟수 초과");
            if (flag == false) {
                accessKey = box[1];
                flag = true;
                int indexEqual = apiURL.indexOf("=");
                int indexAnd = apiURL.indexOf("&");
                String start = apiURL.substring(0, indexEqual + 1);
                String end = apiURL.substring(indexAnd);
                execute(start + accessKey + end);
            }
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
                JSONObject positionR = (JSONObject) position.get("required-education-level");
                String opening_timestamp = getTimestampToDate(jobsArray.get("opening-timestamp").toString());
                String expiration_timestamp = getTimestampToDate(jobsArray.get("expiration-timestamp").toString());
                IncruitDTO dto = new IncruitDTO();

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

                if (positionR.get("name") == null)
                    dto.setCo_education("");
                else
                    dto.setCo_education(positionR.get("name").toString());

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

    public CrawlingDTO loadContent(String url, String co_seq) {
        int co_read_count = mapper.selectByCount(Integer.parseInt(co_seq)); // co_read_count불러오기 co_read_count는 크롤링을
                                                                            // 한번이상 했는지 유무 1유 0무
        if (co_read_count == 1) { // 크롤링을 한번이상 했을경우
            return mapper_cl.selectCL(Integer.parseInt(co_seq)); // DB에서 꺼내서 list형식으로 리턴
        }
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
        // String url2 =
        // "https://www.saramin.co.kr/zf_user/jobs/relay/view?isMypage=no&rec_idx=41174219&recommend_ids=eJxtj7sBxDAIQ6e5HvGnvkGy%2FxZnOzFOcYWLZ4EklEhc1a%2Fk%2BsRXX3jp%2FAC7WuJK%2BNIrTI0aLd0RextgU45HlZIAA%2B0tzMOrUT2F6g%2FuZIJWR80iEaMZsMaz4HWw0qNmMt1FaLzaKigpZvKjcpBmtDPJONlfmGZ8coVVGmkcPIoeK8%2Bqpf4AlnRHvw%3D%3D&view_type=list&gz=1&t_ref_content=section_favor_001&t_ref=area_recruit&t_ref_area=101#seq=0";
        try {

            CrawlingDTO crawlingdto = new CrawlingDTO();
            driver.get(url);
            // Thread.sleep(2000);
            try {
                element9 = driver.findElement(By.cssSelector("div.logo"));
                html_7 = element9.getAttribute("innerHTML"); // 7. 로고
                System.out.println("element9 : " + element9);
                System.out.println("html_7 : " + html_7);
            } catch (NoSuchElementException ne) {
                System.out.println("Logo NoSuchElementException");
            }

            element = driver.findElement(By.xpath("//*[@id=\"iframe_content_0\"]"));
            driver.switchTo().frame(element); // iframe 안의 내용 출력

            element2 = driver.findElement(By.xpath("/html/body/div"));
            html = element2.getAttribute("innerHTML");

            element3 = driver.findElement(By.xpath("/html/body/div/div/table/tbody/tr[2]/td/table/tbody/tr[1]/td/div"));// 1.
                                                                                                                        // 모집부문
                                                                                                                        // 및
                                                                                                                        // 상세내용
            String html_1 = element3.getAttribute("innerHTML"); // 1. 모집부문 및 상세내용 html

            element4 = driver.findElement(By.xpath("/html/body/div/div/table/tbody/tr[2]/td/table/tbody/tr[2]/td/div"));// 2.근무조건
            String html_2 = element4.getAttribute("innerHTML"); // 2.근무조건 html

            element5 = driver.findElement(By.xpath("//*[@id=\"template_step_hiring_process_list\"]")); // 3. 전형절차
            String html_3 = element5.getAttribute("innerHTML"); // 3. 전형절차 html

            element6 = driver.findElement(By.xpath("/html/body/div/div/table/tbody/tr[2]/td/table/tbody/tr[4]/td/div")); // 4.
                                                                                                                         // 접수기간
                                                                                                                         // 및
                                                                                                                         // 방법
            String html_4 = element6.getAttribute("innerHTML"); // 4. 접수기간 및 방법 html

            element7 = driver.findElement(By.xpath("//*[@id=\"template_caution\"]/td/div")); // 5. 유의사항
            String html_5 = element7.getAttribute("innerHTML"); // 5. 유의사항 html

            element8 = driver.findElement(By.xpath("/html/body/div/div/table/tbody/tr[1]/td/table")); // 6. 사진
            String html_6 = element8.getAttribute("innerHTML"); // 6. 사진

            crawlingdto.setCo_seq(Integer.parseInt(co_seq));
            crawlingdto.setCl_recruitment(html_1);
            crawlingdto.setCl_workingconditions(html_2);
            crawlingdto.setCl_screeningproce(html_3);
            crawlingdto.setCl_applicationperiod(html_4);
            crawlingdto.setCl_notice(html_5);
            crawlingdto.setCl_img(html_6);
            crawlingdto.setCl_logo(html_7);
            crawlingdto.setCl_status("true"); // 사람인 틀 인경우 cl_status컬럼에 true를 넣음

            mapper_cl.insertCL(crawlingdto);
            mapper.update(Integer.parseInt(co_seq)); // co_read_count 컬럼의 0을 1로 바꾸는 부분 (크롤링 유무)
            return mapper_cl.selectCL(Integer.parseInt(co_seq));

        } catch (Exception e) {
            CrawlingDTO crawlingdto = new CrawlingDTO();
            System.out.println("div NoSuchElementException");
            crawlingdto.setCo_seq(Integer.parseInt(co_seq));
            crawlingdto.setCl_logo(html_7);
            crawlingdto.setCl_iframe(html); // iframe컬럼에 iframe전체를 넣음
            crawlingdto.setCl_status("false"); // 대기업,중견기업(css가 적용된 html) 인경우 cl_status컬럼에 false를 넣음
            mapper_cl.insertCL(crawlingdto);
            mapper.update(Integer.parseInt(co_seq));
            return mapper_cl.selectCL(Integer.parseInt(co_seq));
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
        // return null;
    }

    // 메인 페이지에서 실행하는 사람인 함수
    public List<IncruitDTO> APIexecute(String apiURL) {
        List<IncruitDTO> array = new ArrayList<IncruitDTO>();
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
                JSONObject positionR = (JSONObject) position.get("required-education-level");
                String opening_timestamp = getTimestampToDate(jobsArray.get("opening-timestamp").toString());
                String expiration_timestamp = getTimestampToDate(jobsArray.get("expiration-timestamp").toString());
                IncruitDTO dto = new IncruitDTO();

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

                if (positionR.get("name") == null)
                    dto.setCo_education("");
                else
                    dto.setCo_education(positionR.get("name").toString());

                dto.setCo_start_date(opening_timestamp);
                dto.setCo_end_date(expiration_timestamp);
                dto.setCo_url(jobsArray.get("url").toString());
                array.add(dto);
            }
        } catch (Exception e) {
            System.out.println("#error -> 하루 호출 횟수 초과");
            if (flag == false) {
                accessKey = box[1];
                flag = true;
                int indexEqual = apiURL.indexOf("=");
                int indexAnd = apiURL.indexOf("&");
                String start = apiURL.substring(0, indexEqual + 1);
                String end = apiURL.substring(indexAnd);
                APIexecute(start + accessKey + end);
            }
        }
        // 새롭게 받아온 공고 insert
        for (IncruitDTO list : array) {
            mapper.insert(list);
        }
        return array;
    }
}