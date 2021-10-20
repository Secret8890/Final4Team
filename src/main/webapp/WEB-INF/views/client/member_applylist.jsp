<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>APPLY CHECK</title>
</head>
<body>
    <div>
        <table border='1' cellpadding='7' cellspacing='2' width='50%'>
            <tr>
            <th>공고번호</th>
            <th>지원날짜</th>
            <th>제출서류</th>
            <th>읽음확인</th>
            </tr>
            <c:forEach items="${applycheck}" var="list">
                <tr>
                <td align='center'>${list.co_seq}</td>
                <td align='center'>${list.apply_date}</td>
                <td><button data-self="${list.self_seq}" data-resume="${list.re_seq}" onclick="showDetail(this)">내용보기</button></td>
                <td><button data-resume="${list.re_seq}" onclick="applyCheck(this)">읽음확인</button></td>
                </tr>
            </c:forEach>
        </table>
        <script>
            function showDetail(object){
                let self = object.getAttribute('data-self');
                let resume=object.getAttribute('data-resume');
                $('#load-section').load('resume/content?self_seq='+self+'&&re_seq='+resume);
            }
            function applyCheck(object){
                let resume=object.getAttribute('data-resume');
                $.ajax({
                    url : '/applyCheck?re_seq='+resume,
                    type : 'GET',
                    data : resume,
                    success:function(data){
                        console.log(data);
                        if(data === "true"){
                            alert("읽음");
                        }
                        else{
                            alert("읽지않음");
                        }
                    }
                })
            }
        </script>
    </div>
</body>
</html>