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
    <link rel='stylesheet' href='/css/additionalForm.css'>
    <!-- JQuery 2.2.4버전 사용 스크립트-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- 폰트어썸 아이콘사용 스크립트 -->
    <script src="https://kit.fontawesome.com/e3bdd8104f.js" crossorigin="anonymous"></script>
</head>
<body>
	<h1>추가정보입력 페이지</h1>
	<form>
        <div class="additional_con">
            출생년도<select id="select_year" name="u_birth"></select>
        </div> 
        <div class="additional_con">
            핸드폰번호<input type="text" class="u_phone" id="u_phone" name="u_phone" placeholder="핸드폰번호"/>
        </div> 
        <div class="additional_con">
            희망직종<input type="text" id="u_job" name="u_job" readonly/><button type="button" id="searchJob">선택하기</button> 
        </div> 
        <div class="additional_con1">최종 학력
            <div class="addicon_radio"><input type="radio" name="u_degree" value="high"/>고등학교 <input type="radio" name="u_degree" value="univ" checked/>대학교 <input type="radio" name="u_degree" value="master1"/>대학원(석사) <input type="radio" name="u_degree" value="master2"/>대학원(박사)  <br/>
            </div>
        </div> 
        <div class="additional_con">
            학교<input type="text" class="input-text2" id="u_lastschool" name="u_lastschool" placeholder="학교명을 검색하세요" readonly/>
            <button type="button" id="searchSchool">검색</button> 
        </div>
        <div id="major_container" class="additional_con">
            전공<input type="text" id="u_major" name="u_major" placeholder="전공명을 검색하세요" readonly/> <button type="button" id="searchMajor">검색</button> 
        </div> 
        <div class="additional_con1">신입/경력
            <div class="addicon_radio"><input type="radio" name="u_career" value="new"/>신입 <input type="radio" name="u_career" value="experienced"/>경력 
            </div>
        </div>
        <input type="button" class="add_button" onclick="additionalSubmit()" value="추가정보입력" />
	</form>
</body>
<script src="/js/join_script.js"></script>
</html>