<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>그것이 알고JOB다</title>
    <!--구글 웹폰트 & 내부 페이징 스크립트-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet" />
    <link rel="stylesheet" href="/css/styles.css" />
    <!-- JQuery 2.2.4버전 사용 스크립트-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- 폰트어썸 아이콘사용 스크립트 -->
    <script src="https://kit.fontawesome.com/e3bdd8104f.js" crossorigin="anonymous"></script>
    <link rel='stylesheet' type='text/css' media='screen' href='/css/login_failed.css'>
</head>
<body>
    <header>
        <nav>
            <div class="header-nav">
                <div class="nav-main">
                    <div class="logo-area">
                        <img src="/img/로그10.png" class="logo_img" />
                    </div>
                </div>
                <div class="header-nav nav-buttonArea">
                    <a href="javascript:void(0)" class="nav-button" id="nav-incruit">채용공고</a>
                    <a href="javascript:void(0)" class="nav-button" id="nav-self">자기소개서 및 이력서</a>
                    <a href="javascript:void(0)" class="nav-button" id="nav-ai">AI 가상면접</a>
                    <a href="javascript:void(0)" class="nav-button" id="nav-pass">합격자소서</a>
                    <a href="javascript:void(0)" class="nav-button" id="nav-review">면접리뷰</a>
                    <div class="search-Area" style="display: none">
                        <input type="text" placeholder="검색어를 입력해주세요." class="nav-button search-button"
                            name="search" />
                        <a href="#" class="nav-button search-button">검색</a>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <section id="main-section">
        <div class="container">
            <a><span>로그인 </span>아이디 혹은 비밀번호를 확인해주세요.</a>
            <div class="login">
                <div class="inputlist">
                    <form name="login_form" action="/login" method="POST">
                        <input type="text" name="username" placeholder="ID를 입력해주세요."/>
                        <input type="password" name="password" placeholder="Password를 입력해주세요."/>
                    </form>
                </div>
                <div class="send">
                    <input type="button" id="login_submit" value="LOGIN"/>
                </div>
                <div class="login_container">
                    <a href="javascript:void(0)">
                        <input type="button" onclick="loadTerms()" value="회원가입    |"/></a>
                    <a href="javascript:void(0)" onclick="modalOpen()" class="btn-open-popup"><input type="button" value="아이디/비밀번호 찾기"/></a>
                    
                </div>
                <div class="api_login" style="width:40%">
                    <a href="/oauth2/authorization/naver"><button class="nbutton" id="nbutton" type="button"><img id="nbutton" src="/img/naverlogo.png"></button></a>    
                    <a href="/oauth2/authorization/kakao"><button class="kbutton" id="kbutton" type="button"><img id="kbutton" src="/img/kakaoLogo.png"></button></a>        
                </div>
            </div>
        </div>
    </section>
    <section id="load-section">
    </section>
    <section class="login-section" style="width:100%;height:100%;">
        <div class="modal">
            <div class="modal_body1">
                <div class="login-area">
                    <div class="login-header">
                        <a href="#" class="modal-id-pwd active">ID/PWD 찾기</a>
                    </div>
                    <div class="id-pwd-status active">
                        <div class="login-body find-idpwd">
                            <div class="find-id-head">
                                <span class="idpwd-text">아이디찾기</span>
                            </div>
                            <div class="find-id">
                                <div class="find-id-form">
                                    <input type="text" class="input-box" id="find_email-text" placeholder="E-MAIL" />
                                    <input type="text" class="input-box readonly-verify" id="verifi_id" readonly placeholder="verification code">
                                </div>
                                <div class="send-button">
                                    <input type="button" class="send-input-button" id="find-id-button" value="CHECK">
                                </div>
                            </div>

                            <div class="row-bar">

                            </div>

                            <div class="find-id-head">
                                <span class="idpwd-text">비밀번호 찾기</span>
                            </div>
                            <div class="find-id">
                                <div class="find-id-form">
                                    <input type="text" class="input-box" id="user_name_input" placeholder="NAME" />
                                    <input type="text" class="input-box" id="user_email_input" placeholder="E-MAIL" />
                                </div>
                                <div class="send-button">
                                    <input type="button" class="send-input-button1" id="find_pass_button" value="CHECK">
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer>
        <div class="footer-area">
            <h5>Copyright 2021.09.03 최씨가문</h5>
        </div>
    </footer>
</body>
<script>
    send = document.querySelector('#login_submit');
    send.addEventListener('click',()=>{
        document.login_form.submit();
    })


const loginModal = document.querySelector('.modal');
const btnOpenPopup = document.querySelector('.btn-open-popup');
// if(btnOpenPopup !== null) {
//     btnOpenPopup.addEventListener('click',()=>{
//         loginModal.style.display = 'block';
//     });
// }
function modalOpen() {
    loginModal.style.display = 'block';
    document.getElementById("main-section").style.display = "none";
}
window.onclick = (event)=>{
    if(event.target == loginModal) {
        loginModal.style.display = 'none';
        document.getElementById("main-section").style.display = "block";
    }
}
$(document).ready(function(){
    $("#nav-self").on('click',()=>{
        $('#load-section').load('self');
        document.getElementById("main-section").style.display = "none";
        document.getElementById("load-section").style.display = "block";
    });
    $(".logo_img").on('click',()=>{
        loginLoad();
    });
    $("#login_submit").on('click',()=>{
        document.login_form.submit();
    });
    $("#user_setting").on('click',()=>{
        loadUserSetting();
    })     
});
function loadUserSetting(){
    $("#load-section").load('user/setting');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
}
function loadTerms(){ 
    $('#load-section').load('terms');
    loginModal.style.display = "none";
    document.getElementById("load-section").style.display = "block";
    document.getElementById("main-section").style.display = "none";
}
function loginLoad() {
    document.getElementById("load-section").style.display = "none";
    document.getElementById("main-section").style.display = "block";
}

document.querySelector('#find-id-button').addEventListener('click',()=>{
    $.ajax({
        url : '/findId',
        type : 'POST',
        data : {u_email:$('#find_email-text').val()},
        success : (data)=>{
            $('#verifi_id').val(data);
        }
    });
});
document.querySelector('#find_pass_button').addEventListener('click',()=>{
    $.ajax({
        url : '/findPwd',
        type : 'POST',
        data : {u_name:$('#user_name_input').val(),u_email:$('#user_email_input').val()},
        success: function(res){
            if(res['check']){
                if(confirm("입력하신 이메일로 임시 비밀번호를 전송하겠습니다.")){
                    $.ajax({
                        type:"POST",
                        url:"/findPwd/sendEmail",
                        data:{
                            "u_name":$('#user_name_input').val(),
                            "u_email":$('#user_email_input').val()
                        }
                    })
                    setTimeout(() => {
                        window.location.href="/";
                         }, 2000);
                }
            }else if(res['naver']){
                alert("네이버 가입자입니다. 네이버를 통해 비밀번호를 찾아주세요.");
            }else if(res['kakao']){
                alert("카카오 가입자입니다. 카카오를 통해 비밀번호를 찾아주세요.");
            }else{
                alert("일치하는 정보가 없습니다.");
            }
        },error: function(res){
            alert("실패");
        }
    })
})
</script>
<script src="/js/main_nav.js">
</script>
</html>