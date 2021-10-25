<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Recruit</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='/css/recruit.css'>
     <!-- 폰트어썸 아이콘사용 스크립트 -->
     <script src="https://kit.fontawesome.com/e3bdd8104f.js" crossorigin="anonymous"></script>
     <!-- JQuery 2.2.4버전 사용 스크립트-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
        <form action="/incruit/search" method="get">
            <div class="search_basic">
                <div class="simple_container">
                    <input type="hidden" name="workSelected" id="workSelected"/>
                    <div class="show btn_work" id="work">직종 선택</div>
                    <input type="hidden" name="regionSelected" id="regionSelected"/>
                    <div class="show btn_region" id="region">지역 선택</div>
                </div>  
                <input style="background-color: #007bff; color: #fff;width:50px;" type="submit" value="검색">
                <!--class로 인해 submit 실행이 안됨-->
                <!--<input class="execute_search" type="submit" value="검색"/>-->
                <div style="background-color: #f3f3f3;" class="spread_div"><i class="fas fa-angle-down"></i></div>
            </div>
        </form>
        <form action="/incruit/search" method="get">
            <div class="search_detail">
                <div class="condition_left">
                    <div class="container_left1 show folded btn_work">
                        <input type="hidden" name="workSelected" id="workSelected2"/>
                        <div id="work2">직종 선택</div>
                    </div>
                    <div class="container_left1 show folded btn_region">
                        <input type="hidden" name="regionSelected" id="regionSelected2"/>
                        <div id="region2">지역 선택</div>
                    </div>
                    <div class="container_left folded">
                        <a>경력</a>
                        <label for="a">신입</label>
                        <input type="checkbox" name="career" id="a" value="신입">
                        <label for="b">경력</label>
                        <input type="checkbox" name="career" id="b" value="경력">
                        </div>
                    <!--<div class="container_left folded">
                        <a>학력</a>
                        <label for="a">학력무관</label>
                        <input type="checkbox" name="education" id="a" value="학력무관">
                        <label for="b">고등학교졸업이상</label>
                        <input type="checkbox" name="education" id="b" value="고등학교졸업이상">
                        <label for="c">대학졸업(2,3년)이상</label>
                        <input type="checkbox" name="education" id="c" value="대학졸업(2,3년)이상">
                        <label for="d">	대학교졸업(4년)이상</label>
                        <input type="checkbox" name="education" id="d" value="대학교졸업(4년)이상">
                        <label for="e">석사졸업이상</label>
                        <input type="checkbox" name="education" id="e" value="석사졸업이상">
                        <label for="f">고등학교졸업</label>
                        <input type="checkbox" name="education" id="f" value="고등학교졸업">
                        <label for="g">대학졸업(2,3년)</label>
                        <input type="checkbox" name="education" id="g" value="대학졸업(2,3년)">
                        <label for="h">	대학교졸업(4년)</label>
                        <input type="checkbox" name="education" id="h" value="대학교졸업(4년)">
                        <label for="i">석사졸업</label>
                        <input type="checkbox" name="education" id="i" value="석사졸업">
                        <label for="j">박사졸업</label>
                        <input type="checkbox" name="education" id="j" value="박사졸업">
                    </div>-->
                    <div id="containerleft_c" class="container_left folded"> 
                        <a style="margin-bottom: 55px;">근무 형태</a>
                        <div class="containerleft_che1">
                            <span>
                                <label for="a">정규직</label>
                                <input type="checkbox" name="work_type" id="a" value="정규직">
                            </span>
                            <span>
                                <label for="b">계약직</label>
                                <input type="checkbox" name="work_type" id="b" value="계약직">
                            </span>
                            <span>
                                <label for="c">인턴직</label>
                                <input type="checkbox" name="work_type" id="c" value="인턴직">
                            </span>
                            <span>
                                <label for="d">파견직</label>
                                <input type="checkbox" name="work_type" id="d" value="파견직">
                            </span>
                            <span>
                                <label for="e">아르바이트</label>
                                <input type="checkbox" name="work_type" id="e" value="아르바이트">
                            </span>
                            </div>
                        </div>
                    </div>
                <div class="condition_right" >
                    <div id="containerright" class="container_right folded">
                        <a style="width: 10%; margin-bottom: 115px;">학력</a>
                        <div class="containerleft_che1">
                        <span>
                            <label for="a">학력무관</label>
                            <input type="checkbox" name="education" id="a" value="학력무관">
                        </span>
                        <span>
                            <label for="b">고등학교졸업이상</label>
                            <input type="checkbox" name="education" id="b" value="고등학교졸업이상">
                        </span>
                        <span>
                            <label for="c">대학졸업(2,3년)이상</label>
                            <input type="checkbox" name="education" id="c" value="대학졸업(2,3년)이상">
                        </span>
                        <span>
                            <label for="d">	대학교졸업(4년)이상</label>
                            <input type="checkbox" name="education" id="d" value="대학교졸업(4년)이상">
                        </span>
                        <span>
                            <label for="e">석사졸업이상</label>
                            <input type="checkbox" name="education" id="e" value="석사졸업이상">
                        </span>
                        <span>
                            <label for="f">고등학교졸업</label>
                            <input type="checkbox" name="education" id="f" value="고등학교졸업">
                        </span>
                        <span>
                            <label for="g">대학졸업(2,3년)</label>
                            <input type="checkbox" name="education" id="g" value="대학졸업(2,3년)">
                        </span>
                        <span>
                            <label for="h">	대학교졸업(4년)</label>
                            <input type="checkbox" name="education" id="h" value="대학교졸업(4년)">
                        </span>
                        <span>
                            <label for="i">석사졸업</label>
                            <input type="checkbox" name="education" id="i" value="석사졸업">
                        </span>
                        <span>
                            <label for="j">박사졸업</label>
                            <input type="checkbox" name="education" id="j" value="박사졸업">
                        </span>
                        <span>
                    </div>
                </div>
                    <input class="execute_search1" type="submit" value="검색">
                </div>
                <div class="fold"><i class="fas fa-chevron-up"></i></div>
            </div>
        </form>
        

        <!--<div class="search_head">검색 결과</div>-->
        <div class="recommend">
            <div class="recom_content">
                <!--
                    <c:forEach items="${bbs}" var="list">
                    <div class="card card-data incruit_card">
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
                </c:forEach>
                -->
            </div>
        </div>
        <div class="result hidden">
            <ul class="result_content">
            </ul>
        </div>
        <div class="incruit_modal_out incruit_modal m_worktype" id="incruit_modal_work_frame">
            <!-- Modal content -->
            <div class="modal_content">
                <div class="incruit_modal_header">
                    <h2>직종 선택 <span>| 세부사항</span></h2>
                </div>
                <!--내용 채우기-->
                <div class="incruit_modal_body" id="incruit_modal_work">
                    <!-- <p>모달 내용</p> -->
                </div>
                <div class="incruit_modal_footer">
                    <!-- <h3>직종 제목</h3> -->
                </div>
            </div>
        </div>

        <div class="incruit_modal_out incruit_modal m_region" id="incruit_modal_region_frame">
            <!-- Modal content -->
            <div class="modal_content">
                <div class="incruit_modal_header">
                    <h2>지역 선택 <span>| 세부사항</span></h2>
                </div>
                <div class="incruit_modal_body" id="incruit_modal_region">
                    <!-- <p>모달 내용</p> -->
                </div>
                <div class="incruit_modal_footer">
                    <!-- <h3>지역 선택</h3> -->
                </div>
            </div>
        </div>
        <div class="incruit_modal_out incruit_modal m_major" id="incruit_modal_major_frame">
            <!-- Modal content -->
            <div class="modal_content">
                <div class="modal_header">
                    <h2>전공 선택</h2>
                </div>
                <div class="incruit_modal_body" id="incruit_modal_major">
                    <!-- <p>모달 내용</p> -->
                </div>
                <div class="modal_footer">
                    <h3>전공 선택</h3>
                </div>
            </div>
        </div>
    <script src='/js/recruit.js'></script>    
