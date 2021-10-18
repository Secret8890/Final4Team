$(document).ready(function(){
    const count = document.querySelectorAll('input[name="qa_q"]').length;
    $('#addQA_button').on('click',()=>{
        const cloneQUES = $('.self_area').last();
        const cloneQA = cloneQUES.clone(true);
        cloneQA.find('input[name="qa_seq"]').remove();
        cloneQA.find('input[name="qa_q"]').val('');
        cloneQA.find('textArea[name="qa_a"]').val('');
        $('.self_out').append(cloneQA);
    });

    $('#save_button').on('click',()=>{
        const self_name = document.querySelector('#self_name').value;
        const u_seq = document.querySelector('#u_seq').value;
        const qa_qs = document.querySelectorAll('input[name="qa_q"]');
        const qa_as = document.querySelectorAll('textarea[name="qa_a"]');
        alert('aa');
        const ques = [];
        for(var i=0;i<qa_qs.length;i++) {
            let item = {"qa_q":qa_qs[i].value,"qa_a":qa_as[i].value};
            ques.push(item);
        }
        $.ajax({
            url : 'self/insert',
            type : 'POST',
            data : {
                self_name : self_name,
                u_seq : u_seq,
                ques : JSON.stringify(ques),
            },
            success : function(data){
                alert(data);
            }
        });
    });
    $('#update_button').on('click',()=>{
        const qa_qs = document.querySelectorAll('input[name="qa_q"]');
        const qa_as = document.querySelectorAll('textArea[name="qa_a"]');
        const qa_seqs = document.querySelectorAll('input[name="qa_seq"]');
        const u_seq = document.querySelector('#u_seq').value;
        const self_seq = document.querySelector('#self_seq').value;
        const self_name = document.querySelector('#self_name').value;
        const quesArr = [];
        for(var i=0;i<qa_qs.length;i++){
            var qa_seq = 0;
            if(qa_seqs[i] != null) {
                qa_seq = qa_seqs[i].value;
            }
            let item = {"qa_q" : qa_qs[i].value, "qa_a" : qa_as[i].value, "qa_seq" : qa_seq}
            quesArr.push(item);
        }
        console.log(quesArr);
        $.ajax({
            url : 'self/update',
            type : 'PUT',
            data : {
                quesArr : JSON.stringify(quesArr),
                u_seq : u_seq,
                self_seq : self_seq,
                count : count,
                self_name : self_name
            },
            success : (data) => {
                if(data) {
                    alert('수정성공');
                    $('#load-section').load('resume/intro_manage?u_seq='+u_seq);
                } else {
                    alert('수정실패');
                    $('#load-section').load('resume/intro_manage?u_seq='+u_seq);
                }
            }
        })
    })
});


function delAction (object) {
    let count_QA = document.querySelectorAll('.self_area');
    if(count_QA.length > 1) {
        object.parentElement.remove();
    } else {
        alert('질문과 답변은 최소 한개이상 있어야 합니다.');
    }
 
    
}
