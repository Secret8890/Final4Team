<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자기소개서 insert페이지</title>
</head>
<body>
	<h1>자기소개서 insert페이지</h1>
	<hr/>
	<div class="self_out">
		<input type="hidden" id="u_seq" name="u_seq" placeholder="U_SEQ(회원번호)" value="<sec:authentication property='principal.member.u_seq' />"/> <br/>
			<th>자기소개서이름</th>
			<input type="text" name="self_name" id="self_name" placeholder="SELF_NAME(자기소개서이름)"/> <br/>
		<div class="self_area" style="border: 1px solid">
			<input type="hidden" name="self_seq" value='${max_seq}' placeholder="SELF_SEQ(자기소개서번호)"/> <br/>
			<th>질문</th>
			<input type="text" name="qa_q"  placeholder="질문" style="width:1000px; height:100px; border:1px solid;"/> <br/>
			<th>답변</th>
			<input type="text" name="qa_a"  placeholder="답변" style="width:1000px; height:100px; border:1px solid;"/> <br/>
			<input type="button" value="삭제하기" class="delQA_button" onclick="delAction(this)">
		</div>
	</div>
	<input type="button" id="addQA_button" value="추가하기"/>
	<input type="button" id="save_button" value="저장하기"/>
</body>
<script src="/js/self_insert.js">
</script>
</html>