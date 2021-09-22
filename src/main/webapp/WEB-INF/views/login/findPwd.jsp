<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    $("#checkEmail").on("click", function(){
        let u_email=$("#u_email").val();
        let u_name=$("#u_name").val();
        $.ajax({
            type: "GET",
            url:"check/findPwd",
            data: {
                "u_email":u_email,
                "u_name":u_name
            },
            success: function(res){
                if(res['check']){
                    if(confirm("입력하신 이메일로 임시 비밀번호를 전송하겠습니다.")){
                        $.ajax({
                            type:"POST",
                            url:"check/findPwd/sendEmail",
                            data:{
                                "u_email":u_email,
                                "u_name":u_name
                            }
                        })
                        window.location.href="/login/loginForm";
                    }else{
                        console.log("취소");
                    }
                }else if(res['naver']){
                    alert("네이버 가입자입니다. 네이버를 통해 비밀번호를 찾아주세요.");
                    window.location.href="/login/loginForm";
                }else if(res['kakao']){
                    alert("카카오 가입자입니다. 카카오를 통해 비밀번호를 찾아주세요.");
                    window.location.href="/login/loginForm";
                }else{
                    alert("일치하는 정보가 없습니다.");
                }
            },error: function(res){
                alert("실패");
            }
        });
    });
})
    
</script>
        
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<hr/>
	
	<form>
        <input type="text" id="u_email" placeholder="가입이 등록한 이메일을 입력하세요"/> <br/>
        <input type="text" id="u_name" placeholder="가입시 등록한 이름을 입력하세요"/> <br/>
		<button type="button" id="checkEmail">추가정보입력</button>
	</form>

</body>
</html>