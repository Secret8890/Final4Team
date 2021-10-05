function selectMajor(){
    let major=document.getElementById('major_name').value;
    $.ajax({
        type:"GET",
        url:"/login/search/major",
        data:{major:major},
        success:function(data){
            var html="";
            var result=data;
            $("#resultMajor").empty();
            $.each(result,function(i){
                var major_result=result[i].major_name;
                html+="<div id='clickMajorName' value="+major_result+" onclick='choiceValue(this)'>";
                html+=major_result;
                html+="</div>";
            })
            $("#resultMajor").append(html);
        }
    })
}