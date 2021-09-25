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
    })
    //출생연도 설정
    function setYear(){
        var now=new Date();
        var start_year=now.getFullYear()-15;
        var end_year=now.getFullYear()-50;
        //console.log("#start_year: "+start_year+", end year: "+end_year);
        for(var i=start_year; i>=end_year; i--){
            $('#select_year').append("<option value='"+i+"'>"+i+""+"</option>");
        }
    }
    //최종학교 고등학교시 학교명을 입력하게끔+전공 선택창 숨기기
    function selectDegree(){
        $("input:radio[name=u_degree]").click(function(){
            if($("input:radio[name=u_degree]:checked").val()=='high'){
                $("#major").hide();
                $("#search").hide();
                $("#u_school").attr('placeholder','학교명을 입력해주세요.');
                document.getElementById('u_school').readOnly=false;
            }else{
                $("#major").show();
                $("#search").show();
                $("#u_school").attr('placeholder','학교명을 검색하세요');
                document.getElementById('u_school').readOnly=true;
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
            console.log("학교 검색 API");
        });
        $("#searchMajor").on("click", function(){
            console.log("전공 검색 API");
        });
    }
    function job(){
        console.log("희망직종 목록 불러오기");
    }
</script>
</head>
<body>
	<h1>추가정보입력 페이지</h1>
	<hr/>
	<!--완료 된 부분: 출생 연도, 최종학력, 신입/경력, 핸드폰번호-->
    <!--완성 해야 할 부분: 희망직종(사람인 API와 동일하게 해야 함), 학교.전공->공공 API 사용-->
	<form action="/login/additional" method="POST">
        출생연도<select id="select_year" name="u_birth"></select> <br/>
        핸드폰번호<input type="text" class="u_phone" id="u_phone" name="u_phone" placeholder="핸드폰번호"/> <br/>
        희망직종(관심직무)<input type="text" name="u_job" readonly/><button type="button" onclick="job()">선택하기</button> <br/>
        최종 학력<input type="radio" name="u_degree" value="high"/>고등학교 <input type="radio" name="u_degree" value="univ" checked/>대학교 <input type="radio" name="u_degree" value="master1"/>대학원(석사) <input type="radio" name="u_degree" value="master2"/>대학원(박사)  <br/>
        학교 <input type="text" id="u_lastschool" name="u_lastschool" placeholder="학교명을 검색하세요" readonly/><button type="button" id="searchSchool">검색</button> <br>
        <div id="major">
            전공<input type="text" name="u_major" placeholder="전공명을 검색하세요"/> <button type="button" id="searchMajor">검색</button> <br/>
        </div>
        신입/경력<input type="radio" name="u_career" value="new"/>신입 <input type="radio" name="u_career" value="experienced"/>경력 <br/>
		<button>추가정보입력</button>

        <div id="aboutSchool">
            대학이상 영역
        </div>
        <div id="aboutMajor">
            전공 영역
        </div>
        <div id="aboutJob">
            희망직종 영역
        </div>
	</form>

</body>
</html>