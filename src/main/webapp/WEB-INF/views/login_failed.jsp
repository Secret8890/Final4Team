<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>success_index</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='/css/login_failed.css'>
</head>
<body>
        <div class="container">
            <a><span>로그인 실패 </span>아이디 혹은 비밀번호를 확인해주세요.</a>
            <div class="login">
                <div class="inputlist">
                    <input type="text" name="username" placeholder="아이디"/>
                    <input type="password" name="password" placeholder="비밀번호" />
                </div>
                <div class="send">
                    <input type="submit" value="LOGIN"/>
                </div>
                <div class="login_container">
                    <a href="javascript:void(0)"><input type="button" value="회원가입    |"/></a>
                    <a href="javascript:void(0)"><input type="button" value="아이디 찾기    |"/></a>
                    <a href="javascript:void(0)"><input type="button" value="비밀번호 찾기"/></a>
                </div>
                <div class="api_login" style="width:40%">
                    <a href="javascript:void(0)"><button class="nbutton" id="nbutton" type="button"><img id="nbutton" src="/img/naverlogo.png"></button></a>    
                    <a href="javascript:void(0)"><button class="kbutton" id="kbutton" type="button"><img id="kbutton" src="/img/kakaoLogo.png"></button></a>        
                </div>
            </div>
        </div>
</body>
</html>