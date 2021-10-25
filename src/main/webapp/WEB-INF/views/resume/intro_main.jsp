<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/css/styles.css" />
    <!-- 폰트어썸 아이콘사용 스크립트 -->
    <script src="https://kit.fontawesome.com/e3bdd8104f.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>그것이 알고JOB다</title>
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
<div id="load-section">
    <section class="self-section">
        <div class="self-button">
            <button class="introButton b1">
            <div class="card-button">
                <div class="card-button-header">
                    <span>자기소개서 작성</span>
                </div><hr>
                <div class="card-button-body">
                    <i class="fas fa-edit button-icon"></i>
                </div>
                <div class="card-name">자기소개서 작성 페이지</div>
            </div>
            </button>

            <button class="b1 resume_button">
                <div class="card-button">
                    <div class="card-button-header">
                        <span>이력서 작성</span>
                    </div><hr>
                    <div class="card-button-body">
                        <i class="fas fa-address-card button-icon"></i>
                    </div>
                    <div class="card-name">이력서 작성 페이지</div>
                </div>
            </button>

            <button class="b1 intro_manage">
                    <div class="card-button">
                        <div class="card-button-header">
                            <span>자기소개서/이력서 관리</span>
                        </div><hr>
                        <div class="card-button-body">
                            <i class="fas fa-user-edit button-icon" ></i>
                        </div>
                        <div class="card-name">자기소개서 및 이력서 관리 페이지</div>
                    </div>
            </button>
        </div>
    </section>
</div>
    <footer>
        <div class="footer-area">
            <h5>Copyright 2021.09.03 최씨가문</h5>
        </div>
    </footer>
    <script src='/js/main_nav.js'></script>
</body>
<script>
    document.querySelector('.b1').addEventListener('click', () => {
        $('#load-section').load('/self/insert');
    });
    document.querySelector('.resume_button').addEventListener('click',()=>{
        $('#load-section').load('/resume/write');
    });
    document.querySelector('.intro_manage').addEventListener('click',()=>{
        const url = '/resume/intro_manage';
        $('#load-section').load(url);
    })
</script>
</html>