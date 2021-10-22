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
        <%-- <nav>
            <div class="side_nav">
                <h3 class="side_nav_text">PROFILE</h3>
                <a href="#">내 정보</a>
                <a href="#" id="side_nav_manage">자소서 및 이력서 관리</a>
                <a href="#">입사 지원한 공고</a>
                <a class="a1" id="side_nav_ai">AI 면접 관리</a>
            </div>
            
        </nav> --%>
        <div class="menu">
                <div class="title" onclick="f()">PROFILE <span class="fa fa-bars"></span>
                    <div class="arrow"></div>
                </div>
                <div class="dropdown">
                    <p class="userInfo_p">내 정보 <span class="fas fa-info-circle"></span></p>
                    <p class="self_manage_p">자소서 및 이력서 관리 <span class="fas fa-paperclip"></span></p>
                    <p class="apply_list_p">입사 지원한 공고 <span class="fas fa-building"></span></p>
                    <p class="aichat_list_p">AI 면접 관리 <span class="fas fa-desktop"></span></p>
                </div>
            </div>
        
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
                        <c:forEach items="${dto}" var="list" varStatus="status">
                            <tr>               
                                <td data-num="${list.co_seq}" onclick="showIncruit(this)">${list.co_title}</td>
                                <td>${list.apply_date}</td>
                                <td>
                                    <input type="button" data-self="${list.self_seq}" data-resume="${list.re_seq}" value="내용 보기" onclick="showDetail(this)"/>
                                </td>
                                <td class="read">${read[status.index]}</td>
                            </tr>  
                        </c:forEach>
                </table>
            </div>
        </div>
    </div>

</body>
<script>
    function showDetail(obj){
        let self = obj.getAttribute('data-self');
        let resume=obj.getAttribute('data-resume');
        $('#load-section').load('/resume/content?self_seq='+self+'&&re_seq='+resume);
    }
    function showIncruit(obj){
        let seq=obj.getAttribute('data-num');
        $('#load-section').load('/notice/'+seq);
    }
    $(document).ready(function(){
        const read = document.querySelectorAll(".read");
        read.forEach(element => {
            if(element.innerHTML === "true"){
                element.innerHTML = "읽음";
            }
            else{
                element.innerHTML = "읽지않음";
            }
        });
    });
</script>
<script src="js/loadNav.js"></script>
</html>