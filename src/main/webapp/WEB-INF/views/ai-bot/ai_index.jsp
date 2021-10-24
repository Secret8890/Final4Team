<%@ page contentType="text/html; charset=utf-8" %>
    <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link href="/css/main.css" rel="stylesheet" />
    <title>Document</title>
    <!-- 폰트어썸 아이콘사용 스크립트 -->
    <script src="https://kit.fontawesome.com/e3bdd8104f.js" crossorigin="anonymous"></script>
</head>  
  <body>
      <!-- <div class="startArea">
          <input type="button" id="startid" class="startbutton" value="챗봇 시작하기 !" />
      </div> -->
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
      <canvas id="canvas" width="960" height="720"></canvas>
      <script>
      if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
        navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
          var video = document.getElementById('video');
          video.srcObject = stream;
          video.play();
        });
      }

      var canvas = document.getElementById('canvas');
      var context = canvas.getContext('2d');
      var video = document.getElementById('video');
      document.getElementById("webcamBtn").addEventListener("click",function() {
        context.drawImage(video,0,0,2000,2000);
      });
      </script>
  </body>
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