<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Recruit</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='/css/recruit.css'>
     <!-- 폰트어썸 아이콘사용 스크립트 -->
     <script src="https://kit.fontawesome.com/e3bdd8104f.js" crossorigin="anonymous"></script>
</head>
<body>
        <div class="search_head">검색 결과</div> 
        <div class="recommend">
            <div class="recom_content">
                <c:forEach items="${map.board}" var="list">
                    <div class="card card-data incruit_card">
                        <div class="card-header">
                            <h3>${list.co_title}</h3>
                        </div>
                        <div class="card-body">
                            <c:if test="${ list.co_location_name.length() < 30 }">
                                <span>${list.co_location_name}</span><br /></c:if>
                            <c:if test="${ list.co_location_name.length() > 30 }">
                                <span>${list.co_location_name.substring(0,10)}...</span><br /></c:if>
                            <span>${list.co_career}</span><br />
                            <h3>${list.co_name}</h3>
                        </div>
                        <div class="card-footer bg-white">마감일 : ${list.co_end_date}</div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div id="pageNumDiv">
            <c:choose>
                <c:when test="${map.pager.startPage > map.pager.blockSize}">
                    <a href="/incruit/search?workSelected=${map.work}&&regionSelected=${map.region}&&$pageNum=1">[처음]</a>
                    <a href="/incruit/search?workSelected=${map.work}&&regionSelected=${map.region}&&pageNum=${map.pager.prevPage}">[이전]</a>
                </c:when>
                <c:otherwise>
                    [처음] [이전]
                </c:otherwise>
            </c:choose>
            <c:set var="pageNum" value="${map.pager.pageNum}" />
            <c:forEach var="i" begin="${map.pager.startPage}" end="${map.pager.endPage}">
                <c:choose>
                    <c:when test="${i != pageNum}">
                        <a href="/incruit/search?workSelected=${map.work}&&regionSelected=${map.region}&&pageNum=${i}">${i}</a>
                    </c:when>
                    <c:otherwise>
                        ${i}
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${map.pager.endPage != map.pager.totalPage}">
                    <a href="/incruit/search?workSelected=${map.work}&&regionSelected=${map.region}&&pageNum=${map.pager.nextPage}">[다음]</a>
                    <a href="/incruit/search?workSelected=${map.work}&&regionSelected=${map.region}&&pageNum=${map.pager.totalPage}">[마지막]</a>
                </c:when>
                <c:otherwise>
                    [다음] [마지막]
                </c:otherwise>
            </c:choose>
        </div>
        <div class="result hidden">
            <ul class="result_content">
            </ul>
        </div>
    <script src='/js/recruit.js'></script>    
</body>
<script type="text/javascript" language="javascript"
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
</script>
</html>