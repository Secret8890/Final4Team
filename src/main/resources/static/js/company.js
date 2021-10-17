document.querySelector(".back").addEventListener("click", backToSetting);

function backToSetting(){
    $("#load-section").load('login/user/setting');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
}


document.querySelector(".write").addEventListener("click", goToWrite)
function goToWrite(){
    $("#load-section").load('company/write.do');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
}



const content = document.querySelector(".content").innerHTML;

function viewContent(){
    console.log(content);
}
