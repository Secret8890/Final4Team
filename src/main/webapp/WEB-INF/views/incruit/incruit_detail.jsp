<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" tyle="text/css" href="/css/crawling.css"/>
    <title>Document</title>
</head>
<body>
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
        </div>
    </div>
    <div class="top">
        <div class="scroll">   
            <a href="#" title="상단"><img src="/img/up.png"></a>
        </div>
    </div>  
</body>
</html>