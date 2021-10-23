package com.gjob.backend.service;

import org.springframework.stereotype.Service;

@Service
public class IndexService {
    String accessKey = "MbPbeZQjFGxRQ8J3qKfwOjESFZvmtfXzJ8rIxflvzJCOomNvha";

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
        return apiURL;
    }

    public String indexClick(String u_job) {
        String count = "30";
        String u_job_code = SaraminJobMidCodeCase(u_job);
        String apiURL = "https://oapi.saramin.co.kr/job-search?access-key=" + accessKey
                + "&bbs_gb=0&sr=directhire&sort=rc&count=" + count + "&job_mid_cd=" + u_job_code;
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
