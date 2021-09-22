<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	<hr/>
	
	<form action="/login" method="POST">
		<input type="text" name="username" placeholder="아이디"/> <br/>
		<input type="password" name="password" placeholder="비밀번호" /> <br/>
		<button>로그인</button>
	</form>
	<a href="/oauth2/authorization/naver">네이버 로그인 및 회원가입</a>
	<a href="/oauth2/authorization/kakao">카카오 로그인 및 회원가입</a>
	<a href="/login/joinForm">회원가입을 아직 하지 않으셨나요?</a>
	<a href="/login/findId">아이디 찾기</a>
	<a href="/login/findPwd">비밀번호 찾기</a>
</body>
</html>