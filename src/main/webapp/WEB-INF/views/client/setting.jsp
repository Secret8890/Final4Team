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
            <div class="menu">
                <div class="title" onclick="f()">PROFILE <span class="fa fa-bars"></span>
                    <div class="arrow"></div>
                </div>
                <div class="dropdown">
                    <p>내 정보 <span class="fas fa-info-circle"></span></p>
                    <p>자소서 및 이력서 관리 <span class="fas fa-paperclip"></span></p>
                    <p>입사 지원한 공고 <span class="fas fa-building"></span></p>
                    <p>AI 면접 관리 <span class="fas fa-desktop"></span></p>
                </div>
            </div>

        <script>
            $('#side_nav_manage').on('click',()=>{
                $('#load-section').load('resume/intro_manage?u_seq='+$('#u_seq').val());
            });
            $('#side_nav_ai').on('click',()=>{
                $('#load-section').load('interview/list');
            })
        </script>
        <div class="user_setting">
            <h1>정보변경</h1>
            <div class="user_info">
                <input type="hidden" id="u_seq" class="text_form" value='<sec:authentication property="principal.member.u_seq" />' readonly>
                <div class="set_row">
                    <div class="set_head">아이디</div><input type="text" class="text_form" value='<sec:authentication property="principal.member.u_id" />' readonly>
                </div>
                <div class="set_row">
                    <div class="set_head">이름</div><input type="text" class="text_form" id="u_name" value='<sec:authentication property="principal.member.u_name" />' readonly>
                </div>
                <div class="set_row">
                    <div class="set_head">비밀번호</div>
                    <div class="passField">
                        <input type="password" class="pass_form">
                        <input type="button" value="변경" class="pass_button">
                    </div>
                </div>
                <div class="set_row">
                    <div class="set_head">생년월일</div><input type="date" id="u_birth" class="text_form" value='<sec:authentication property="principal.member.u_birth" />'>
                </div>
                <div class="set_row">
                    <div class="set_head">이메일주소</div><input type="text" id="u_email" class="text_form" value='<sec:authentication property="principal.member.u_email" />'>
                </div>
                <div class="set_row">
                    <div class="set_head">휴대폰번호</div><input type="text" id="u_phone" class="text_form" value='<sec:authentication property="principal.member.u_phone" />'>
                </div>
                <div class="set_row">
                    <div class="set_head">학교</div><input type="text" id="u_lastschool" class="text_form" value='<sec:authentication property="principal.member.u_lastschool" />'>
                </div>
                <div class="set_row">
                    <div class="set_head">학과</div><input type="text" id="u_major" class="text_form" value='<sec:authentication property="principal.member.u_major" />'>
                </div>
                <div class="set_row">
                    <div class="set_head">선호 직종</div><input type="text" id="u_job" class="text_form" value='<sec:authentication property="principal.member.u_job" />'>
                </div>
            </div>
            <div>
                <input type="button" class="change_button" value="변경사항 저장하기">
            </div>
        </div>
    </div>
    <div class="pass_modal hidden">
        <div class="modalBox">
        <div class="closeArea">
            <input type="button" class="closeBtn" value="✖">
        </div>
            <h1>비밀번호 변경</h1>
            <div class="change_pass">
                <div>
                    <div>현재비밀번호</div>
                    <input type="password" id="user_pass">
                </div>
                <div>
                    <div>새로운 비밀번호</div>
                    <input type="password" id="new_pass">
                </div>
                <div>
                    <div>새로운 비밀번호 확인</div>
                    <input type="password" id="new_pass_confirm">
                </div>
                <input type="button1" class="pass_submit" id="pass_submit" value="비밀번호 변경">
            </div>
        </div>
    </div>

</body>
<script>
    function f() {
        document.getElementsByClassName('dropdown')[0].classList.toggle('down');
        document.getElementsByClassName('arrow')[0].classList.toggle('gone');
        if (document.getElementsByClassName('dropdown')[0].classList.contains('down')) {
        setTimeout(function() {
            document.getElementsByClassName('dropdown')[0].style.overflow = 'visible'
        }, 500)
        } else {
        document.getElementsByClassName('dropdown')[0].style.overflow = 'hidden'
        }
    }
</script>
<script src="js/setting_script.js"></script>

</html>