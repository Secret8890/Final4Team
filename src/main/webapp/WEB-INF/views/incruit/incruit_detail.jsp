<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" tyle="text/css" href="/css/crawling.css"/>
    <!-- JQuery 2.2.4버전 사용 스크립트-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Document</title>
</head>
<!-- <body>
    <div class="incruit_c">
        <!--공고 상세페이지-->
        <div class="incruit_text">
            <h1>${dto.co_name}</h1>
            <button class="w-btn w-btn-gra1 w-btn-gra-anim" id="join_incruit" type="button">
            입사지원하기
            </button>
            <button class="w-btn w-btn-gra1 w-btn-gra-anim" id="enter_chat" type="button">
            채팅방 입장
            </button>
        </div>
        ${list.cl_iframe}
        <div class="incruit_d" align="center">
            <input type="hidden" id="co_seq" value="${list.co_seq}">
            <input type="hidden" id="cl_seq" value="${list.cl_seq}">
        </div> -->
<body>  
    <div class="incruit_modal">
        <div class="incruit_modal_body">
            <div class="resume_area">
                <select id="choiceResume">
                    <c:forEach items="${map['resumeList']}" var="list">    
                        <option value="${list.re_seq}">${list.re_title}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="self_area">
                <select id="choiceSelf">
                    <c:forEach items="${map['selfList']}" var="list">    
                        <option value="${list.self_seq}">${list.self_name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="choice_button_area">
                <input type="button" id="choice_complete" value="선택완료"/>
            </div> 
        </div>
    </div>
    
    <!--공고 상세페이지-->
    ${dto.co_name} <br/> <br/>
    ${map['crawling'].cl_logo}
    ${map['crawling'].cl_iframe}
    <div align="center">
        <input type="hidden" id="co_seq" value="${map['company'].co_seq}">
        <input type="hidden" id="cl_seq" value="${map['crawling'].cl_seq}">
        <button class="w-btn w-btn-gra1 w-btn-gra-anim" id="join_incruit" type="button">
        입사지원하기
        </button>
        <button class="w-btn w-btn-gra1 w-btn-gra-anim" id="enter_chat" type="button">
        채팅방 입장
        </button>
    </div>
    <script src="/js/incruit_detail.js">
        
    </script>
</body>
</html>