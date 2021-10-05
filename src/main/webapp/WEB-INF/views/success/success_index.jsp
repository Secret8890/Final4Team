<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
    rel="stylesheet" />
    <link rel="stylesheet" href="/css/styles.css" />
    <link rel="stylesheet" href="/css/pass_style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
    <h1 align="center">합격자소서 ! !</h1>
    <div class="incruit_area">
        <c:forEach items="${map.board}" var="list">
            <div class="card card-data">
                <div class="card-header" data-num="${list.pass_seq}" onclick="showDetail(this)">
                    <h3>${list.pass_title}</h3>
                </div>
                <div class="card-body">    
                    <h3>${list.pass_company}</h3>
                    <span>${list.pass_career}</span>
                    <span>${list.pass_job}</span>
                </div>
            </div>
        </c:forEach>
    </div>
    <div id="pageNumDiv">
    </div>
    <div class="pass_modal">
        <div class='contentDiv' style='display: none;'>
        </div>
    </div>
</body>

<script>
    var page=1;
    // boardDisplay(page);

    // function boardDisplay(pageNum){
    //     page=pageNum;
    //     $.ajax({
    //         type:"GET",
    //         url:"/pass/listGet?pageNum="+pageNum,
    //         dataType:"json",
    //         success:function(json){
    //             tableDisplay(json.board);
    //             pageDisplay(json.pager);
    //         }
    //     })
    // }


//이거 c:ForEach 으로 치환진행. 굳이이럴필요가없음
    function tableDisplay(board){
        var html="";
        // $.each(board, function(i){
        //     html+="<div class='card card-data'>";
        //     html+="<div class='card-header' data-num='"+board[i].pass_seq+"' onclick='showDetail(this)'"+">";
        //     html+="<h3>"+board[i].pass_title+"</h3>";
        //     html+="</div>";
        //     html+="<div class='card-body'>";
        //     html+=board[i].pass_company+"<br/>";
        //     html+=board[i].pass_career+"<br/>";
        //     html+="<h3>"+board[i].pass_job+"</h3>";
        //     html+="</div>";
        //     html+="</div>";
        // });
        //$(".incruit_area").html(html);
    }
    // function pageDisplay(pager){
    //     var html="";
    //     if(pager.startPage>pager.blockSize){
    //         html+="<a href='javascript:boardDisplay(1);'>[처음]</a>";
    //         html+="<a href='javascript:boardDisplay("+pager.prevPage+");'>[이전]</a>";
    //     }else{
    //         html+="[처음][이전]";
    //     }

    //     for(var i=pager.startPage; i<=pager.endPage; i++){
    //         if(pager.pageNum!=i){
    //             html+="<a href='javascript:boardDisplay("+i+");'>["+i+"]</a>";
    //         }else{
    //             html+="["+i+"]";
    //         }
    //     }

    //     if(pager.endPage!=pager.totalPage){
    //         html+="<a href='javascript:boardDisplay("+pager.nextPage+");'>[다음]</a>";
    //         html+="<a href='javascript:boardDisplay("+pager.totalPage+");'>[마지막]</a>";
    //     }else{
    //         html+="[다음][마지막]";
    //     }

    //     $("#pageNumDiv").html(html);
    // }
    function showDetail(obj){
        let num=$(obj).attr("data-num");
        $.ajax({
            url:"/pass/content",
            type:"GET",
            data:{num: num},
            dataType:"json",
            success: function(json){
                console.log("###: "+json.content.pass_seq);
                    $(".pass_modal").show();
                    var html="";
                    html+="<table>";
                    html+="<tr>";
                    html+="<th>컨텐츠명</th>";
                    html+="<td>"+json.content.pass_title+"</td>";
                    html+="</tr>";
                    html+="<tr>";
                    html+="<th>구분</th>";
                    html+="<TD>"+json.content.pass_career+"</TD>";
                    html+="</tr>";
                    html+="<tr>";
                    html+="<th>지원분야</th>";
                    html+="<TD>"+json.content.pass_job+"</TD>";
                    html+="</tr>";
                    html+="<tr>";
                    html+="<th>학교</th>";
                    html+="<TD>"+json.content.pass_univ+"</TD>";
                    html+="</tr>";
                    html+="<tr>";
                    html+="<th>학점</th>";
                    html+="<TD>"+json.content.pass_grade+"</TD>";
                    html+="</tr>";
                    html+="<tr>";
                    html+="<th>토익</th>";
                    html+="<TD>"+json.content.pass_toeic+"</TD>";
                    html+="</tr>";
                    html+="<tr>";
                    html+="<th>상세내용</th>";
                    html+="<TD>"+json.content.pass_content+"</TD>";
                    html+="</tr>";
                    html+="</table>";
                    html+="<div style='text-align:center'>";
                    html+="<input type='button' value='이전' onclick='backButton()'>";
                    html+="</div>";
                    $(".contentDiv").html(html);
                    $(".contentDiv").show();
            
            }
        })
    }
    function backButton(){
        $(".pass_modal").hide();
    }
    window.onclick = (event) => {
        if(event.target == document.querySelector('.pass_modal')) {
            $('.pass_modal').hide();
        } else if(event.target == document.querySelector('.modal')) {
            $('.modal').hide();
        }
    };
</script>
</html>