<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <!--관리자 업로드 페이지-->
    <div id="restBoardListDiv">
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
            url:"/admin/passboard/listGet?pageNum="+pageNum,
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
        html+="<th>컨텐츠명</th>";
        html+="<th color='gray'>구분</th>";
        html+="<th color='gray'>지원분야</th>";
        html+="<th color='gray'>학교</th>";
        html+="<th color='gray'>학점</th>";
        html+="<th color='gray'>토익</th>";
        html+="<th color='gray'>삭제</th>";
        html+="</tr>";
        $.each(board, function(i){
            html+="<tr>";
            html+="<TD><a href='content/"+board[i].pass_seq+"'>"+board[i].pass_title+"</TD>";
            html+="<TD>"+board[i].pass_career+"</TD>";
            html+="<TD>"+board[i].pass_job+"</TD>";
            html+="<TD>"+board[i].pass_univ+"</TD>";
            html+="<TD>"+board[i].pass_grade+"</TD>";
            html+="<TD>"+board[i].pass_toeic+"</TD>";
            html+="<TD data-num="+board[i].pass_seq+" onclick='deleteClick(this)'>삭제</TD>";
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
    function deleteClick(obj){
        let num=$(obj).attr("data-num");
        console.log(num);
        if(confirm("삭제하시겠습니까?")){
            $.ajax({
                url:"/admin/passboard/delete",
                type:"POST",
                data:{
                    pass_seq: num
                },
                success:function(data){
                    alert(data);
                    window.location.href="/admin/passboard/list";
                },error:function(){
                    alert('에러');
                }
            })
        }
    }
</script>
</html>