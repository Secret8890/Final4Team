<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스 페이지</title>
</head>
<body>
	<h1>인덱스 페이지</h1>
	<hr/>
	<sec:authorize access="isAnonymous()">
		<a href="/login/loginForm">로그인</a>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<!--<sec:authentication property="principal.member" />님 <br/>-->
		<sec:authentication property="principal.member.u_name" />님 <br/>
		<a href="/logout">로그아웃</a> <br/>
		<a href="/login/changePwd">비밀번호 변경</a>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<br>
		관리자 모드
		<br>
		<a href="/admin/passboard/upload">관리자 페이지(합격 자소서 업로드)</a><br>
		<a href="/admin/passboard/list">관리자 페이지(합격 자소서 리스트)</a><br>
		<a href="/list/save">오늘의 공고 저장</a>
	</sec:authorize>
	<a href="/list">사람인 채용정보</a>
</body>
</html>