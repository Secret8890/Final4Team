document.querySelector('#nav-incruit').addEventListener('click',()=>{
    $("#load-section").load('/incruit');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
});
document.querySelector('#nav-pass').addEventListener('click',()=>{
    $("#load-section").load('/pass/list');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
});
document.querySelector('#nav-ai').addEventListener('click',()=>{
    $("#load-section").load('/user/aibot');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
})
document.querySelector('#nav-review').addEventListener('click',()=>{
    location.href='/review/list';
})
document.querySelector('.logo_img').addEventListener('click',()=>{
    location.href='/';
})
$(document).ready(function(){
    $("#nav-self").on('click',()=>{
        $('#load-section').load('/resume/index');
        document.getElementById("main-section").style.display = "none";
        document.getElementById("load-section").style.display = "block";
    });
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