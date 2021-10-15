const open = () => {
    document.querySelector(".pass_modal").classList.remove("hidden");
    
}

const close = () => {
    document.querySelector(".pass_modal").classList.add("hidden");
}

const passModal = document.querySelector('.pass_modal');

window.onclick = (event)=>{
    if(event.target == passModal) {
        passModal.classList.add("hidden");
    }
}

document.querySelector(".pass_button").addEventListener("click", open);
document.querySelector(".closeBtn").addEventListener("click", close);
document.querySelector(".pass_submit").addEventListener("click", checkConfirm);

function checkConfirm() {
    if($('#new_pass').val() === $('#new_pass_confirm').val()){
        $.ajax({
            url : 'login/changePwd',
            type : 'POST',
            data : {u_password:$('#user_pass').val(),u_password_change:$('#new_pass').val()},
            success : (data)=>{
                if(data == 1){
                    alert('변경 성공!');
                    passModal.classList.add("hidden");

                } else {
                    alert('비밀번호가 일치하지 않습니다.');
                    
                }
                
            }
        })
    } else {
        alert ('새 비밀번호가 동일하지 않습니다.');
    }
}
document.querySelector('.change_button').addEventListener('click',updateUserInfo);
document.querySelector('.company_button').addEventListener('click',goCompanyPage);

function updateUserInfo(){
    const input_password = document.querySelector('.pass_form');
    const u_email = document.querySelector('#u_email');
    const u_birth = document.querySelector('#u_birth');
    const u_job = document.querySelector('#u_job');
    const u_lastschool = document.querySelector('#u_lastschool');
    const u_major = document.querySelector('#u_major');
    const u_phone = document.querySelector('#u_phone');
    const u_name = document.querySelector('#u_name');
    const u_seq = document.querySelector('#u_seq');
    if(input_password.value === ''){
        alert('비밀번호를 입력해야 변경 가능합니다.')
    } else {
        $.ajax({
            url : 'login/updateInfo',
            type : 'POST',
            data : {
                input_password:input_password.value,
                u_name:u_name.value,
                u_birth:u_birth.value,
                u_email:u_email.value,
                u_job:u_job.value,
                u_lastschool:u_lastschool.value,
                u_major:u_major.value,
                u_phone:u_phone.value,
                u_seq:u_seq.value,
            },
            success : (data)=>{
                if(data){
                    alert('정보변경 성공 ! 로그아웃 됩니다 !');
                    location.href = '/logout';
                } else {
                    alert('정보변경 실패 !');
                }
            }
        })
    }
}
function goCompanyPage(){
    alert("컴패니클릭");
    $('#load-section').load('login/company');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
}
