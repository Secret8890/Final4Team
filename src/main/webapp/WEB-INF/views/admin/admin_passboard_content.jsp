<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <!--관리자 업로드 페이지-->
      <form id="form_upload">
        <table>
            <tr>
               <td width="30%" align="center">제목</td>
               <td>${dto.pass_title}</td>
            </tr>
            <tr>
               <td align="center">기업명</td>
               <td>${dto.pass_company}</td>
            </tr>
            <tr>
               <td align="center">신입/인턴</td>
               <td>${dto.pass_career}</td>
            </tr>
            <tr>
               <td align="center">지원분야</td>
               <td>${dto.pass_job}</td>
            </tr>
            <tr>
               <td align="center">학교</td>
               <td>${dto.pass_univ}</td>
            </tr>
            <tr>
               <td align="center">학점</td>
               <td>${dto.pass_grade}</td>
            </tr>
            <tr>
               <td align="center">토익</td>
               <td>${dto.pass_toeic}</td>
            </tr>
            <tr>
               <td align="center">내용</td>
               <td>${dto.pass_content}</td>
            </tr>
            <tr>
               <td colspan="2" align="center">
                  <input type="button" id="btn_update" value="수정" onclick="location.href='${dto.pass_seq}/update'">
                  <input type="button" id="btn_delete" value="삭제" data-num="${dto.pass_seq}" onclick="deleteClick(this)">
               </td>
            </tr>
        </table>
    </form>
</body>
<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script language="javascript">
    function deleteClick(obj){
      let num=$(obj).attr("data-num");
      console.log(num);
      if(confirm("삭제하시겠습니까?")){
          $.ajax({
              url:"/admin/passboard/delete",
              type:"POST",
              data:{
                  pass_seq: num
              },
              success:function(data){
                  alert(data);
                  window.location.href="/admin/passboard/list";
              },error:function(){
                  alert('에러');
              }
          })
      }
  }
 </script>
</html>