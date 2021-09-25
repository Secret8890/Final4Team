<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>

<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#checkPwd").on("click", function(){
			let u_password=$("#u_password").val();
			let u_password_change=$("#u_password_change").val();
			$.ajax({
				type: "POST",
				url: "changePwd",
				data:{
					"u_password": u_password,
					"u_password_change": u_password_change
				},
				success: function(data){
					if(data==1){
						alert("비밀번호 변경이 완료되었습니다.");
						window.location.href="/";
					}else if(data==2){
						alert("기존 비밀번호를 다시 확인해주세요.");
					}
				}, error: function(data){
					alert("실패");
				}
			})
		})
	})
</script>
        
</head>
<body>
	<h1>비밀번호 변경</h1>
	<hr/>
	<form>
        현재 비밀번호 <input type="password" id="u_password"/> <br/>
        변경할 비밀번호 <input type="password" id="u_password_change"/> <br/>
		<button type="button" id="checkPwd">비밀번호 변경</button>
	</form>

</body>
</html>