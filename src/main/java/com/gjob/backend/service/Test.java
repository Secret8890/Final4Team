package com.gjob.backend.service;

import javax.annotation.PostConstruct;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Service;

@Service
public class Test {

    private WebDriver driver;
    private WebElement element;
    private String url;

    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    // https://chromedriver.chromium.org/downloads 에 접속해서 각자 chrome 버전에 맞는 드라이버
    // 다운로드->.exe실행
    public static String WEB_DRIVER_PATH = "C:/chromedriver_win32/chromedriver.exe"; // 드라이버.exe 있는 경로 설정

    // @PostConstruct
    public void test() {
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

        ChromeOptions options = new ChromeOptions();
        options.addArguments("--disable-popup-blocking");
        options.addArguments("--headless"); // chrome창 안뜨게
        // chrome://version/ 접속해서 각자 사용자 에이전트로(uer-agent={개인 사용자 에이전트 경로})->headless 이슈
        options.addArguments(
                "user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36");

        driver = new ChromeDriver(options);
        url = "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41204310&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api";
        try {
            driver.get(url);
            // Thread.sleep(2000);

            element = driver.findElement(By.tagName("iframe"));
            driver.switchTo().frame(element); // iframe 안의 내용 출력

            String html = driver.getPageSource();
            System.out.println(html);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.close();
        }
    }
}
