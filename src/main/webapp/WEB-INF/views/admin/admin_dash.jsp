<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/admin_dash.css" rel="stylesheet" />
    
    <!-- 폰트어썸 아이콘사용 스크립트 -->
    <script src="https://kit.fontawesome.com/e3bdd8104f.js" crossorigin="anonymous"></script>
    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <title>Document</title>
</head>
<body id="body-pd">
    <div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                    <img class="nav__toggle" id="nav-toggle" src="/img/로그5.png" />
                    <!-- <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon> -->
                    <a href="#" class="nav__logo">그것이 알고JOB다</a>
                </div>
                <div class="nav__list">
                    <a href="#" class="nav__link active">
                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">공지사항 관리</span>
                    </a>
                    <a href="/admin/usermanagement" class="nav__link">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">사용자 관리</span>
                    </a>
                    <a href="/admin/statistics" class="nav__link">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">통계 관리</span>
                    </a>
                    <a href="/admin/passboard/list" class="nav__link">
                        <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">자기소개서 관리</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>

    <h1>통계 확인</h1>
    <div class="totalMember_con">
        <div class="totalM_con">
            <div class="totalM" id="totalMember"></div>
            <h3>회원 수</h3>
        </div>
        <div class="totalM_con1">
            <h3>회원이 작성한 이력서 수<div id="totalResume"></div></h3>
            <h3>회원이 작성한 자소서 수<div id="totalSelf"></div></h3>
            <h3>오늘 올라온 공고 수<div id="totalIncruit"></div></h3>
            <h3>aiChatbot 사용량<div id="totalaichatbot"></div></h3>
        </div>
    </div>
    <button class="rebnt" type="button" onclick="getDB()"><i class="fas fa-redo"></i></button>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
     
        <canvas class="canvas" id="bar-chart" width="300px" height="230px"></canvas>
        <!--일별 가입자 통계 그래프-->
        <canvas id="line-chart" width="300px" height="250px"></canvas>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script type="text/javascript" language="javascript"
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">

    function getDB(){
        $.ajax({
            url : "/admin/list/save",
            type : "get",
            success : (data) =>{
                if(data) {
                    alert ('새 공고를 받아오는데 성공했습니다 !');
                    location.reload();
                } else {
                    alert ('공고받기 실패 ㅠ');
                    location.reload();
                }
            }

        })
    }

    var chartLabels=[];
    var chartData=[];
    var aiData=[];

    function setWeek() {
        var d = new Date();
        var dayOfMonth = d.getDate();
        for(var i=6; i>-1; i--){
            d.setDate(dayOfMonth - i);

            var year = d.getFullYear();
            var month = (d.getMonth() + 1);
            var day = d.getDate();
            
            month = (month < 10) ? "0" + String(month) : month;
            day = (day < 10) ? "0" + String(day) : day;

            console.log(year+'-'+month+'-'+day);
            chartLabels.push(year+'-'+month+'-'+day);
            aiData.push(year+'-'+month+'-'+day);
        }
    }
    function setUser(){
        chartData.push(0,0,0,0,0,0,0);
    }
    function setAiUser(){
        aiData.push(0,0,0,0,0,0,0);
    }
    function createChart(){
        var ctx=document.getElementById("line-chart");
        LineChartDemo=Chart.Line(ctx, {
            data:lineChartData,
            options:{
                title: {
                    display: true,
                    text: '일주일 동안의 가입자 통계'
                }
            }
        });
    }
    function createAiChart(){
        var ctx=document.getElementById("bar-chart");
        BarChartDemo=Chart.Bar(ctx, {
            data:BarChartData,
            options:{
                title: {
                    display: true,
                    text: '챗봇 사용량'
                }
            }
        });
    }
    $(document).ready(function(){
        setWeek();
        setUser();
        setAiUser();
        $.ajax({
            url:"/admin/getChartInfo",
            type:"get",
            dataType:"json",
            async:false,
            success:function(json){
                totalMember(json.totalMember);
                totalResume(json.totalResume);
                totalSelf(json.totalSelf);
                totalIncruit(json.totalIncruit);
                drawUserChart(json.list);
                totalaichatbot(json.ailist);
            }
        });
    });
    function drawUserChart(list){
        $.each(list,function(i){
            if(chartLabels.includes(list[i].u_memberSince)){
                var j=chartLabels.indexOf(list[i].u_memberSince);
                chartData[j]=list[i].countMember;
            }
        });
        lineChartData = {
            labels : chartLabels,
            datasets : [ {
                label : "가입자",
                borderColor: "#3cba9f",
                fill: false,
                data : chartData
            } ]
        };
        createChart();
    }
    function totalMember(totalMember){
        document.getElementById('totalMember').innerHTML=totalMember;
    }
    function totalResume(totalResume){
        document.getElementById('totalResume').innerHTML=totalResume;
    }
    function totalSelf(totalSelf){
        document.getElementById('totalSelf').innerHTML=totalSelf;
    }
    function totalIncruit(totalIncruit){
        document.getElementById('totalIncruit').innerHTML=totalIncruit;
    }
    function totalaichatbot(ailist){
        const dailyCount = ailist.map(function(e){
            var kobj={};
            kobj=e.aiCount;
            return kobj;
        });
        const ddd = ailist.map(item=>item.aiCount).reduce((prev,curr)=>prev+curr,0);
        document.getElementById('totalaichatbot').innerHTML=ddd;

        $.each(ailist,function(i){
            if(aiData.includes(ailist[i].chat_date)){
                var j=aiData.indexOf(ailist[i].chat_date);
                aiData[j]=ailist[i].aiCount;
            }
        });
        BarChartData = {
            labels : ["6일전", "5일전", "4일전", "3일전", "2일전","1일전","오늘"],
            datasets : [ {
                label : "가입자",
                borderColor: "#3cba9f",
                fill: true,
                data : aiData
            } ]
        };
        createAiChart();
    }
</script>
</html>