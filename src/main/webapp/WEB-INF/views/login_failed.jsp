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
    <div class="header">
        <div class="TOP">
            <a href="../"><img src="/img/로그1.png"></a>
        </div>
        <form>
            <div class="container">
                <a>로그인에 실패했습니다. 아이디혹은 비밀번호를 확인해주세요</a>
                <div class="login">
                    <div class="inputlist">
                        <input type="text" name="username" placeholder="아이디"/>
                        <input type="password" name="password" placeholder="비밀번호" />
                    </div>
                    <div class="send">
                        <input type="submit" value="LOGIN"/>
                    </div>
                </div>
                <div class="find_signup">
                    <a href="#"><input type="button" value="회원가입"/></a>
                    <a href="#"><input type="button" value="아이디 찾기"/></a>
                    <a href="#"><input type="button" value="비밀번호 찾기"/></a>
                </div>
                <div class="api_login" style="justify-content: space-around;width:40%">
                    <a href="#"><input type="button" value="네이버 로그인"/></a>
                    <a href="#"><input type="button" value="카카오 로그인"/></a>                    
                </div>
            </div>
        </form>
        <div class="footer">
            <div>FOOTER</div>
        </div>

        
    <script src='/js/login_failed.js'></script>    
</body>
</html>