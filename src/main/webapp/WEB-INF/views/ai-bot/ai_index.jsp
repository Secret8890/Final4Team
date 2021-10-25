<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link href="/css/main.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/styles.css" />
    <!-- JQuery 2.2.4버전 사용 스크립트-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Document</title>
    <!-- 폰트어썸 아이콘사용 스크립트 -->
    <script src="https://kit.fontawesome.com/e3bdd8104f.js" crossorigin="anonymous"></script>
</head>  
  <body>
      <!-- <div class="startArea">
          <input type="button" id="startid" class="startbutton" value="챗봇 시작하기 !" />
      </div> -->
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
    
    <div class="chatArea" id="chatArea">
      <ol id="recordingsList"></ol>
      <h1>AI 가상 면접</h1>
      <sec:authorize access="isAuthenticated()">
          <sec:authentication property="principal.member.u_seq" var="user_seq_sec"/>
          <input type="hidden" id="user_seq" value="${user_seq_sec}"/>
      </sec:authorize>
      <div id="main-content" class="container">
        <div class="content-container">
          <div class="row">
            <div class="col-md-6">
              <form id="form-inline" class="form-inline">
                <img src="/img/ai.png" /><h3>AI 면접관<br />COSMO-AI</h3>
                <div id="form-group" class="form-group">
                  <label for="connect">면접을 시작하시겠습니까?:</label>
                  <button id="connect" class="btn btn-default" type="submit">
                    예
                  </button>
                  <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">
                    아니오
                  </button>
                </div>
                <div id="controls" class="controls">
                  <button id="recordButton"><i class="fas fa-microphone"></i></button>
                  <button id="pauseButton" disabled><i class="fas fa-pause"></i></button>
                  <button id="stopButton" disabled><i class="far fa-stop-circle"></i></button>
                  |  
                  <button id="webcamBtn" type="button"><i class="fas fa-camera"></i></button>
                </div>
                <video id="video" width="300" height="180" autoplay></video>
              </form>
            </div>
          </div>
          <div class="row1">
            <div class="col-md-12">
              <div id="tablec" class="table-container">
                <table id="conversation" class="table table-striped">
                  <thead>
                    <tr>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody id="communicate" class="communicate"></tbody>
                </table>
              </div>
              <form id="form-inline1" class="form-inline1">
              <div class="buttonarea">
                <textarea type="text" id="msg" placeholder="내용을 입력하세요."></textarea>
                <button class="areabutton" id="send" disabled type="submit">보내기</button>
              </div>
              </form>
          </div>
        </div>
      </div>
    </div>
    </section>
      <%-- <canvas id="canvas" width="960" height="720"></canvas> --%>
      <script>
      if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
        navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
          var video = document.getElementById('video');
          video.srcObject = stream;
          video.play();
        });
      }

      //var canvas = document.getElementById('canvas');
      //var context = canvas.getContext('2d');
      // var video = document.getElementById('video');
      // document.getElementById("webcamBtn").addEventListener("click",function() {
      //   context.drawImage(video,0,0,2000,2000);
      // });
      // 
      // 주석풀고 캔버스만 조절 ?
      </script>

      <div id="load-section">
    </div>
    <footer>
        <div class="footer-area">
            <h5>Copyright 2021.09.03 최씨가문</h5>
        </div>
    </footer>
  </body>

  <script src="/js/main_nav.js">
  </script>
  <!-- 음성녹음 관련 -->
  <script src="https://cdn.rawgit.com/mattdiamond/Recorderjs/08e7abd9/dist/recorder.js"></script>
  <script
    type="text/javascript"
    language="javascript"
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"
  ></script>

  <script
    type="text/javascript"
    language="javascript"
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"
  ></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
  <script src="/js/audio.js"></script>
</html>