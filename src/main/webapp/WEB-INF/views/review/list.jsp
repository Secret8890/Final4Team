<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/list.css"/>
		<title>Document</title>
	</head>

	<body>
		<div align='center' id="restBoardListDiv">
		</div>
		<div align='center' id="pageNumDiv">
		</div>
	</body>
    
    <body>
        <a href=boardform.do>글쓰기작성</a>
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
            url:"/review/listGet?pageNum="+pageNum,
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
        html+="<th>리뷰번호</th>";
        html+="<th color='gray'>제목</th>";
        html+="<th color='gray'>유저번호</th>";
        html+="<th color='gray'>회사번호</th>";
        html+="<th color='gray'>날짜</th>";
        html+="<th color='gray'>조회수</th>";
        html+="<th color='gray'>삭제</th>";
        html+="</tr>";
        $.each(board, function(i){
            html+="<tr>";
            html+="<TD>"+board[i].review_seq+"</TD>";
            html+="<TD><a href='boardview.do?review_seq="+board[i].review_seq+"'>"+board[i].review_title+"</TD>";
            html+="<TD>"+board[i].u_seq+"</TD>";
            html+="<TD>"+board[i].co_seq+"</TD>";
            html+="<TD>"+board[i].review_date+"</TD>";
            html+="<TD>"+board[i].pass_hit+"</TD>";
            html+="<TD data-num="+board[i].review_seq+" onclick='deleteClick(this)'>삭제</TD>";
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
                url:"/review/del.do",
                type:"POST",
                data:{
                    review_seq: num // 키:벨류 형식으로 해주기위해 컨트롤러에서 형변환,,,
                },
                success:function(data){
                    alert(data);
                    window.location.href="/review/list.do";
                },error:function(){
                    alert('에러');
                }
            })
        }
    }
</script>

</html>