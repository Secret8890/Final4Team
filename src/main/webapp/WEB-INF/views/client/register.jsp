<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='/css/sign_up.css'/>
    <link rel='stylesheet' href='/css/styles.css'/>
    
</head>
<body>
    <div class="register-area">
        <form>
            <div class="content">
                <div class="signup_container">
                    <div class="head">SIGN UP</div>
                    <div class="signup_all">
                        <div class="id_container">
                            <input type="text" class="input-text" id="regist-id" name="id" placeholder="아이디">
                            <input type="button" value="중복확인">
                        </div>
                        <input type="text" class="input-text" id="password" name="password" placeholder="비밀번호">
                        <input type="text" class="input-text" id="password2" name="password2" placeholder="비밀번호 확인">
                        <input type="text" class="input-text" id="name" name="name" placeholder="이름">
                        <input type="text" class="input-text" id="email" name="email" placeholder="이메일">
                        <input type="text" class="input-text" id="phone_number" name="phone_number" placeholder="휴대전화">
                        <div class="birthday_container">
                            <select style="flex-grow: 1" class="year" name="year">
                                <option value="1년">1년</option>
                                <option value="2년">2년</option>
                                <option value="3년">3년</option>
                            </select>
                            <select style="flex-grow: 1" class="month" name="month">
                                <option value="1월">1월</option>
                                <option value="2월">2월</option>
                                <option value="3월">3월</option>
                            </select>
                            <select style="flex-grow: 1" class="date" name="date">
                                <option value="1일">1일</option>
                                <option value="2일">2일</option>
                                <option value="3일">3일</option>
                            </select>
                        </div>
                        <div class="gender">
                          <input type="radio" id="male" name="gender" value="male">
                          <label for="male">남성</label><br>
                          <input type="radio" id="female" name="gender" value="female">
                          <label for="female">여성</label><br>
                        </div>
                        <div class="signup_cancle">
                            <input type="button" class="send-input-button" value="SIGN UP">
                            <input type="button" class="send-input-button" value="CANCLE">
                        </div>
                    </div>
                </div>
            </div>
        </form>
      </div>
</body>
<script src="/js/script.js"></script>
</html>