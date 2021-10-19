

$(document).ready(function() {
    const co_seq = document.querySelector('#co_seq').value;
    let incruit_modal = document.querySelector('.incruit_modal');

    $('#join_incruit').on('click', ()=>{
        incruit_modal.style.display = 'flex';
    });
    $('#choice_complete').on('click',()=>{
        $.ajax({
            url : '/incruit/apply',
            type : 'POST',
            data : {
                co_seq : co_seq,
                self_seq : $('#choiceSelf').val(),
                re_seq : $('#choiceResume').val(),


            },
            success : (data) => {
                if(data) {
                    alert('지원완료 !');
                    setTimeout(()=>{
                        location.href='/';
                    },1000)
                } else {
                    alert('지원실패 !');
                }
            }
        })
    })
    window.onclick=(event)=> {
        
        if(event.target == incruit_modal){
            incruit_modal.style.display = 'none';
        } 
    }
});