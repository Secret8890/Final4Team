<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/admin_passboard_list.css" rel="stylesheet" />
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
                    <a href="#" class="nav__link">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">사용자 관리</span>
                    </a>

                    <a href="#" class="nav__link">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">통계 관리</span>
                    </a>

                    <a href="#" class="nav__link">
                        <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">자기소개서 관리</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>

    <h1>각종 통계 확인</h1>
    <h3>회원 수: <div id="totalMember"></div></h3>
    <h3>회원이 작성한 이력서 수: <div id="totalResume"></div></h3>
    <h3>회원이 작성한 자소서 수: <div id="totalSelf"></div></h3>
    <h3>오늘 올라온 공고 수: <div id="totalIncruit"></div></h3>
    <h3>aiChatbot 사용량: <div id="totalaichatbot"></div></h3>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
        <canvas id="bar-chart" width="300" height="230"></canvas>
    <!--일별 가입자 통계 그래프-->
    <canvas id="line-chart" width="300" height="250"></canvas>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script type="text/javascript" language="javascript"
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
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
        $.ajax({
            url:"/admin/getChartInfo",
            type:"get",
            dataType:"json",
            async:false,
            success:function(json){
                // alert(JSON.stringify(json.totalaichatbot))
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
            //console.log(i+"번째: "+json.list[i].u_memberSince+","+json.list[i].countMember);
            if(chartLabels.includes(list[i].u_memberSince)){
                var j=chartLabels.indexOf(list[i].u_memberSince);
                chartData[j]=list[i].countMember;
            }
        });
        lineChartData = {
            labels : chartLabels,
            datasets : [ {
                label : "가입자",
                //backgroundColor:"#bfdaf9",
                borderColor: "#3cba9f",
                //pointBorderColor: "#3cba9f",
                //pointBackgroundColor: "#80b6f4",
                //pointHoverBackgroundColor: "#80b6f4",
                //pointHoverBorderColor: "#80b6f4",
                fill: false,
                //borderWidth: 4,
                data : chartData
            } ]
        };
        createChart();
    }
    function totalMember(totalMember){
        document.getElementById('totalMember').innerHTML=totalMember+"명";
    }
    function totalResume(totalResume){
        document.getElementById('totalResume').innerHTML=totalResume+"개";
    }
    function totalSelf(totalSelf){
        document.getElementById('totalSelf').innerHTML=totalSelf+"개";
    }
    function totalIncruit(totalIncruit){
        document.getElementById('totalIncruit').innerHTML=totalIncruit+"개";
    }
    function totalaichatbot(ailist){
        const dailyCount = ailist.map(function(e){
            var kobj={};
            kobj=e.aiCount;
            return kobj;
        });
        const ddd = ailist.map(item=>item.aiCount).reduce((prev,curr)=>prev+curr,0);
        document.getElementById('totalaichatbot').innerHTML=ddd+"개";
//+","+json.ailist[i].aiCount
        $.each(ailist,function(i){
            console.log("들어와여1");
            console.log("들어와여2");
            console.log(ailist[0].chat_date);
            if(aiData.includes(ailist[i].chat_date)){
                var j=aiData.indexOf(ailist[i].chat_date);
                chartData[j]=ailist[i].aiCount;
            }
        });
        BarChartData = {
            labels : ["6일전", "5일전", "4일전", "3일전", "2일전","1일전","오늘"],
            datasets : [ {
                label : "가입자",
                //backgroundColor:"#bfdaf9",
                borderColor: "#3cba9f",
                //pointBorderColor: "#3cba9f",
                //pointBackgroundColor: "#80b6f4",
                //pointHoverBackgroundColor: "#80b6f4",
                //pointHoverBorderColor: "#80b6f4",
                fill: false,
                //borderWidth: 4,
                data : chartData
            } ]
        };
        createAiChart();
    }
</script>
</html>