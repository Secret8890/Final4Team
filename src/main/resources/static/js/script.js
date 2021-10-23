

new Swiper('.swiper-container', {
    slidesPerView: Math.round(document.querySelector('.swiper-wrapper').clientWidth / 400), // 동시에 보여줄 슬라이드 갯수
    spaceBetween: 20, // 슬라이드간 간격
    slidesPerGroup: Math.round(document.querySelector('.swiper-wrapper').clientWidth / 400), // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
    loop:true,
    // 그룹수가 맞지 않을 경우 빈칸으로 메우기
    // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
    //loopFillGroupWithBlank: true,
    
    pagination: { // 페이징
        el: '.swiper-pagination',
        clickable: true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
    },
    navigation: { // 네비게이션
        nextEl: '.swiper-button-next', // 다음 버튼 클래스명
        prevEl: '.swiper-button-prev', // 이번 버튼 클래스명
    },
});
const loginModal = document.querySelector('.modal');
const btnOpenPopup = document.querySelector('.btn-open-popup');
if(btnOpenPopup !== null) {
    btnOpenPopup.addEventListener('click',()=>{
        loginModal.style.display = 'block';
    });
}

window.onclick = (event)=>{
    if(event.target == loginModal) {
        loginModal.style.display = 'none';
    }
}
$(document).ready(function(){
    $("#nav-self").on('click',()=>{
        $('#load-section').load('resume/index');
        document.getElementById("main-section").style.display = "none";
        document.getElementById("load-section").style.display = "block";
    });
    $(".logo-img").on('click',()=>{
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
    $("#load-section").load('user/setting');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
}
function loadTerms(){ 
    $('#load-section').load('terms');
    loginModal.style.display = "none";
    document.getElementById("load-section").style.display = "block";
    document.getElementById("main-section").style.display = "none";
}
function loginLoad() {
    document.getElementById("load-section").style.display = "none";
    document.getElementById("main-section").style.display = "block";
}

const mdLogin = document.querySelector('.modal-login');
const mdIdPwd = document.querySelector('.modal-id-pwd');
const loginStat = document.querySelector('.login-status');
const idpwdStat = document.querySelector('.id-pwd-status');
mdLogin.addEventListener('click',()=>{
    mdLogin.classList.add('active');
    loginStat.classList.add('active');
    mdIdPwd.classList.remove('active');
    idpwdStat.classList.remove('active');

});

mdIdPwd.addEventListener('click',()=>{
    mdLogin.classList.remove('active');
    loginStat.classList.remove('active');
    mdIdPwd.classList.add('active');
    idpwdStat.classList.add('active');

});

document.querySelector('#nav-incruit').addEventListener('click',()=>{
    $("#load-section").load('incruit');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
});
document.querySelector('#nav-pass').addEventListener('click',()=>{
    $("#load-section").load('pass/list');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
});
document.querySelector('#nav-ai').addEventListener('click',()=>{
    $("#load-section").load('user/aibot');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
})
document.querySelector('#nav-review').addEventListener('click',()=>{
    $("#load-section").load('review/list.do');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
})
document.querySelector('#find-id-button').addEventListener('click',()=>{
    $.ajax({
        url : '/findId',
        type : 'POST',
        data : {u_email:$('#find_email-text').val()},
        success : (data)=>{
            $('#verifi_id').val(data);
        }
    });
});
document.querySelector('#find_pass_button').addEventListener('click',()=>{
    $.ajax({
        url : '/findPwd',
        type : 'POST',
        data : {u_name:$('#user_name_input').val(),u_email:$('#user_email_input').val()},
        success: function(res){
            if(res['check']){
                if(confirm("입력하신 이메일로 임시 비밀번호를 전송하겠습니다.")){
                    $.ajax({
                        type:"POST",
                        url:"/findPwd/sendEmail",
                        data:{
                            "u_name":$('#user_name_input').val(),
                            "u_email":$('#user_email_input').val()
                        }
                    })
                    setTimeout(() => {
                        window.location.href="/";
                         }, 2000);
                }
            }else if(res['naver']){
                alert("네이버 가입자입니다. 네이버를 통해 비밀번호를 찾아주세요.");
            }else if(res['kakao']){
                alert("카카오 가입자입니다. 카카오를 통해 비밀번호를 찾아주세요.");
            }else{
                alert("일치하는 정보가 없습니다.");
            }
        },error: function(res){
            alert("실패");
        }
    })
})