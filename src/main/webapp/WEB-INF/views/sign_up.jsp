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
    <link rel='stylesheet' type='text/css' media='screen' href='/css/sign_up.css'>
    <script src='/js/intro_main.js'></script>
    <script src="/js/script.js"></script>
</head>
<body>
    <div class="header">
        <div class="TOP">
            <a href="../"><img src="/img/로그1.png"></a>
            <div class="infoborder">
                <div class="infobox">
                    <div style="height: 75px;line-height: 75px">INFO BOX</div>
                    <div style="height: 75px;line-height: 75px">INFO BOX</div>
                    <div style="justify-self:flex-end;margin-left: auto">USER</div>
                </div>
            </div>
        </div>
        <div class="nav_bar">
            <a style="border: thick double salmon">메인</a>
            <a style="border: thick double salmon">채용공고</a>
            <a style="border: thick double salmon">자기소개서</a>
            <a style="border: thick double salmon">이력서관리</a>
            <a style="border: thick double salmon">AI면접관</a>
            <a style="border: thick double salmon">채팅방</a>
            <a style="border: thick double salmon">오늘의핫플</a>
            <a class="search" style="flex-basis: 250px;border: thick double salmon;margin-left: auto;font-size:35px" >SEARCH</a>
        </div>
        <form>
            <div class="content">
                <div class="signup_container">
                    <div class="head">SIGN UP</div>
                    <div class="id_container">
                        <input type="text" id="id" name="id" placeholder="아이디">
                        <input style="width: 15%" type="button" value="중복확인">
                    </div>
                    <input type="text" id="password" name="password" placeholder="비밀번호">
                    <input type="text" id="password2" name="password2" placeholder="비밀번호 확인">
                    <input type="text" id="name" name="name" placeholder="이름">
                    <input type="text" id="email" name="email" placeholder="이메일">
                    <input type="text" id="phone_number" name="phone_number" placeholder="휴대전화">
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
                      <label for="male">male</label><br>
                      <input type="radio" id="female" name="gender" value="female">
                      <label for="female">female</label><br>
                    </div>
                    <div class="signup_cancle">
                        <input type="submit" value="SIGN UP">
                        <input type="button" value="CANCLE">
                    </div>
                </div>
            </div>
        </form>
        <div class="footer">
            <div>FOOTER</div>
        </div>
      </div>
</body>
</html>