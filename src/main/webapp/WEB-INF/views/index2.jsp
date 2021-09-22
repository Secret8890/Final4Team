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
		<a href="/logout">로그아웃</a>
		<a href="/login/changePwd">비밀번호 변경</a>
	</sec:authorize>
	<a href="/login/ad">추가 입력(테스트용 임시)</a>
</body>
</html>