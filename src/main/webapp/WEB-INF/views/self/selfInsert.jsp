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
	<div class="self_area">
	<form action="/self/insert" method="POST">
		
        <input type="hidden" name="u_seq" placeholder="U_SEQ(회원번호)" value="1"/> <br/>
		<th>자기소개서이름</th>
        <input type="text" name="self_name" placeholder="SELF_NAME(자기소개서이름)"/> <br/>
        <input type="hidden" name="self_seq" value='${max_seq}' placeholder="SELF_SEQ(자기소개서번호)"/> <br/>
		<th>질문</th>
		<input type="text" name="qa_q"  placeholder="질문" style="width:1000px; height:100px;"/> <br/>
		<th>답변</th>
		<input type="text" name="qa_a"  placeholder="답변" style="width:1000px; height:100px;"/> <br/>

		
	</form>
	</div>
	<button>저장하기</button><button>추가하기</button>
</body>
</html>