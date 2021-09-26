<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script type="text/javascript" language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        setYear();
        selectDegree();
        ex();
        phone();
        setJob();
        $('#aboutSchool').hide();
        $('#aboutMajor').hide();
        $('#aboutJob').hide();
    })
    //출생연도 설정
    function setYear(){
        var now=new Date();
        var start_year=now.getFullYear()-15;
        var end_year=now.getFullYear()-50;
        for(var i=start_year; i>=end_year; i--){
            $('#select_year').append("<option value='"+i+"'>"+i+""+"</option>");
        }
    }
    //최종학교 고등학교시 학교명을 입력하게끔+전공 선택창 숨기기
    function selectDegree(){
        $("input:radio[name=u_degree]").click(function(){
            if($("input:radio[name=u_degree]:checked").val()=='high'){
                $("#major").hide();
                $("#searchSchool").hide();
                $("#u_lastschool").attr('placeholder','학교명을 입력해주세요.');
                document.getElementById('u_lastschool').readOnly=false;
            }else if($("input:radio[name=u_degree]:checked").val()=='master1'||$("input:radio[name=u_degree]:checked").val()=='master2'){
                $("#major").show();
                $("#searchSchool").hide();
                $("#u_lastschool").attr('placeholder','학교명을 입력해주세요.');
                document.getElementById('u_lastschool').readOnly=false;
                $("#u_major").attr('placeholder','전공명을 입력해주세요.');
                document.getElementById('u_major').readOnly=false;
                $("#searchMajor").hide();
            }else{
                $("#major").show();
                $("#searchSchool").show();
                $("#u_lastschool").attr('placeholder','학교명을 검색하세요');
                document.getElementById('u_lastschool').readOnly=true;
            }
        })
    }
    //핸드폰번호 자동 bash
    $(document).on("keyup", ".u_phone", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
    //핸드폰번호 글자 제한(총 13글자)
    function phone(){
        $("#u_phone").keyup(function(e){
            let content=$(this).val();
            if(content.length>13){
                $(this).val(content.substring(0,13));
            }
        })
    }
    function ex(){
        $("#searchSchool").on("click", function(){
            $('#aboutSchool').show();
            $('#aboutMajor').hide();
            $('#aboutJob').hide();
        });
        $("#searchMajor").on("click", function(){
            $('#aboutSchool').hide();
            $('#aboutMajor').show();
            $('#aboutJob').hide();
        });
        $("#searchJob").on("click",function(){
            $('#aboutSchool').hide();
            $('#aboutMajor').hide();
            $('#aboutJob').show();
        })
    }
    function job(){
        console.log("희망직종 목록 불러오기");
    }
    function selectSchool(){
        let school=document.getElementById('school').value;
        $.ajax({
            type:"GET",
            url:"login/search/school",
            data:{school:school},
            success:function(data){
                var html="";
                var result=data;
                $("#resultSchool").empty();
                $.each(result,function(i){
                    var school_result=result[i].univ_name;
                    html+="<div id='clickSchoolName' value="+school_result+" onclick='clickSchool(this)'>";
                    html+=school_result;
                    html+="</div>";
                })
                $("#resultSchool").append(html);
            }
        });
    }
    function clickSchool(obj){
        var school_click=$(obj).attr('value');
        $('#u_lastschool').val(school_click);
        $('#school').val("");
        $("#resultSchool").empty();
        $('#aboutSchool').hide();
    }
    function selectMajor(){
        let major=document.getElementById('major_name').value;
        $.ajax({
            type:"GET",
            url:"login/search/major",
            data:{major:major},
            success:function(data){
                var html="";
                var result=data;
                $("#resultMajor").empty();
                $.each(result,function(i){
                    var major_result=result[i].major_name;
                    html+="<div id='clickMajorName' value="+major_result+" onclick='clickMajor(this)'>";
                    html+=major_result;
                    html+="</div>";
                })
                $("#resultMajor").append(html);
            }
        })
    }
    function clickMajor(obj){
        var major_click=$(obj).attr('value');
        $('#u_major').val(major_click);
        $('#major_name').val("");
        $("#resultMajor").empty();
        $('#aboutMajor').hide();
    }
    function setJob(){
        let arr=['기획·전략','마케팅·홍보·조사','회계·세무·재무','인사·노무·HRD','총무·법무·사무','IT개발·데이터','디자인','영업·판매·무역','고객상담·TM','구매·자재·물류','상품기획·MD','운전·운송·배송','서비스','생산','건설·건축','의료','연구·R&D','교육','미디어·문화·스포츠','금융·보험','공공·복지'];
        for(let i=0; i<arr.length; i++){
            $('#aboutJob').append("<div id='job' value="+arr[i]+" onclick='clickJob(this)'>"+arr[i]+"</div>");
        }
    }
    function clickJob(obj){
        var job_click=$(obj).attr('value');
        $('#u_job').val(job_click);
        $('#aboutJob').hide();
    }
</script>
</head>
<body>
	<h1>추가정보입력 페이지</h1>
	<hr/>
	<form action="/login/additional" method="POST">
        출생연도<select id="select_year" name="u_birth"></select> <br/>
        핸드폰번호<input type="text" class="u_phone" id="u_phone" name="u_phone" placeholder="핸드폰번호"/> <br/>
        희망직종(관심직무)<input type="text" id="u_job" name="u_job" readonly/><button type="button" id="searchJob">선택하기</button> <br/>
        최종 학력<input type="radio" name="u_degree" value="high"/>고등학교 <input type="radio" name="u_degree" value="univ" checked/>대학교 <input type="radio" name="u_degree" value="master1"/>대학원(석사) <input type="radio" name="u_degree" value="master2"/>대학원(박사)  <br/>
        학교 <input type="text" id="u_lastschool" name="u_lastschool" placeholder="학교명을 검색하세요" readonly/><button type="button" id="searchSchool">검색</button> <br>
        <div id="major">
            전공<input type="text" id="u_major" name="u_major" placeholder="전공명을 검색하세요" readonly/> <button type="button" id="searchMajor">검색</button> <br/>
        </div>
            신입/경력<input type="radio" name="u_career" value="new"/>신입 <input type="radio" name="u_career" value="experienced"/>경력 <br/>
		<button>추가정보입력</button>
	</form>

    <div id="aboutSchool">
        <input type="text" id="school" placeholder="학교명을 검색하세요"/> <button type="button" onclick="selectSchool()">검색</button>
        <div id="resultSchool"></div>
    </div>
    <div id="aboutMajor">
        <input type="text" id="major_name" placeholder="학과명을 검색하세요"/> <button type="button" onclick="selectMajor()">검색</button>
        <div id="resultMajor"></div>
    </div>
    <div id="aboutJob">
    </div>

</body>
</html>