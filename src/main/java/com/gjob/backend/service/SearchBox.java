package com.gjob.backend.service;

import java.net.URLEncoder;
import java.io.UnsupportedEncodingException;
import lombok.Setter;

/*
    검색 조건을 객체화 하여 손쉽게 반복적인 업무는 컬렉션에서 꺼내도록합니다.
    box.get(0) => 공채속보
    간편해지려고 만들었는데 생각보다 복잡해져서 사용여부는 보류 ,,
*/

@Setter
public class SearchBox {
    private String access_key;
    private String resultURL; 
    private String keyword; // 검색어
    private String bbs_gb; //공채구분 1의 경우 공채속보
    private String stock; // 주식 상장여부 kospi = 유가증권 , kosdaq = 코스닥, konex = 코스넥
    private String sr; // directhire = 헤드헌팅 , 파견업체공고제외
    private String loc_cd; // 근무지, 지역조건
    private String loc_mcd; //1차 근무지, 지역조건
    private String loc_bcd; // 2차 근무지, 지역조건
    private String int_cd; // 산업, 업종조건
    private String job_mid_cd; //상위 직무코드
    private String job_cd; // 직무코드
    private String job_type; // 근무형태, 고용형태 조건
    private String edu_lv; // 학력조건
    private String fields; //필드 선택 
    //posting-date : 날짜/시간형식의 게시일시
    //expiration-date : 날짜 / 시간형식의 마감일시
    // keyword-code : 업직종 키워드 코드
    // count : 조회수, 지원자수, 댓글수
    private String published; // date 형식 등록일 검색 (2019-03-20)
    private String published_min; // 등록일시 검색 최소값 (2019-03-20)
    private String published_max; // 등록일시 검색 최대값 (2019-03-20)
    private String update; // 수정일 검색 (2019-03-20)
    private String deadline; // 마감일 today = 오늘 마감 공고 tomorrow : 내일 마감 공고
    private String start; // 페이징처리시 필요함 검색시나오는 게시글의 시작페이지
    private String count; // 검색결과의 수 110이 최대, 10이 최소
    private String sort; // 정렬시 옵션
    /* 
        pd: 게시일 역순(기본값)
        pa: 게시일순
        ud: 최근수정순
        ua: 수정일 정순
        da: 마감일 정순
        dd: 마감일 역순
        rc: 조회수 역순
        ac: 지원자수 역순
     */
    public String getUrl() {
        resultURL = "https://oapi.saramin.co.kr/job-search?";
        if(access_key != null) {
            resultURL += "access-key="+access_key + "&";
        }
        if(keyword != null) {
            try {
                keyword = URLEncoder.encode(keyword,"UTF-8");
            }catch(UnsupportedEncodingException e) {
                System.out.println("encoding Exception");
            }
            
            resultURL += "keyword="+keyword +"&";
        }
        if(bbs_gb != null) {
            resultURL += "bbs_gb=" + bbs_gb + "&";
        }
        if(stock != null) {
            resultURL += "stock=" + stock + "&";
        }
        if(sr != null) {
            resultURL += "sr=" + sr + "&";
        }
        if(loc_cd != null) {
            resultURL += "loc_cd=" + loc_cd + "&";
        }
        if(loc_mcd != null) {
            resultURL += "loc_mcd=" + loc_mcd + "&";
        }
        if(loc_bcd != null) {
            resultURL += "loc_bcd=" + loc_bcd + "&";
        }
        if(int_cd != null) {
            resultURL += "int_cd=" + int_cd + "&";
        }
        if(job_mid_cd != null) {
            resultURL += "job_mid_cd=" + job_mid_cd + "&";
        }
        if(job_cd != null) {
            resultURL += "job_cd=" + job_cd + "&";
        }
        if(job_type != null) {
            resultURL += "job_type=" + job_type + "&";
        }
        if(edu_lv != null) {
            resultURL += "edu_lv=" + edu_lv + "&"; 
        }
        if(fields != null) {
            resultURL += "fields=" + fields + "&";
        }
        if(published != null) {
            resultURL += "published=" + published + "&";
        }
        if(published_min != null) {
            resultURL += "published_min=" + published_min + "&";
        }
        if(published_max != null) {
            resultURL += "published_max=" + published_max + "&";
        }
        if(update != null) {
            resultURL += "update=" + update + "&";
        }
        if(deadline != null) {
            resultURL += "deadline=" + deadline + "&";
        }
        if(start != null) {
            resultURL += "start=" + start + "&";
        }
        if(count != null) {
            resultURL += "count=" + count + "&";
        }
        if(sort != null) {
            resultURL += "sort=" + sort + "&";
        }
        
        //마지막 문자가 & 일때 마지막문자제거
        if(resultURL.charAt(resultURL.length()-1)=='&'){
            resultURL = resultURL.substring(0, resultURL.length()-1);
        }
        return resultURL;
    }
}
