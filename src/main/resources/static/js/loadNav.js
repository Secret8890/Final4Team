document.querySelector('.userInfo_p').addEventListener('click',()=>{
    $("#load-section").load('login/user/setting');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
})
document.querySelector('.self_manage_p').addEventListener('click',()=>{
    $("#load-section").load('resume/intro_manage');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
})

document.querySelector('.apply_list_p').addEventListener('click',()=>{
    $("#load-section").load('resume/apply');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
})


document.querySelector('.aichat_list_p').addEventListener('click',()=>{
    $("#load-section").load('interview/list');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
});