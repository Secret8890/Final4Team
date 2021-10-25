function selectMajor(){
    let major=document.getElementById('major_name').value;
    $.ajax({
        type:"GET",
        url:"/search/major",
        data:{major:major},
        success:function(data){
            var html="";
            var result=data;
            $("#resultMajor").empty();
            $.each(result,function(i){
                var major_result=result[i].name;
                html+="<div id='clickMajorName' value="+major_result+" onclick='choiceValue(this)'>";
                html+=major_result;
                html+="</div>";
            })
            $("#resultMajor").append(html);
        }
    })
}