$(document).ready(function(){
    $("#co_title").autocomplete({
        source : function(request, response) {
            $.ajax({
                url : "/review/searchCompany", 
                type : "GET",
                data : {co_name:$("#co_title").val()},
                success : function(data){ // 성공
                    console.log(data);
                    response(
                        $.map(data, function(item) {
                            return {
                                label : item.data    //목록에 표시되는 값
                                , value : item.data    //선택 시 input창에 표시되는 값
                                , idx : item.data    // db 인덱스를 담을수 있음 (예제)
                            };
                        })
                    );    //response
                },
                error : function(){ //실패
                    alert("통신에 실패했습니다.");
                }
            });
        }, 
        minLength : 1, 
        autoFocus : false, 
        select : function(evt, ui) {
            console.log("전체 data: " + JSON.stringify(ui));
            console.log("db Index : " + ui.item.idx);
            console.log("검색 데이터 : " + ui.item.value);
        }, 
        focus : function(evt, ui) {
            return false;
        }, 
        close : function(evt) {

        }
    });
});
function review_back(){
    location.href='/review/list';
}
function review_insert(){
    const company_name = $('#co_title').val();
    const review_title = $('#review_title').val();
    const review_content = $('#review_content').val();

    $.ajax({
        url : '/review',
        type : 'POST',
        data : {
            company_name:company_name,
            review_title:review_title,
            review_content:review_content
        },
        success : (data)=>{
            if(data) {
                alert('글작성 성공 !');
                location.href='/review/list';
            } else {
                alert('작성실패')
                location.href='/review/list';
            }
        }
    })
}