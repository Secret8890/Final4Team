<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<html>
<head>
<title>상세보기</title>
<style>
    table, th, td {
       border: 1px solid black;
       border-collapse: collapse;
    }
    th, td {
       padding: 5px;
    }
    a { text-decoration:none }
</style>
</head>
<body>
    <form id="update" action="update.do" method="POST">
        <tr>
            <th>제목</th>
            <input type="text" name="review_title" value='${update.review_title}' style="width:200px; height:15px;" /> <br/>

            <th>조회수</th>
            <input type="text" name="pass_hit" value='${update.pass_hit}' style="width:200px; height:10px;" disabled/> <br/>

            <th>회사번호</th>
            <input type="text" name="co_seq" value='${update.co_seq}' style="width:200px; height:10px;" disabled/> <br/>

            <th>이력서번호</th>
            <input id="review_seq" type="text" name="review_seq" value='${update.review_seq}' style="width:200px; height:10px;" /> <br/>
        </tr>
        <tr>
            <th>작성자</th>
            <input type="text" name="u_seq" value='${update.u_seq}' style="width:200px; height:10px;" disabled/> <br/>
            
            <th>작성시간</th>
            <input type="text" name="review_date" value='${update.review_date}' style="width:200px; height:10px;" disabled/> <br/>

        </tr>
        <tr>
            <th>내용</th>
            <input type="text" name="review_content" placeholder="입력해주세요" value='${update.review_content}' style="width:200px; height:200px;"></td>
        </tr>

        
    </form>
    
    <button id="list" onclick="location.href='boardview.do?review_seq=${update.review_seq}'">목록으로</a>
    <button id="#btn" type="submit" form="update">수정완료</a>
        
     
    
</body>

</html>