<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/admin_passboard.css" rel="stylesheet" />
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

                    <a href="/admin/statistics" class="nav__link">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">통계 관리</span>
                    </a>

                    <a href="/admin/passboard/list" class="nav__link">
                        <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">자기소개서 관리</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>

    <h1>회원 관리 페이지</h1>
    <div id="restBoardListDiv" class="restBoardListDiv">
        </div>
        <div id="pageNumDiv" class="pageNumDiv">
        </div>
</body>
<script type="text/javascript" language="javascript"
		    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script language="javascript">
    var page=1;
    boardDisplay(page);

    function OnChange(object)
    {    
        var gubun = object.options[object.selectedIndex].value;
        if ( gubun != "none" ){
            updateGrant(object.getAttribute('u_seq'),gubun);
        }
    }

    function boardDisplay(pageNum){
        page=pageNum;
        $.ajax({
            type:"GET",
            url:"/admin/userListGet?pageNum="+pageNum,
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
        html+="<th color='gray'>가입날짜</th>";
        html+="<th color='gray'>권한 변경</th>";
        
        html+="</tr>";
        $.each(board, function(i){
            html+="<tr>";
            html+="<TD>"+board[i].u_name+"</TD>";
            html+="<TD>"+board[i].u_email+"</TD>";
            html+="<TD>"+board[i].u_phone+"</TD>";
            html+="<TD>"+board[i].isManager+"</TD>";
            html+="<TD>"+board[i].u_memberSince+"</TD>";
            html+="<td>";
            html+="<select name='updateM' id='updateM' onChange='OnChange(this)' u_seq="+board[i].u_seq+" >";
            html+="<option value='none' >=== 선택 ===</option>";
            html+="<option value='ROLE_ADMIN' >ADMIN</option>";
            html+="<option value='ROLE_USER' >USER</option>";
            html+="<option value='ROLE_BLACKLIST' >BLACKLIST</option>";
            html+="</select>";
            html+="</td>";

            
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

    function updateGrant(u_seq,isManager){
        $("input[type=checkbox]").prop("checked",false);
        if(confirm("권한을 부여 하시겠습니까?")){
            $("input[type=checkbox]").prop("checked",false);
            $.ajax({
                    url: "/admin/updateUserGrant",
                    type:"PUT",
                    data:{u_seq,isManager},
                    success: function(data){
                        window.location.reload();
                    }
                })
        }
        else {
            window.location.reload();
        }
    }
    
</script>
<!-- IONICONS -->
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<!--js-->
<script src="/js/adminjs.js"></script>
</html>