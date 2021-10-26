document.querySelector(".back").addEventListener("click", backToSetting);

function backToSetting(){
    $("#load-section").load('/user/setting');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
}


document.querySelector(".write").addEventListener("click", goToWrite)
function goToWrite(){
    $("#load-section").load('/company/write.do');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
}
function backToApplyList(){
    let co_seq = localStorage.getItem("co_seq");
    $('#load-section').load('/company/listApply?co_seq='+co_seq);
}

