<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>자소설 닷컴</title>
    <!--구글 웹폰트 & 내부 페이징 스크립트-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet" />
    <link rel="stylesheet" href="/css/styles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>

<body>
    <header>
        <nav>
            <div class="header-nav">
                <div class="nav-main">
                    <div class="logo-area">
                        <img src="/img/로그1.png" class="logo-img" />
                    </div>
                    <div class="topInfo-area">
                        <div class="info1"></div>
                        <div class="info2"></div>
                        <div class="info_button">
                            <a href="#" class="btn-open-popup">로그인</a>
                        </div>
                    </div>
                </div>
                <div class="header-nav nav-buttonArea">
                    <a href="#" class="nav-button">채용공고</a>

                    <a href="#" class="nav-button" id="nav-self">자기소개서 및 이력서</a>
                    <a href="#" class="nav-button">AI 가상면접</a>
                    <a href="#" class="nav-button">채팅방</a>
                    <a href="#" class="nav-button">오늘의핫한공고</a>
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
            <p class="swiper-head">대기업 공채 속보 !</p>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <c:forEach items="${bbs}" var="list">
                        <div class="swiper-slide">
                            <div class="card card-data">
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
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-button-next"></div>
                <!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                <div class="swiper-button-prev"></div>
                <!-- 이전 버튼 -->
            </div>
            <div class="card card-data">
                <div class="card-header">
                    <h3>개발자모십니다.</h3>
                </div>
                <div class="card-body">프론트 엔드 개발자 모십니다.</div>
                <div class="card-footer bg-white">마감일 : 2021-09-05</div>
            </div>
            <c:forEach items="${array}" var="list">
                <div class="card card-data">
                    <div class="card-header">
                        <h3>${list.co_title}</h3>
                    </div>
                    <div class="card-body">
                        ${list.co_location_name}<br /> ${list.co_career} <br />
                        <h3>${list.co_name}</h3>
                    </div>
                    <div class="card-footer bg-white">마감일 : ${list.co_end_date}</div>
                </div>
            </c:forEach>
        </div>
    </section>
    <section class="login-section">
        <div class="modal">
            <div class="modal_body">
                <div class="login-area">
                    <div class="login-header">
                        <a href="#" class="modal-login active">로그인</a>
                        <a href="#" class="modal-id-pwd">ID/PWD 찾기</a>
                    </div>
                    <div class="login-status active">
                        <div class="login-body">
                            <div class="logo-area">
                                <img src="img/로그1.png" class="head-logo">
                            </div>
                            <input type="text" class="input-text" placeholder="ID를 입력해주세요." />
                            <input type="password" class="input-text" placeholder="Password를 입력해주세요." />
                            <div class="idpw-area">
                                <a href="#" onclick="loadTerms()">회원가입</a>
                                <a href="#">아이디찾기</a>
                                <a href="#">비밀번호찾기</a>
                            </div>
                            <input type="button" class="input-text" value="로그인하기" />
                            <div class="social-area">
                                <div class="naver-area">
                                    <img class="nv-logo" src="/img/naverlogo.png" />
                                    <span>네이버 로그인</span>
                                </div>
                                <div class="kakao-area">
                                    <img class="nv-logo" src="/img/kakaoLogo.PNG" />
                                    <span>카카오 로그인</span>
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
                                    <input type="text" class="input-box" placeholder="E-MAIL" />
                                    <input type="button" class="verfication-button" value="인증번호 전송">
                                    <input type="text" class="input-box readonly-verify" readonly placeholder="verification code">
                                </div>
                                <div class="send-button">
                                    <input type="button" class="send-input-button" value="CHECK">
                                </div>
                            </div>

                            <div class="row-bar">

                            </div>

                            <div class="find-id-head">
                                <span class="idpwd-text">비밀번호 찾기</span>
                            </div>
                            <div class="find-id">
                                <div class="find-id-form">
                                    <input type="text" class="input-box" placeholder="ID" />
                                    <input type="text" class="input-box" placeholder="E-MAIL" />
                                    <input type="button" class="verfication-button" value="인증번호 전송">
                                    <input type="text" class="input-box readonly-verify" readonly placeholder="verification code">
                                </div>
                                <div class="send-button">
                                    <input type="button" class="send-input-button" value="CHECK">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div id="load-section">
    </div>
    <footer>
        <div class="footer-area">
            <h5>Copyright 2021.09.03 최씨가문</h5>
        </div>
    </footer>
</body>
<script src="/js/script.js"></script>

</html>