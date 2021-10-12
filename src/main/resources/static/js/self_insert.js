$(document).ready(function(){
    $('#addQA_button').on('click',()=>{
        const cloneQA = $('.self_area').clone();
        const self_out = $('.self_out');
        self_out.append(cloneQA);
    });

    $('#save_button').on('click',()=>{
        const self_name = document.querySelector('#self_name').value;
        const u_seq = document.querySelector('#u_seq').value;

        const qa_qs = document.querySelectorAll('input[name="qa_q"]');
        const qa_as = document.querySelectorAll('input[name="qa_a"]');
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
});


function delAction (object) {
    let count_QA = document.querySelectorAll('.self_area');
    if(count_QA.length > 1) {
        object.parentElement.remove();
    } else {
        alert('질문과 답변은 최소 한개이상 있어야 합니다.');
    }
    
}