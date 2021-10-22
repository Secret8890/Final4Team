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
                    <div class="signup_all">아이디
                        <div class="id_container">
                            <input type="text" id="u_id" name="u_id"class="input-text2" placeholder="아이디" />
                            <button type="button" name="checkID" id="checkID" onclick="fn_checkID();" value="N">ID 중복확인</button>
                        </div>
                            비밀번호<input type="password"id="u_password" name="u_password" class="input-text2" placeholder="비밀번호"/>
                            이름<input type="text" id="u_name" name="u_name" class="input-text2" placeholder="이름"/>
                            이메일<div class="email_container">
                                <input type="email" id="u_email" name="u_email" class="input-text2" placeholder="이메일"/> 
                                <button type="button" id="checkEmail" onclick="fn_checkEmail();" value="N">이메일 중복확인</button>
                            </div>
                            <div class="date_area">생일
                                <select id="select_year" name="u_birthyear">1</select>년 
                                <select id="select_month" name="u_birthmonth">1</select> 월 
                                <select id="select_date" name="u_birthdate">1</select>일
                            </div>
                            <div class="gender_area">성별
                            남성<input type="radio" name="u_gender" value="M"/> 
                            여성<input type="radio" name="u_gender" value="F"/>
                            </div>
                            핸드폰번호<input type="text" id="u_phone" name="u_phone" class="input-text2" placeholder="핸드폰번호"/>
                            희망 직종<div class="job_type">
                                <input type="text"class="input-text2" id="u_job" name="u_job" readonly placeholder="희망직종"/>
                                <button type="button" id="searchJob">선택하기</button>
                            </div>
                            <div class="degree_area">
                                최종 학력
                                <input type="radio" name="u_degree" value="high"/>고등학교 
                                <input type="radio" name="u_degree" value="univ" checked/>대학교 
                                <input type="radio" name="u_degree" value="master1"/>대학원(석사) 
                                <input type="radio" name="u_degree" value="master2"/>대학원(박사)
                            </div>

                            학교<div class="school_container">
                                <input type="text" class="input-text2" id="u_lastschool" name="u_lastschool" placeholder="학교명을 검색하세요" readonly/>
                                <button type="button" id="searchSchool">검색</button>
                            </div>
                            <div id="major_title">
                                전공명
                            </div>
                            <div class="magor_container">
                                <input type="text" class="input-text2" id="u_major" name="u_major" placeholder="전공명을 검색하세요" readonly/> 
                                <button type="button" id="searchMajor">검색</button>
                            </div>
                            <div class="carrer_area">
                                신입<input type="radio" name="u_career" value="new"/>
                                경력<input type="radio" name="u_career" value="experienced"/>
                            </div>
                            <div class="signup_cancle">
                                <input type="button" onclick="joinSubmit()" class="send-input-button5" value="SIGN UP">
                                <input type="button" class="send-input-button6" value="CANCLE" onclick="location.href='/'">
                            </div> 
                        </div>    
                    </div>
                </div>
            </div>
        </form>
      </div>
</body>
<script src="/js/script.js"></script>
<script src="/js/join_script.js"></script>
</html>