</body>
<script type="text/javascript" language="javascript"
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script language="javascript">
    var page=1;

    $(function(){
        getList(page);
        page++;
    })

    $(window).scroll(()=>{
        if($(window).scrollTop()>=$(document).height()-$(window).height()){
            getList(page);
            page++;
        }
    })

    function getList(page){
        $.ajax({
            url:"/incruit/getList",
            type:"GET",
            data:{page:page},
            dataType:"json",
            success: function(json){
                tableDisplay(json.board, page);
            }
        })
    }

    function tableDisplay(board, page){
        var html="";
        if(page==1){
            $.each(board, function(i){
                html+="<div class='card card-data incruit_card'>";
                html+="<div class='card-header'  onclick=\"location.href='/incruit/view/"+board[i].co_seq+"';\" >";
                html+="<h3>"+board[i].co_title+"</h3>";
                html+="</div>";
                html+="<div class='card-body'>";
                if(board[i].co_location_name.length<30){
                    html+="<span>"+board[i].co_location_name+"</span><br />";
                }else{
                    html+="<span>"+board[i].co_location_name.substring(0,10)+"...</span><br />";
                }
                
                html+="<span>"+board[i].co_career+"</span><br />";
                html+="<h3>"+board[i].co_name+"</h3>";
                if(board[i].cl_logo!=null){
                    html+=board[i].cl_logo;
                }
                html+="</div>";
                html+="<div class='card-footer bg-white'>마감일 : "+board[i].co_end_date+"</div>";
                html+="</div>";
            })

            $(".recom_content").html(html);
        }else{
            $.each(board, function(i){
                html+="<div class='card card-data incruit_card'>";
                html+="<div class='card-header' onclick=\"location.href='/incruit/view/"+board[i].co_seq+"';\" >";
                html+="<h3>"+board[i].co_title+"</h3>";
                html+="</div>";
                html+="<div class='card-body'>";
                if(board[i].co_location_name.length<30){
                    html+="<span>"+board[i].co_location_name+"</span><br />";
                }else{
                    html+="<span>"+board[i].co_location_name.substring(0,10)+"...</span><br />";
                }
                html+="<span>"+board[i].co_career+"</span><br />";
                html+="<h3>"+board[i].co_name+"</h3>";
                if(board[i].cl_logo!=null){
                    html+=board[i].cl_logo;
                }
                html+="</div>";
                html+="<div class='card-footer bg-white'>마감일 : "+board[i].co_end_date+"</div>";
                html+="</div>";
            })
            $(".recom_content").append(html);
        }
    }
    setWork();
    
    function setWork(){
        let arr=['기획·전략','마케팅·홍보·조사','회계·세무·재무','인사·노무·HRD','총무·법무·사무','IT개발·데이터','디자인','영업·판매·무역','고객상담·TM','구매·자재·물류','상품기획·MD','운전·운송·배송','서비스','생산','건설·건축','의료','연구·R&D','교육','미디어·문화·스포츠','금융·보험','공공·복지'];
        for(let i=0; i<arr.length; i++){
            $('#incruit_modal_work').append("<div id='work' value="+arr[i]+" onclick='clickWork(this)'>"+arr[i]+"</div>");
        }
    }

    function clickWork(obj){
        var work_click=$(obj).attr('value');
        $('#work').text(work_click);
        $('#work2').text(work_click);
        $('#workSelected').val(work_click);
        $('#workSelected2').val(work_click);
        $('#incruit_modal_work_frame').hide();
    }

    setRegion();

    function setRegion(){
        let arr=['서울','경기','부산','대구','충남','충북','경남','경북','광주','대전','인천','강원','울산','세종','전남','전북','제주'];
        for(let i=0; i<arr.length; i++){
            $('#incruit_modal_region').append("<div id='region' value="+arr[i]+" onclick='clickRegion(this)'>"+arr[i]+"</div>");
        }
    }

    function clickRegion(obj){
        var region_click=$(obj).attr('value');
        $("#region").text(region_click);
        $("#region2").text(region_click);
        $('#regionSelected').val(region_click);
        $('#regionSelected2').val(region_click);
        $("#incruit_modal_region_frame").hide();
    }
</script>
</html>