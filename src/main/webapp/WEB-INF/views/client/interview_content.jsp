<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <script>
            $('#side_nav_manage').on('click',()=>{
                $('#load-section').load('/resume/intro_manage?u_seq='+$('#u_seq').val());
            });
            $('#side_nav_ai').on('click',()=>{
                $('#load-section').load('interview/list');
            })
        </script>

        <div class="user_setting">
            <h1>AI 면접 내용 보기</h1>
            <div class="user_info">
                <table> 
                    <c:forEach items="${board}" var="board">
                        <tr>
                            <td width="30%" align="center">질문</td>
                            <td>${board.chat_q}</td>
                         </tr>
                         <tr>
                            <td align="center">답변</td>
                            <td>${board.chat_a}</td>
                         </tr>
                    </c:forEach>
                </table>
                <input type="button" value="목록으로" onclick="backList()" />
            </div>
        </div>
        
</body>
<script>
    function backList(){
        $('#load-section').load('interview/list');
    }
</script>
<script src="js/loadNav.js"></script>
</html>