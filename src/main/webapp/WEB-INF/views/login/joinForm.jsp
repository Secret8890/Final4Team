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
        setBirth();
        selectDegree();
        ex();
        phone();
    })
    //생년월일 설정
    function setBirth(){
        var now=new Date();
        var start_year=now.getFullYear()-15;
        var end_year=now.getFullYear()-50;
        for(var i=start_year; i>=end_year; i--){
            $('#select_year').append("<option value='"+i+"'>"+i+""+"</option>");
        }
        for(var y=1; y<=12; y++){
            $('#select_month').append("<option value='"+y+"'>"+y+""+"</option>");
        }
        for(var z=1; z<=31; z++){
            $('#select_date').append("<option value='"+z+"'>"+z+""+"</option>");
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
    function fn_checkID(){
        $.ajax({
            url:"join/checkID",
            type:"POST",
            dataTyp:"json",
            data: {u_id:$("#u_id").val()},
            success:function(data){
                if(data==1){
                    $("#checkID").attr("value","N");
                    alert("중복된 아이디입니다.");
                }else if(data==0){
                    $("#checkID").attr("value","Y");
                    alert("사용 가능한 아이디입니다.");
                }
            },error:function(data){
                alert("입력 실패");
            }
        });
    }
    function fn_checkEmail(){
        $.ajax({
            url:"join/checkEmail",
            type:"POST",
            dataType:"json",
            data: {u_email:$("#u_email").val()},
            success:function(data){
                if(data==3){
                    $("#checkEmail").attr("value","N");
                    alert("카카오 로그인으로 가입된 이메일입니다.");
                }else if(data==2){
                    $("#checkEmail").attr("value","N");
                    alert("네이버 로그인으로 가입된 이메일입니다.");
                }else if(data==1){
                    $("#checkEmail").attr("value","N");
                    alert("이미 가입된 이메일입니다.");
                }else if(data==0){
                    $("#checkEmail").attr("value","Y");
                    alert("사용 가능한 이메일입니다.");
                }else if(data==-1){
                    alert("?");
                }
            },error:function(data){
                alert("입력 실패");
            }
        });
    }
</script>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<hr/>
	<!--동일한 부분: 핸드폰번호, 희망직종, 최종학력, 학교, 전공, 신입/경력 -->
	<form action="/login/join" method="POST">
		아이디 <input type="text" id="u_id" name="u_id" /> <button type="button" id="checkID" onclick="fn_checkID();" value="N">ID 중복확인</button> <br/>
		비밀번호 <input type="password" name="u_password" /> <br/>
        이름 <input type="text" name="u_name"/> <br/>
        이메일 <input type="email" id="u_email" name="u_email" /> <button type="button" id="checkEmail" onclick="fn_checkEmail();" value="N">이메일 중복확인</button> <br/>
        생년월일 <select id="select_year" name="u_birthyear"></select>년 <select id="select_month" name="u_birthmonth"></select> 월 <select id="select_date" name="u_birthdate"></select>일 <br/>
        성별<input type="radio" name="u_gender" value="M"/>남성 <input type="radio" name="u_gender" value="F"/>여성 <br/>
        핸드폰번호<input type="text" class="u_phone" id="u_phone" name="u_phone" placeholder="핸드폰번호"/> <br/>
        희망직종(관심직무)<input type="text" name="u_job" readonly/><button type="button" onclick="job()">선택하기</button> <br/>
        최종 학력<input type="radio" name="u_degree" value="high"/>고등학교 <input type="radio" name="u_degree" value="univ" checked/>대학교 <input type="radio" name="u_degree" value="master1"/>대학원(석사) <input type="radio" name="u_degree" value="master2"/>대학원(박사)  <br/>
        학교 <input type="text" id="u_lastschool" name="u_lastschool" placeholder="학교명을 검색하세요"/><button type="button" id="searchSchool">검색</button> <br>
        <div id="major">
            전공<input type="text" name="u_major" placeholder="전공명을 검색하세요"/> <button type="button" id="searchMajor">검색</button> <br/>
        </div>
        신입/경력<input type="radio" name="u_career" value="new"/>신입 <input type="radio" name="u_career" value="experienced"/>경력 <br/>
		<button>회원가입</button>
	</form>

</body>
</html>