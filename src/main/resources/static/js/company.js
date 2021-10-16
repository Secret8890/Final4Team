document.querySelector(".back").addEventListener("click", backToSetting)
function backToSetting(){
    $("#load-section").load('company/list.do');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
}


document.querySelector(".write").addEventListener("click", goToWrite)
function goToWrite(){
    $("#load-section").load('company/write.do');
    document.getElementById('load-section').style.display = 'block';
    document.getElementById('main-section').style.display = 'none';
}


function submitWrite(){ //company_write의 writeSubmit 버튼과 연결
    $.ajax({
        url: 'company/write.do',
        type : 'POST',
        data : {
            co_name:$('#co_name').val(),
            co_name_href:$('#co_name_href').val(),
            co_title:$('#co_title').val(),
            co_job_mid_name:$('#co_job_mid_name').val(),
            co_job_name:$('#co_job_name').val(),
            co_location_name:$('#co_location_name').val(),
            co_career:$('#co_career').val(),
            co_start_date:$('#co_start_date').val(),
            co_end_date:$('#co_end_date').val(),
            co_url:$('#co_url').val(),
            co_salary:$('#co_salary').val(),
            co_job_type:$('#co_job_type').val(),
            co_education:$('#co_education').val()
        },
    success : function() {
        alert('신규 공고 등록완');
        $("#load-section").load('company/list.do');
        document.getElementById('load-section').style.display = 'block';
        document.getElementById('main-section').style.display = 'none';
        }
    })
}

function editPost(){ //company_write의 updateSubmit 버튼과 연결
    $.ajax({
        
        url: 'company/update.do?co_seq='+$('#co_seq').val(),
        type: 'PUT',
        data:{
            co_name:$('#co_name').val(),
            co_name_href:$('#co_name_href').val(),
            co_title:$('#co_title').val(),
            co_job_mid_name:$('#co_job_mid_name').val(),
            co_job_name:$('#co_job_name').val(),
            co_location_name:$('#co_location_name').val(),
            co_career:$('#co_career').val(),
            co_start_date:$('#co_start_date').val(),
            co_end_date:$('#co_end_date').val(),
            co_url:$('#co_url').val(),
            co_salary:$('#co_salary').val(),
            co_job_type:$('#co_job_type').val(),
            co_education:$('#co_education').val()
        },
        success : function(){
            alert('공고 수정 완');
            $("#load-section").load('company/list.do');
            document.getElementById('load-section').style.display = 'block';
            document.getElementById('main-section').style.display = 'none';
        }
    })
}

const content = document.querySelector(".content").innerHTML;

function viewContent(){
    console.log(content);
}
