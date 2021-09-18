<%@ page contentType="text/html; charset=utf-8" %>
    <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <link rel="stylesheet" href="/css/chat_style.css" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
            <link href="/css/main.css" rel="stylesheet" />
            <title>Document</title>
        </head>

        <body>
            <div class="container-fluid">
                <!-- <div class="startArea">
                    <input type="button" id="startid" class="startbutton" value="챗봇 시작하기 !" />
                </div> -->
                <div class="chatArea" id="chatArea">
                    <ol id="recordingsList"></ol>
                    <noscript><h2 style="color: #ff0000">
            Seems your browser doesn't support Javascript! Websocket relies on
            Javascript being enabled. Please enable Javascript and reload this
            page!
          </h2></noscript
        >
        <div id="main-content" class="container">
          <div class="row">
            <div class="col-md-6">
              <form class="form-inline">
                <div class="form-group">
                  <label for="connect">웹소켓 연결:</label>
                  <button id="connect" class="btn btn-default" type="submit">
                    연결
                  </button>
                  <button
                    id="disconnect"
                    class="btn btn-default"
                    type="submit"
                    disabled="disabled"
                  >
                    해제
                  </button>
                </div>
              </form>
            </div>
            <div class="col-md-6">
              <form class="form-inline">
                <div class="form-group">
                  <label for="msg">문의사항</label>
                  <input
                    type="text"
                    id="msg"
                    class="form-control"
                    placeholder="내용을 입력하세요...."
                  />
                </div>
                <button
                  id="send"
                  class="btn btn-default"
                  disabled
                  type="submit"
                >
                  보내기
                </button>
              </form>
              <br />
              <div id="controls">
                <button id="recordButton">Record</button>
                <button id="pauseButton" disabled>Pause</button>
                <button id="stopButton" disabled>Stop</button>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <table id="conversation" class="table table-striped">
                <thead>
                  <tr>
                    <th>메세지</th>
                  </tr>
                </thead>
                <tbody id="communicate"></tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
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