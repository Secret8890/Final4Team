<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<script type="text/javascript" language="javascript" 
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    $("#checkEmail").on("click", function(){
        let u_email=$("#u_email").val();
        $.ajax({
            type: "GET",
            url:"check/findId",
            data: {"u_email":u_email},
            success: function(data){
                if(data==3){
                    alert("카카오 가입자입니다.");
                }else if(data==2){
                    alert("네이버 가입자입니다.");
                }else if(data==1){
                    if(confirm("가입된 정보를 찾았습니다.")){
                        $.ajax({
                            type:"POST",
                            url:"findId/showId",
                            data:{u_email:u_email},
                            success:function(data){
                                //document.write(data);
                                $("#container-find").hide();
                                $("#container-show").show();
                                $("#message").text("회원님의 아이디는 "+data+"입니다.");
                            }
                        });
                    }
                }else if(data==0){
                    alert("입력하신 이메일로 존재하는 아이디가 없습니다.");
                }else if(data==-1){
                    alert("-1");
                }
            },error: function(data){
                alert("실패");
            }
        });
    });
})
    
</script>
        
</head>
<body>
	<h1>아이디 찾기</h1>
	<hr/>
	
	<form id="container-find">
        <input type="text" id="u_email" placeholder="가입 시 등록한 이메일을 입력하세요"/> <br/>
		<button type="button" id="checkEmail">추가정보입력</button>
	</form>
    <div id="container-show" style="display: none;">
        <div id="message"></div>
        <button onclick="location.href='/login/loginForm'">로그인 페이지로</button>
    </div>

</body>
</html>