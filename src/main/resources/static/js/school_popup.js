function selectSchool(){
    let school=document.getElementById('school').value;
    $.ajax({
        type:"GET",
        url:"search/school",
        data:{school:school},
        success:function(data){
            var html="";
            var result=data;
            $("#resultSchool").empty();
            $.each(result,function(i){
                var school_result=result[i].name;
                html+="<div id='clickSchoolName' value="+school_result+" onclick='choiceValue(this)'>";
                html+=school_result;
                html+="</div>";
            })
            $("#resultSchool").append(html);
        }
    });
}
