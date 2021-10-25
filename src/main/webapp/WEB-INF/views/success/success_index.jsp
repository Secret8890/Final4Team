<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 폰트어썸 아이콘사용 스크립트 -->
    <script src="https://kit.fontawesome.com/e3bdd8104f.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
    rel="stylesheet" />
    <link rel="stylesheet" href="/css/styles.css" />
    <link rel="stylesheet" href="/css/pass_style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
                            
                            <div class="info2">
                                <sec:authorize access="isAuthenticated()">
                                    <sec:authentication property="principal.member.u_name" /> 님 <br/>
                                    환영합니다 !
                                </sec:authorize>
                            </div>
                            <div class="info_button">
                                <sec:authorize access="hasRole('ROLE_ADMIN')" >
                                        <a href="/admin/passboard/list">
                                            <i class="fas fa-tools header_icon"></i>
                                        </a>
                                </sec:authorize>
                                <sec:authorize access="isAnonymous()">
                                    <a href="#" class="btn-open-popup"><img src="/img/login.png"></a>
                                </sec:authorize>
                                <sec:authorize access="isAuthenticated()">                            
                                    <a href="#" id="user_setting"><i class="fas fa-users-cog header_icon"></i></a><br/>
                                    <a href="/logout"><i class="fas fa-sign-out-alt header_icon"></i></a> <br/>
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
    </section>
    <div class="top">
        <div class="scroll">   
            <a href="#" title="상단"><img src="/img/up.png"></a>
        </div>
    </div>  
    <div id="load-section">
    </div>
    <footer>
        <div class="footer-area">
            <h5>Copyright 2021.09.03 최씨가문</h5>
        </div>
    </footer>
</body>

<script>
</script>

    <script src='/js/main_nav.js'>
    </script>
    <script src='/js/success_index.js'>
    </script>
</html>