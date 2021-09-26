$(document).ready(function(){
    setBirth();
    selectDegree();
    ex();
    phone();
    setJob();
    $('#aboutSchool').hide();
    $('#aboutMajor').hide();
    $('#aboutJob').hide();
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
function fn_checkID(){
    $.ajax({
        url:"login/join/checkID",
        type:"POST",
        dataType:"json",
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
        url:"login/join/checkEmail",
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
        url:"/login/search/major",
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
function joinSubmit(){
    $.ajax({
        url : 'login/join',
        type : 'POST',
        data : {
            u_id:$('#u_id').val(),
            u_password : $('#u_password').val(),
            u_name : $('#u_name').val(),
            u_email : $('#u_email').val(),
            u_birthyear : $('#select_year').val(),
            u_birthmonth : $('#select_month').val(),
            u_birthdate : $('#select_date').val(),
            u_gender : $('#u_gender').val(),
            u_phone : $('#u_phone').val(),
            u_job : $('#u_job').val(),
            u_degree : $('#u_degree').val(),
            u_lastschool : $('#u_lastschool').val(),
            u_major : $('#u_major').val(),
            u_career : $('#u_career').val()
        },
        success : function() {
            alert('가입성공');
            location.replace("/");
        }
    })
}

//이렇게 해야하는거?
// function check(){
//     if(form.u_id.value==""||form.checkID.value=="N"){
//         alert("ID를 입력해주세요");
//         form.u_id.focus();
//         return false;
//     }
//     if(form.u_password.value==""){
//         alert("비밀번호를 입력해주세요");
//         form.u_password.focus();
//         return false;
//     }
//     return true;
// }