<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>자소설 닷컴</title>
    <!--구글 웹폰트 & 내부 페이징 스크립트-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet" />
    <link rel="stylesheet" href="/css/styles.css" />
    <link rel='stylesheet' type='text/css' media='screen' href='/css/recruit.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <!-- JQuery 2.2.4버전 사용 스크립트-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- 폰트어썸 아이콘사용 스크립트 -->
    <script src="https://kit.fontawesome.com/e3bdd8104f.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <nav>
            <div class="header-nav">
                <div class="nav-main">
                    <div class="logo-area">
                        <img src="/img/로그10.png" class="logo_img" />
                    </div>
                    <div class="topInfo-area">
                        <div class="info1">
                            <sec:authorize access="hasRole('ROLE_ADMIN')" >
                                <a class="nav-button" href="/admin/passboard/list">
                                    관리자모드
                                </a>
                            </sec:authorize>
                        </div>
                        <div class="info2">
                            <sec:authorize access="isAuthenticated()">
                                <sec:authentication property="principal.member.u_name" /> 님 <br/>
                                환영합니다 !
                            </sec:authorize>
                        </div>
                        <div class="info_button">
                        <sec:authorize access="isAnonymous()">
                            <a href="#" class="btn-open-popup"><img src="/img/login.png"></a>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">                            
                            <a href="#" id="user_setting"><i class="fas fa-users-cog header_icon"></i></a><br/>
                            <a href="/logout" onclick="removeStorage()"><i class="fas fa-sign-out-alt header_icon"></i></a> <br/>
                        </sec:authorize>
                            
                        </div>
                    </div>
                </div>
                <div class="header-nav nav-buttonArea">
                    <a href="javascript:void(0)" class="nav-button" id="nav-incruit">채용공고</a>
                    <a href="javascript:void(0)" class="nav-button" id="nav-self">자기소개서 및 이력서</a>
                    <a href="javascript:void(0)" class="nav-button" id="nav-ai">AI 가상면접</a>
                    <a href="javascript:void(0)" class="nav-button" id="nav-pass">합격자소서</a>
                    <a href="javascript:void(0)" class="nav-button" id="nav-review">면접리뷰</a>
                    <div class="search-Area" style="display: none">
                        <input type="text" placeholder="검색어를 입력해주세요." class="nav-button search-button"
                            name="search" />
                        <a href="#" class="nav-button search-button">검색</a>
                    </div>
                </div>
            </div>

        </nav>
    </header>
    <section id="main-section">
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
                            <tr class="incruit_row" onclick="location.href='/notice/${list.co_seq}';" >
                                <td>${list.co_title}</td>
                                <c:if test="${ list.co_location_name.length() <= 30 }">
                                    <td>${list.co_location_name}</td>
                                </c:if>
                                <c:if test="${ list.co_location_name.length() > 30 }">
                                    <td>${list.co_location_name.substring(0,10)}...</td>
                                </c:if>
                                <td>${list.co_career}</td>
                                <td>${list.co_name}</td>
                                <td>${list.co_end_date}</td>
                            </tr>
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
    </section>
    <div id="load-section">
    </div>
    <footer>
        <div class="footer-area">
            <h5>Copyright 2021.09.03 최씨가문</h5>
        </div>
    </footer>
    <script src='/js/recruit.js'></script>   
    <script src='/js/main_nav.js'></script>
</body>
<script type="text/javascript" language="javascript"
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
</script>
</html>