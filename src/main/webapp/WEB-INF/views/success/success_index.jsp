<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css"/>
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
    rel="stylesheet" />
    <link rel="stylesheet" href="/css/styles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
    <!--합격 자기소개서 페이지-->
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
<script>
    var page=1;
    boardDisplay(page);

    function boardDisplay(pageNum){
        page=pageNum;
        $.ajax({
            type:"GET",
            url:"/pass/listGet?pageNum="+pageNum,
            dataType:"json",
            success:function(json){
                tableDisplay(json.board);
                pageDisplay(json.pager);
            }
        })
    }

    function tableDisplay(board){
        var html="";
        html+="<div class='contentDiv' style='display: none;'>";
        html+="</div>";
        $.each(board, function(i){
            html+="<div class='card card-data'>";
            html+="<div class='card-header' data-num='"+board[i].pass_seq+"' onclick='showDetail(this)'"+">";
            html+="<h3>"+board[i].pass_title+"</h3>";
            html+="</div>";
            html+="<div class='card-body'>";
            html+=board[i].pass_company+"<br/>";
            html+=board[i].pass_career+"<br/>";
            html+="<h3>"+board[i].pass_job+"</h3>";
            html+="</div>";
            html+="</div>";
        });
        html+="<div id='pageNumDiv'>";
        html+="</div>";
        $(".incruit-area").html(html);
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
    function showDetail(obj){
        let num=$(obj).attr("data-num");
        $.ajax({
            url:"/pass/content",
            type:"GET",
            data:{num: num},
            dataType:"json",
            success: function(json){
                console.log("###: "+json.content.pass_seq);
                if($(".contentDiv").css("display")=="none"){
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
            }
        })
    }
    function backButton(){
        $(".contentDiv").hide();
    }
</script>
</html>