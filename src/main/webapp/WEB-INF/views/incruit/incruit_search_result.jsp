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
                <table class="card-body">
                    <colgroup>
                        <col width="400px">
                        <col width="400px">
                        <col width="150px">
                        <col width="150px">
                        <col width="140px">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">제목</th>
                            <th scope="col">지역</th>
                            <th scope="col">경력</th>
                            <th scope="col">기업명</th>
                            <th scope="col">마감일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${map.board}" var="list">
                        <c:if test="${ list.co_location_name.length() < 30 }">
                            <tr>
                                <td>${list.co_title}</td>
                                <td>${list.co_location_name}</td>
                                <c:if test="${ list.co_location_name.length() > 30 }">
                                    <td>${list.co_location_name.substring(0,10)}...</td>
                                </c:if>
                                <td>${list.co_career}</td>
                                <td>${list.co_name}</td>
                                <td>${list.co_end_date}</td>
                            </tr>
                        </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="pageNumDiv" id="pageNumDiv">
            <c:choose>
                <c:when test="${map.pager.startPage > map.pager.blockSize}">
                    <a href="/incruit/search?workSelected=${map.work}&&regionSelected=${map.region}&&career=${map.career}&&work_type=${map.work_type}&&education=${map.education}&&pageNum=1">[처음]</a>
                    <a href="/incruit/search?workSelected=${map.work}&&regionSelected=${map.region}&&career=${map.career}&&work_type=${map.work_type}&&education=${map.education}&&pageNum=${map.pager.prevPage}">[이전]</a>
                </c:when>
                <c:otherwise>
                    <a href="#">처음</a> 
                    <a href="#">이전</a>
                </c:otherwise>
            </c:choose>
            <c:set var="pageNum" value="${map.pager.pageNum}" />
            <c:forEach var="i" begin="${map.pager.startPage}" end="${map.pager.endPage}">
                <c:choose>
                    <c:when test="${i != pageNum}">
                        <a href="/incruit/search?workSelected=${map.work}&&regionSelected=${map.region}&&career=${map.career}&&work_type=${map.work_type}&&education=${map.education}&&pageNum=${i}">${i}</a>
                    </c:when>
                    <c:otherwise>
                        <span class="scroll_a">${i}</span>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${map.pager.endPage != map.pager.totalPage}">
                    <a href="/incruit/search?workSelected=${map.work}&&regionSelected=${map.region}&&career=${map.career}&&work_type=${map.work_type}&&education=${map.education}&&pageNum=${map.pager.nextPage}">[다음]</a>
                    <a href="/incruit/search?workSelected=${map.work}&&regionSelected=${map.region}&&career=${map.career}&&work_type=${map.work_type}&&education=${map.education}&&pageNum=${map.pager.totalPage}">[마지막]</a>
                </c:when>
                <c:otherwise>
                    <a href="#">다음</a> 
                    <a href="#">마지막</a>
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