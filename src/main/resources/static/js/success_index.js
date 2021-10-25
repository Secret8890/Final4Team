function showDetail(obj){
  let num=$(obj).attr("data-num");
  $.ajax({
      url:"/pass/content",
      type:"GET",
      data:{num: num},
      dataType:"json",
      success: function(json){
          console.log("###: "+json.content.pass_seq);
              $(".pass_modal").show();
              var html="";
              html+="<table>";
              html+="<colgroup>";
              html+="<col width=8%";
              html+="<col width=92%>";
              html+="</colgroup>";
              html+="<tbody>";
              html+="<tr>";
              html+="<th>컨텐츠명</th>";
              html+="<td>"+json.content.pass_title+"</td>";
              html+="</tr>";
              html+="<tr>";
              html+="<th>구분</th>";
              html+="<TD>"+json.content.pass_career+"</TD>";
              html+="</tr>";
              html+="<tr>";
              html+="<th>지원분야</th>";
              html+="<TD>"+json.content.pass_job+"</TD>";
              html+="</tr>";
              html+="<tr>";
              html+="<th>학교</th>";
              html+="<TD>"+json.content.pass_univ+"</TD>";
              html+="</tr>";
              html+="<tr>";
              html+="<th>학점</th>";
              html+="<TD>"+json.content.pass_grade+"</TD>";
              html+="</tr>";
              html+="<tr>";
              html+="<th>토익</th>";
              html+="<TD>"+json.content.pass_toeic+"</TD>";
              html+="</tr>";
              html+="<tr>";
              html+="<th>상세내용</th>";
              html+="<TD>"+json.content.pass_content+"</TD>";
              html+="</tr>";
              html+="</tbody>";
              html+="</table>";
              html+="<div style='text-align:center'>";
              html+="<input type='button' value='이전' onclick='backButton()'>";
              html+="</div>";
              $(".contentDiv").html(html);
              $(".contentDiv").show();
              $('body').css("overflow-y", "hidden");
      
      }
  })
}
function backButton(){
  $(".pass_modal").hide();
}
window.onclick = (event) => {
  if(event.target == document.querySelector('.pass_modal')) {
      $('.pass_modal').hide();
      $('body').css("overflow-y", "auto");
  } else if(event.target == document.querySelector('.modal')) {
      $('.modal').hide();
      $('body').css("overflow-y", "auto");
  }
};
