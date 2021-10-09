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
	
	<form action="/self/insert" method="POST">
        <input type="hidden" name="u_seq" placeholder="U_SEQ(회원번호)" value="1"/> <br/>
        <input type="text" name="self_name" placeholder="SELF_NAME(자기소개서이름)"/> <br/>
        <input type="hidden" name="self_seq" value='${max_seq}' placeholder="SELF_SEQ(자기소개서번호)"/> <br/>
		<input type="text" name="qa_q"  placeholder="질문"/> <br/>
		<input type="text" name="qa_a"  placeholder="답변"/> <br/>
		<button>저장하기</button>
	</form>
</body>
</html>