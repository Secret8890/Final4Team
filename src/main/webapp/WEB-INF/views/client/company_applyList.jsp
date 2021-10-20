<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>APPLY LIST</title>
</head>
<body>
    <table border='1' cellpadding='7' cellspacing='2' width='50%'>
        <tr>
            <button type="button" data-row='<sec:authentication property="principal.member.u_name" />' 
            onclick="backToList(this)">리스트로가기</button>

        <th>지원자번호</th>
        <th>공고번호</th>
        <th>지원날짜</th>
        <th>이력서</th>
        <th>자소서</th>
        </tr>
        <c:if test="${empty apply}">
            <tr>
               <td align='center' colspan="5">데이터가 하나도 없음</td>
            </tr>
        </c:if>
        <c:forEach items="${apply}" var="list">
            <tr>
            <td align='center'>${list.u_seq}</td>
            <td align='center'>${list.co_seq}</td>
            <td align='center'>${list.apply_date}</td>
            <td align='center' data-rerow=${list.re_seq} onclick="checkResume(this)">${list.re_seq}</td>
            <td align='center' data-selfrow=${list.self_seq} onclick="checkSelfintro(this)">${list.self_seq}</td>
            </tr>
        </c:forEach>
        
        </table>
        <script>
            function backToList(object){
                let co_name = object.getAttribute('data-row');
                $("#load-section").load('company/listCompany.do?co_name='+co_name);
            }
            function checkResume(object){
                let re_seq = object.getAttribute('data-rerow');
                $("#load-section").load('resume/re_content?re_seq='+re_seq);
            }
            function checkSelfintro(object){
                let self_seq = object.getAttribute('data-selfrow');
                $("#load-section").load('self/self_content?self_seq='+self_seq);
            }
        </script>
</body>
</html>