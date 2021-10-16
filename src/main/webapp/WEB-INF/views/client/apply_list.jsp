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
            <h1>입사 지원한 공고</h1>
            <div class="user_info">
                <table>
                    <tr>
                        <th>회사 공고</th>
                        <th>제출일</th>
                        <th>제출한 이력서/자기소개서</th>
                        <th>기업 열람 여부</th>
                    </tr>                   
                        <c:forEach items="${dto}" var="list">
                            <tr>               
                                <td data-num="${list.co_seq}" onclick="showIncruit(this)">${list.co_title}</td>
                                <td>${list.apply_date}</td>
                                <td>
                                    <c:if test="${list.re_seq eq 0}">
                                        <input type="button" data-num="${list.self_seq}" value="내용 보기" onclick="showDetailSelf(this)"/></td>
                                    </c:if>
                                    <c:if test="${list.self_seq eq 0}">
                                        <input type="button" data-num="${list.re_seq}" value="내용 보기" onclick="showDetailRe(this)"/></td>
                                    </c:if>
                                <td> - </td>
                            </tr>  
                        </c:forEach>
                </table>
            </div>
        </div>
    </div>

</body>
<script src="js/setting_script.js"></script>
<script>
    function showDetailSelf(obj){
        let seq = obj.getAttribute('data-num');
        $('#load-section').load('self/content?seq='+seq);
    }
    function showDetailRe(obj){
        let seq = obj.getAttribute('data-num');
        $('#load-section').load('resume/content?seq='+seq);
    }
    function showIncruit(obj){
        let seq=obj.getAttribute('data-num');
        $('#load-section').load('/list/notice/'+seq);
    }
</script>
</html>