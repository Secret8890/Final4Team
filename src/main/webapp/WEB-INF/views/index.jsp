<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>그것이 알고JOB다</title>
    <!--구글 웹폰트 & 내부 페이징 스크립트-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet" />

    <link rel="stylesheet" href="/css/styles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <!-- JQuery 2.2.4버전 사용 스크립트-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <%-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> --%>
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
                            <a href="/logout" onclick="removeStorage()"><i class="fas fa-sign-out-alt header_icon"></i></a> <br/>
                        </sec:authorize>
                        
                        <sec:authorize access="isAuthenticated()">
                            <sec:authentication property="principal.member.isManager" var="isManager_sec"/>
                            <input type="hidden" id="isManager" value="${isManager_sec}"/>
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
        <div class="banner-area slide">
            <ul>
                <li class="banner1"></li>
                <li class="banner2"></li>
                <li class="banner3"></li>
                <li class="banner4">
                    <h1 class="bh-text">AI 면접봇 '쳥' 출시 !</h1>
                    <h3 class="bb-text">코로나시대로, 비대면이 일상인 지금 당신에게 필요한건 화상면접을 대비할 기회 ! 지금바로 만나보세요 !
                    </h3>
                </li>
            </ul>
        </div>
        <div class="incruit-area">
            <p class="swiper-head">대기업 공채 속보!</p>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <c:forEach items="${array}" var="list">
                        <div class="swiper-slide">
                            <div class="card card-data">
                                <div class="card-header" onclick= "location.href='/incruit/view/${list.co_seq}' ">
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
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-button-next"></div>
                <!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                <div class="swiper-button-prev"></div>
                <!-- 이전 버튼 -->
            </div>
        </div>
        <div class="incruit-area">
            <sec:authorize access="isAnonymous()">
                <p class="swiper-head">마감 앞둔 공고!</p>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <p class="swiper-head">
                    <sec:authentication property="principal.member.u_major" /> 학생들의 마감 앞둔 공고 !
                </p>
            </sec:authorize>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <c:forEach items="${list}" var="list">
                        <div class="swiper-slide">
                            <div class="card card-data">
                                <div class="card-header" onclick= "location.href='/incruit/view/${list.co_seq}' ">
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
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-button-next"></div>
                <!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                <div class="swiper-button-prev"></div>
                <!-- 이전 버튼 -->
            </div>
        </div>
        <div class="incruit-area">
            <sec:authorize access="isAuthenticated()">
                <p class="swiper-head">
                    <sec:authentication property="principal.member.u_name" /> 님이 좋아 하실만 한 공고 !
                </p>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
                <p class="swiper-head">수도권 공고!</p>
            </sec:authorize>
            <div class="swiper-container">
                <div class="swiper-wrapper">
    
                    <c:forEach items="${bbs}" var="list">
                        <div class="swiper-slide">
                            <div class="card card-data">
                                <div class="card-header" onclick= "location.href='/incruit/view/${list.co_seq}' ">
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
                        </div>
                    </c:forEach>

                </div>
                <div class="swiper-button-next"></div>
                <!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                <div class="swiper-button-prev"></div>
                <!-- 이전 버튼 -->
            </div>
        </div>
    </section>
    <section class="login-section">
        <div class="modal">
            <div class="modal_body1">
                <div class="login-area">
                    <div class="login-header">
                        <a href="#" class="modal-login active">로그인</a>
                        <a href="#" class="modal-id-pwd">ID/PWD 찾기</a>
                    </div>
                    <div class="login-status active">
                        <div class="login-body">
                            <div class="logo-area">
                                <img src="img/로그6.png" class="head-logo">
                            </div>
                            <form name="login_form" action="/login" method="POST">
                                <input type="text" id="username" name="username" class="input-text1" placeholder="ID를 입력해주세요." />
                                <input type="password" id="password" name="password" class="input-text1" placeholder="Password를 입력해주세요." />
                            </form>
                            <div class="idpw-area">
                                <a href="#" onclick="loadTerms()">회원가입</a>
                            </div>
                            <input type="button" id="login_submit" class="input-text1" value="로그인하기" />
                            <div class="social-area">
                                <div class="naver-area">
                                    <img class="nv-logo" src="/img/naverlogo.png" />
                                    <span><a class="sec-a" href="/oauth2/authorization/naver">네이버 로그인</a></span>
                                </div>
                                <div class="kakao-area">
                                    <img class="nv-logo" src="/img/kakaoLogo.PNG" />
                                    <span><a class="sec-a1" href="/oauth2/authorization/kakao">카카오 로그인</a></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="id-pwd-status">
                        <div class="login-body find-idpwd">
                            <div class="find-id-head">
                                <span class="idpwd-text">아이디찾기</span>
                            </div>
                            <div class="find-id">
                                <div class="find-id-form">
                                    <input type="text" class="input-box" id="find_email-text" placeholder="E-MAIL" />
                                    <input type="text" class="input-box readonly-verify" id="verifi_id" readonly placeholder="verification code">
                                </div>
                                <div class="send-button">
                                    <input type="button" class="send-input-button" id="find-id-button" value="CHECK">
                                </div>
                            </div>

                            <div class="row-bar">

                            </div>

                            <div class="find-id-head">
                                <span class="idpwd-text">비밀번호 찾기</span>
                            </div>
                            <div class="find-id">
                                <div class="find-id-form">
                                    <input type="text" class="input-box" id="user_name_input" placeholder="NAME" />
                                    <input type="text" class="input-box" id="user_email_input" placeholder="E-MAIL" />
                                </div>
                                <div class="send-button">
                                    <input type="button" class="send-input-button1" id="find_pass_button" value="CHECK">
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
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
<script src="/js/script.js"></script>
<script>
    function removeStorage(){
        localStorage.removeItem("co_seq");
    }
</script>
</html>