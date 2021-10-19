<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
<body style="text-align:center">
    <center>
        &nbsp;&nbsp;&nbsp;
        <a href='/test/introduce_main.do'>인덱스</a>
        <br/>
        <table border='1' cellpadding='7' cellspacing='2' width='50%'>
        <tr>
        <th>번호</th>
        <th>제목</th>
        <th>삭제</th>
        </tr>
        <c:if test="${empty list}">
            <tr>
               <td align='center' colspan="5">데이터가 하나도 없음</td>
            </tr>
        </c:if>
        <c:forEach items="${list}" var="intro">
            <tr>
            <td align='center'>${intro.seq}</td>
            <td><a href='introduce_content.do?seq=${intro.seq}'>${intro.subject}</a></td>
            <td align='center'><a href='delete.do?seq=${intro.seq}'>삭제</a></td>
            </tr>
        </c:forEach>
        
        </table>
    </center>
</body>
</html>