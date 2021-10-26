<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
    <title>Index</title>
    <link rel="stylesheet" href="/css/chat.css"/>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <!-- 폰트어썸 아이콘사용 스크립트 -->
    <script src="https://kit.fontawesome.com/e3bdd8104f.js" crossorigin="anonymous"></script>
</head>
<body style="text-align: center">
    <h1>${company.co_title} 채팅방 | ${company.co_name} </h1>
    <!-- <h1>${company.co_name}</h1> -->
<div class="chat_container">
    <div class="chat_title">
        <img src="/img/chaticon.png" />
        <h2>${company.co_name}</h2>
    </div>  
    <c:set var="roomName" value="${room.name}"/>
    <c:set var="roomId" value="${room.roomId}"/>
    <sec:authentication property="principal.member.u_name" var="user_id"/>
    <c:set var="userName" value="${user_id}"/>
    <input type="hidden" id="roomId2" value="${room.roomId}"/>
    <br/>
    <div id="msgArea" class="msgArea"></div>
    <div class="msg_send">
        <input type="text" id="msg">
        <button type="button" id="button-send"><i class="fas fa-arrow-up"></i></button>
    </div>
</div>
</body>
<script type="text/javascript" language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
    let first=new Array('정직한','재미있는','자신감 있는','느긋한','로맨틱한','끈질긴','카리스마있는','근면한','유능한','합리적인','수다스러운','수줍어하는','너그러운','시원찮은','엄청난','희망찬','대견한');
    let second=new Array('고양이','강아지','사자','호랑이','표범','하이에나','하마','코끼리','올빼미','독수리','고릴라','오랑우탄','칠면조','직박구리','청설모','메추라기','스라소니','고슴도치','두루미','맹꽁이','이구아나','바다표범','구렁이','바다코끼리','알파카');
    function createNickname(a,b){
        return a[Math.floor(Math.random()*a.length)]+' '+b[Math.floor(Math.random()*b.length)];
    }
    $(document).ready(function(){
        let roomName='<c:out value="${roomName}"/>';
        let roomId='<c:out value="${roomName}"/>';
        let username='<c:out value="${userName}"/>';
        let nickname=createNickname(first,second);

        let sockJs=new SockJS("/ws");
        let stomp=Stomp.over(sockJs);
        
        stomp.connect({}, function(){
            console.log("STOMP Connection");

            stomp.subscribe("/topic/chat/room/"+roomId, function(chat){
                let content=JSON.parse(chat.body);
                let writer=content.writer;
                let nick=content.nick;
                let message=content.message;
                console.log("#message: "+message);

                let str='';
                if(writer===username){
                    str="<div class=msgdivTop>";
                    //str+="<div class=msgdivName>"+writer+"</div>"
                    str+="<div class=msgdiv>";
                    str+="<b>"+message+"</b>";
                    str+="</div>";
                    str+="</div>";
                    console.log("같은 경우");
                    $("#msgArea").append(str);

                }else{
                    str="<div class=msgdivTop>";
                    //str+="<div class=msgdivName1>"+writer+"</div>"
                    str+="<div class=msgdiv1>";
                    str+="<b>"+nick+" : "+message+"</b>";
                    str+="</div>";
                    str+="</div>";
                    console.log("다른 경우");
                    $("#msgArea").append(str);
                }
            });
            stomp.send('/app/chat/enter',{},JSON.stringify({roomId:roomId, writer:username, nick:nickname}))
        });

        $("#button-send").on("click", function(e){
            let msg=document.getElementById("msg");
            stomp.send('/app/chat/message',{},JSON.stringify({roomId:roomId, writer:username, nick:nickname, message:msg.value}))
            msg.value='';
        });
    });
</script>
</html>