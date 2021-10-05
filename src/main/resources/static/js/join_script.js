$(document).ready(function(){
    setBirth();
    selectDegree();
    ex();
    phone();
    setJob();
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
//$(document).on("keyup", ".u_phone", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
//핸드폰번호 글자 제한(총 13글자)
function phone(){
    $("#u_phone").keyup(function(e){
        let content=$(this).val();
        $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
        if(content.length>13){
            $(this).val(content.substring(0,13));
        }
    })
}
function ex(){
    $("#searchSchool").on("click", function(){
        openPopup();
    });
    $("#searchMajor").on("click", function(){
        openMajor();
    });
    $("#searchJob").on("click",function(){
        openJob();
    })
}
function fn_checkID(){
    if( (4<=$('#u_id').val().length) && $('#u_id').val().length <= 16 ){
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
    } else {
        alert('아이디의 길이는 4~16자여야 합니다.');
    }
    
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

function setSchool(school) {
    $('#u_lastschool').val(school);
}
function setMajor(major) {
    $('#u_major').val(major);
}
function setJob(job) {
    $('#u_job').val(job);
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
            u_gender : $('input:radio[name=u_gender]').val(),
            u_phone : $('#u_phone').val(),
            u_job : $('#u_job').val(),
            u_degree : $('input:radio[name=u_degree]').val(),
            u_lastschool : $('#u_lastschool').val(),
            u_major : $('#u_major').val(),
            u_career : $('input:radio[name=u_career]').val()
        },
        success : function() {
            alert('가입성공');
            location.replace("/");
        }
    })
}
let win;
function openPopup(){
    win = null;
    win = window.open('login/school_search', 'school_popup','left=100px, top=100px, width=400px, height=300px');
}
function openMajor() {
    win = null;
    win = window.open('login/major_search', 'major_popup','left=100px, top=100px, width=400px, height=300px' );
}
function openJob(){
    win = null;
    win = window.open('login/job_search', 'job_popup', 'left=100px, top=100px, width=400px, height=300px');
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