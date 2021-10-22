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
    <div id="restBoardListDiv" class="restBoardListDiv">
        </div>
        <div id="pageNumDiv">
        </div>
</body>
<script type="text/javascript" language="javascript"
		    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script language="javascript">
    var page=1;
    boardDisplay(page);

    function boardDisplay(pageNum){
        page=pageNum;
        $.ajax({
            type:"GET",
            url:"/admin/adminboard/listGet?pageNum="+pageNum,
            dataType:"json",
            success:function(json){
                tableDisplay(json.board);
                pageDisplay(json.pager);
            }
        })
    }
    function tableDisplay(board){
        var html="";
        html+="<table id='table__table'>";
        html+="<tr>";
        html+="<th color='gray'>회원 이름</th>";
        html+="<th color='gray'>휴대전화번호</th>";
        html+="<th color='gray'>이메일</th>";
        html+="<th color='gray'>권한</th>";
        html+="<th color='gray'>admin</th>";
        html+="<th color='gray'>user</th>";
        html+="<th color='gray'>blackList</th>";
        html+="<th color='gray'>가입날짜</th>";
        
        html+="</tr>";
        $.each(board, function(i){
            html+="<tr>";
            html+="<TD>"+board[i].u_name+"</TD>";
            html+="<TD>"+board[i].u_email+"</TD>";
            html+="<TD>"+board[i].u_phone+"</TD>";
            html+="<TD>"+board[i].isManager+"</TD>";
            html+="<td class='text_ct'><input type='checkbox' name='RowCheck_admin' value="+board[i].u_seq+" onclick=updateAdmin("+board[i].u_seq+")></td>";
            html+="<td class='text_ct'><input type='checkbox' name='RowCheck_user' value="+board[i].u_seq+" onclick=updateUser("+board[i].u_seq+")></td>";
            html+="<td class='text_ct'><input type='checkbox' name='RowCheck_blackList' value="+board[i].u_seq+" onclick=updateBlack("+board[i].u_seq+")></td>";
            html+="<TD>"+board[i].u_memberSince+"</TD>";
            html+="</tr>";
        });
        html+="</table>";
        $("#restBoardListDiv").html(html);
    }
    function pageDisplay(pager){
        var html="";
        if(pager.startPage>pager.blockSize){
            html+="<a href='javascript:boardDisplay(1);'>[처음]</a>";
            html+="<a href='javascript:boardDisplay("+pager.prevPage+");'>[이전]</a>";
        }else{
            html+="[처음][이전]";
        }

        for(var i=pager.startPage; i<=pager.endPage; i++){
            if(pager.pageNum!=i){
                html+="<a href='javascript:boardDisplay("+i+");'>["+i+"]</a>";
            }else{
                html+="["+i+"]";
            }
        }

        if(pager.endPage!=pager.totalPage){
            html+="<a href='javascript:boardDisplay("+pager.nextPage+");'>[다음]</a>";
            html+="<a href='javascript:boardDisplay("+pager.totalPage+");'>[마지막]</a>";
        }else{
            html+="[다음][마지막]";
        }

        $("#pageNumDiv").html(html);
    }

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