<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자기소개서 insert페이지</title>
</head>
<body>
	<h1>자기소개서 insert페이지</h1>
	<hr/>
	
	<form action="/self/insert.self" method="POST">
        <!--<input type="text" name="self_seq" placeholder="SELF_SEQ(자기소개서번호)"/> <br/>-->
        <input type="text" name="u_seq" placeholder="U_SEQ(회원번호)"/> <br/>
        <input type="text" name="co_seq" placeholder="CO_SEQ(작성할 회사번호)"/> <br/>
		<button>저장하기</button>
	</form>

        

</body>
</html>