const isManager=document.getElementById('isManager').value;

document.querySelector('#nav-incruit').addEventListener('click',()=>{
    if(isManager=="ROLE_BLACKLIST"){
        alert("접근이 제한된 이용자입니다. \n\n제한 사유.\n블랙리스트 제재 자세한 사항은 고객센터로 문의주세요.")
    }else{
        $("#load-section").load('/incruit');
        document.getElementById('load-section').style.display = 'block';
        document.getElementById('main-section').style.display = 'none';
    }
});
document.querySelector('#nav-pass').addEventListener('click',()=>{
    if(isManager=="ROLE_BLACKLIST"){
        alert("접근이 제한된 이용자입니다. \n\n제한 사유.\n블랙리스트 제재 자세한 사항은 고객센터로 문의주세요.")
    }else{
        location.href = '/pass/list';
    }
});
document.querySelector('#nav-ai').addEventListener('click',()=>{
    if(isManager=="ROLE_BLACKLIST"){
        alert("접근이 제한된 이용자입니다. \n\n제한 사유.\n블랙리스트 제재 자세한 사항은 고객센터로 문의주세요.")
    }else{
        $("#load-section").load('/user/aibot');
        document.getElementById('load-section').style.display = 'block';
        document.getElementById('main-section').style.display = 'none';
    }
})
document.querySelector('#nav-review').addEventListener('click',()=>{
    if(isManager=="ROLE_BLACKLIST"){
        alert("접근이 제한된 이용자입니다. \n\n제한 사유.\n블랙리스트 제재 자세한 사항은 고객센터로 문의주세요.")
    }else{
        location.href='/review/list';
    }
})
document.querySelector('.logo_img').addEventListener('click',()=>{
    location.href='/';
})
document.querySelector("#nav-self").addEventListener('click',()=>{
    if(isManager=="ROLE_BLACKLIST"){
        alert("접근이 제한된 이용자입니다. \n\n제한 사유.\n블랙리스트 제재 자세한 사항은 고객센터로 문의주세요.")
    }else{
        location.href='/resume/index';
    }
})
$(document).ready(function(){
    $(".logo_img").on('click',()=>{
        loginLoad();
    });
    $("#login_submit").on('click',()=>{
        document.login_form.submit();
    });
    $("#user_setting").on('click',()=>{
        loadUserSetting();
    })     
});
function loadUserSetting(){
    $("#load-section").load('/user/setting');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
}
function loadTerms(){ 
    $('#load-section').load('/terms');
    loginModal.style.display = "none";
    document.getElementById("load-section").style.display = "block";
    document.getElementById("main-section").style.display = "none";
}
function loginLoad() {
    document.getElementById("load-section").style.display = "none";
    document.getElementById("main-section").style.display = "block";
}