<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SELF CONTENT</title>
</head>
<body>
    <div>
        <c:forEach items="${content}" var="ques">
            <table>
                <tr>
                    <th width="30%">QA_SEQ</th> 
                    <td>${ques.qa_seq}</td>
                </tr>
                <tr>
                    <th width="30%">자소서번호</th> 
                    <td>${ques.self_seq}</td>
                </tr>
                <tr>
                    <th width="30%">항목제목</th> 
                    <td>${ques.qa_q}</td>
                </tr>
                <tr>
                    <th width="30%">내용</th> 
                    <td>${ques.qa_a}</td>
                </tr>
            </table>
        </c:forEach>

    </div>
    <script src="/js/company.js"></script>
</body>
</html>