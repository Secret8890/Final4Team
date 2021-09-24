<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>success_index</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='/css/success_index.css'>


</head>
<body>
    <div class="header">
        <div class="TOP">
            <a href="../"><img src="/img/로그1.png"></a>
            <div class="infoborder">
                <div class="infobox">
                    <div style="height: 75px;line-height: 75px">INFO BOX</div>
                    <div style="height: 75px;line-height: 75px">INFO BOX</div>
                    <div style="justify-self:flex-end;margin-left: auto">USER</div>
                </div>
            </div>
        </div>
        <div class="nav_bar">
            <a style="border: thick double salmon">메인</a>
            <a style="border: thick double salmon">채용공고</a>
            <a style="border: thick double salmon">자기소개서</a>
            <a style="border: thick double salmon">이력서관리</a>
            <a style="border: thick double salmon">AI면접관</a>
            <a style="border: thick double salmon">채팅방</a>
            <a style="border: thick double salmon">오늘의핫플</a>
            <a class="search" style="flex-basis: 250px;border: thick double salmon;margin-left: auto;font-size:35px" >SEARCH</a>
        </div>
        <div class="head">
            <div>합격 자소서 관리</div>
        </div>
        <div class="container">
            <button class="show">
                <div>합격 자소서1</div>
            </button>
            <button class="show">합격 자소서2</button>
            <button class="show">합격 자소서3</button>
            <button class="show">합격 자소서4</button>
            <button class="show">합격 자소서5</button>
            <button class="show">합격 자소서6</button>
            <button class="show">합격 자소서7</button>
            <button class="show">합격 자소서8</button>
            <button class="show">합격 자소서9</button>
            <button class="show">합격 자소서10</button>
            <button class="show">합격 자소서11</button>
            <button class="show">합격 자소서12</button>
        </div>
  
        <div class="footer">
            <div>FOOTER</div>
        </div>
        <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="modal_content">
                <div class="modal_header">
                    <span class="close">&times;</span>
                    <h2>자소서 제목</h2>
                </div>
                <div class="modal_body">
                    <p>합격한 기업, 직군</p>
                    <p>자소서 본문</p>
                </div>
                <div class="modal_footer">
                    <h3>합격자 정보</h3>
                </div>
            </div>
        </div>
        
    <script src='/js/success_index.js'></script>    
</body>
</html>