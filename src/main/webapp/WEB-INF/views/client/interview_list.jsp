<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/setting.css" />
    <!-- JQuery 2.2.4버전 사용 스크립트-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>

<body>
    <div class="setting_main">
        <nav>
            <div class="side_nav">
                <h3 class="side_nav_text">PROFILE</h3>
                <a href="#">내 정보</a>
                <a href="#" id="side_nav_manage">자소서 및 이력서 관리</a>
                <a href="#">입사 지원한 공고</a>
                <a class="a1" id="side_nav_ai">AI 면접 관리</a>
            </div>
            
        </nav>
        <script>
            $('#side_nav_manage').on('click',()=>{
                $('#load-section').load('resume/intro_manage?u_seq='+$('#u_seq').val());
            });
            $('#side_nav_ai').on('click',()=>{
                $('#load-section').load('interview/list');
            })
        </script>
        <div class="user_setting">
            <h1>AI 면접 리스트</h1>
            <div class="user_info">
                <table>
                    <tr>
                        <th>면접리스트번호</th>
                        <th>응시일</th>
                        <th>내용보기</th>
                    </tr>                   
                        <c:forEach items="${list}" var="list">
                            <tr>               
                                <td>${list.interview_seq}</td>
                                <td>${list.chat_date}</td>
                                <td><input type="button" data-num="${list.interview_seq}" value="내용 보기" onclick="showDetail(this)"/></td>
                            </tr>  
                        </c:forEach>
                </table>
            </div>
        </div>
    </div>

</body>
<script>
    function showDetail(obj){
        let seq = obj.getAttribute('data-num');
        $('#load-section').load('interview/content?seq='+seq);
    }
</script>
</html>