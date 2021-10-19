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
    <h1>합격자소서</h1>
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
        <c:choose>
            <c:when test="${map.pager.startPage > map.pager.blockSize}">
                <a href="/pass/list?pageNum=1">[처음]</a>
                <a href="/pass/list?pageNum=${map.pager.prevPage}">[이전]</a>
            </c:when>
            <c:otherwise>
                [처음] [이전]
            </c:otherwise>
        </c:choose>
        <c:set var="pageNum" value="${map.pager.pageNum}" />
        <c:forEach var="i" begin="${map.pager.startPage}" end="${map.pager.endPage}">
            <c:choose>
                <c:when test="${i != pageNum}">
                <a href="/pass/list?pageNum=${i}">${i}</a>
                </c:when>
                <c:otherwise>
                    ${i}
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${map.pager.endPage != map.pager.totalPage}">
                <a href="/pass/list?pageNum=${map.pager.nextPage}">[다음]</a>
                <a href="/pass/list?pageNum=${map.pager.totalPage}">[마지막]</a>
            </c:when>
            <c:otherwise>
                [다음] [마지막]
            </c:otherwise>
        </c:choose>
    </div>
    <div class="pass_modal">
        <div class='contentDiv' style='display: none; overflow:auto; '>
        </div>
    </div>
</body>

<script>
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
                    html+="<colgroup>";
                    html+="<col width=8%";
                    html+="<col width=92%>";
                    html+="</colgroup>";
                    html+="<tbody>";
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
                    html+="</tbody>";
                    html+="</table>";
                    html+="<div style='text-align:center'>";
                    html+="<input type='button' value='이전' onclick='backButton()'>";
                    html+="</div>";
                    $(".contentDiv").html(html);
                    $(".contentDiv").show();
                    $('body').css("overflow-y", "hidden");
            
            }
        })
    }
    function backButton(){
        $(".pass_modal").hide();
    }
    window.onclick = (event) => {
        if(event.target == document.querySelector('.pass_modal')) {
            $('.pass_modal').hide();
            $('body').css("overflow-y", "auto");
        } else if(event.target == document.querySelector('.modal')) {
            $('.modal').hide();
            $('body').css("overflow-y", "auto");
        }
    };
</script>
</html>