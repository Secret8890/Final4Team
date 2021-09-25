<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='/css/intro_write.css'>
    <script src='/js/intro_write.js'></script>
    <script src="/js/script.js"></script>
</head>
<body>
    <div class="header">
        <div class="TOP">
            <a href="../"><img src="/img/로그1.png"></a>
            <div class="infoborder">
                <div class="infobox">
                    <div style="height: 75px;line-height: 75px">INFO BOX</div>
                    <div style="height: 75px;line-height: 75px">INFO BOX</div>
                    <div style="width: 170px;justify-self:flex-end;margin-left: auto">USER</div>
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
        <div class="introduce_indicator">자기소개서 작성</div>
        <div class="introduce_caution">
            <div>작성 주의사항1</div>
            <div>작성 주의사항2</div>
            <div>작성 주의사항3</div>
        </div>
        <form action="write.do" method="post">
        <div class="introduce_subject">
            <input type="text" id="subject" name="subject" placeholder="자기소개서 제목">
        </div>
        
            <div class="introduce_table">
                <div class="introduce_title">
                    <select style="flex-grow: 1" class="combobox" name="combo">
                        <option value="항목1">항목1</option>
                        <option value="항목2">항목2</option>
                        <option value="항목3">항목3</option>
                    </select>
                    <input style="flex-grow: 2" type="text" id="combo_title" name="combo_title" placeholder="항목 제목">
                </div>
                <div class="introduce_content">
                    <textarea name="content" placeholder="자기소개서 내용을 입력하세요" ></textarea>
                </div>
                <div class="add_delete">
                    <input type="button" id="delete" value="삭제">
                    <input type="button" id="add" value="항목 추가">
                </div>
                <div class="introduce_save">
                    <input id="save" type="submit" value="수정">
                </div>
            </div>
        </form>



        <div class="footer">
            <div>FOOTER</div>
        </div>
</body>
</html>