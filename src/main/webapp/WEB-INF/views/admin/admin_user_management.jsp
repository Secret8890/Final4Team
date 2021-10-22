<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/admin_user_management.css" rel="stylesheet" />
    <title>Document</title>
</head>
<body id="body-pd">
    <div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                    <img class="nav__toggle" id="nav-toggle" src="/img/로그5.png" />
                    <!-- <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon> -->
                    <a href="/" class="nav__logo">그것이 알고JOB다</a>
                </div>
                <div class="nav__list">
                    <a href="#" class="nav__link active">
                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">공지사항 관리</span>
                    </a>
                    <a href="/admin/usermanagement" class="nav__link">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">사용자 관리</span>
                    </a>

                    <a href="/admin/passboard/dash" class="nav__link">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">통계 관리</span>
                    </a>

                    <a href="#" class="nav__link">
                        <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">자기소개서 관리</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>

    <h1>회원관리페이지</h1>
    <div class="card-body">
			<table class="table table-dark">
                <colgroup>
                    <col width="12.5%">
                    <col width="15%">
                    <col width="15%">
                    <col width="12.5%">
                    <col width="5%">
                    <col width="5%">
                    <col width="5%">
                </colgroup>
			    <thead>
                    <h2>회원관리</h2>
			        <tr align="center">
			            <th>회원 이름</th>
                        <th>휴대전화번호</th>
			            <th>이메일</th>
                        <th>권한</th>
                        <th>admin</th>
                        <th>user</th>
                        <th>blackList</th>
			        </tr>
			    </thead>
			    <tbody>
			    	<c:forEach items="${list}" var="list">
						<tr align="center">
                            <td>${list.u_name}</td>
				 			<td>${list.u_phone}</td>
                            <td>${list.u_email}</td>
                            <td>${list.isManager}</td>
                            <td class="text_ct"><input type="checkbox" name="RowCheck_admin" value="${list.u_seq}" onclick="updateAdmin('${list.u_seq}')"></td>
                            <td class="text_ct"><input type="checkbox" name="RowCheck_user" value="${list.u_seq}" onclick="updateUser('${list.u_seq}')"></td>
                            <td class="text_ct"><input type="checkbox" name="RowCheck_blackList" value="${list.u_seq}" onclick="updateBlack('${list.u_seq}')"></td>
						</tr>
					</c:forEach>
					
	            </tbody>
	        </table>
	    </div>
</body>
<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
    function updateAdmin(u_seq){
        $("input[type=checkbox]").prop("checked",false);
        if(confirm("관리자 권한을 부여 하시겠습니까?")){
            $("input[type=checkbox]").prop("checked",false);
            $.ajax({
                    url: "/admin/updateAdmin",
                    type:"POST",
                    data:{u_seq},
                    success: function(data){
                        window.location.reload();
                    }
                })
            //window.location.reload();
        }
        else {
            $("input[type=checkbox]").prop("checked",false);
        }
    }
    function updateUser(u_seq){
        if(confirm("유저 권한을 부여 하시겠습니까?")){
            $("input[type=checkbox]").prop("checked",false);
            $.ajax({
                    url: "/admin/updateUser",
                    type:"POST",
                    data:{u_seq},
                    success: function(data){     
                        window.location.reload();
                    }
                })
            //window.location.reload();
        }else{
            $("input[type=checkbox]").prop("checked",false);
        }
    }
    function updateBlack(u_seq){
        if(confirm("블랙리스트 권한을 부여 하시겠습니까?")){
            $("input[type=checkbox]").prop("checked",false);
            $.ajax({
                    url: "/admin/updateBlack",
                    type:"POST",
                    data:{u_seq},
                    success: function(data){
                        window.location.reload();
                    }
                })
            //window.location.reload();
        }else{
            $("input[type=checkbox]").prop("checked",false);
        }
    }
</script>

<!-- IONICONS -->
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<!--js-->
<script src="/js/adminjs.js"></script>
</html>