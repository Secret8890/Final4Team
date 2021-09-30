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
      <input type="hidden" id="pass_seq" name="pass_seq" value="${dto.pass_seq}">
        <table>
            <tr>
               <td width="30%" align="center">제목</td>
               <td><input id="pass_title" name='pass_title' value='${dto.pass_title}'/></td>
            </tr>
            <tr>
               <td align="center">기업명</td>
               <td><input id="pass_company" name='pass_company' value='${dto.pass_company}'/></td>
            </tr>
            <tr>
               <td align="center">신입/인턴</td>
               <td>
                  <c:if test="${dto.pass_career eq '신입'}">
                     <input type="radio" name="pass_career" value="신입" checked/>신입 <input type="radio" name="pass_career" value="인턴"/>인턴
                  </c:if>
                  <c:if test="${dto.pass_career eq '인턴'}">
                     <input type="radio" name="pass_career" value="신입"/>신입 <input type="radio" name="pass_career" value="인턴" checked/>인턴
                  </c:if>
               </td>
            </tr>
            <tr>
               <td align="center">지원분야</td>
               <td><input id="pass_job" name='pass_job' value='${dto.pass_job}'/></td>
            </tr>
            <tr>
               <td align="center">학교</td>
               <td>
                  <c:choose>
                     <c:when test="${dto.pass_univ eq '서울 상위권'}">
                        <input type="radio" name="pass_univ" value="서울 상위권" checked/>서울 상위권 <input type="radio" name="pass_univ" value="서울 중위권"/>서울 중위권
                        <input type="radio" name="pass_univ" value="서울 하위권"/>서울 하위권 <input type="radio" name="pass_univ" value="지방 상위권"/>지방 상위권
                        <input type="radio" name="pass_univ" value="지방 중위권"/>지방 중위권 <input type="radio" name="pass_univ" value="지방 하위권"/>지방 하위권
                     </c:when>
                     <c:when test="${dto.pass_univ eq '서울 중위권'}">
                        <input type="radio" name="pass_univ" value="서울 상위권" />서울 상위권 <input type="radio" name="pass_univ" value="서울 중위권" checked/>서울 중위권
                        <input type="radio" name="pass_univ" value="서울 하위권"/>서울 하위권 <input type="radio" name="pass_univ" value="지방 상위권"/>지방 상위권
                        <input type="radio" name="pass_univ" value="지방 중위권"/>지방 중위권 <input type="radio" name="pass_univ" value="지방 하위권"/>지방 하위권
                     </c:when>
                     <c:when test="${dto.pass_univ eq '서울 하위권'}">
                        <input type="radio" name="pass_univ" value="서울 상위권" />서울 상위권 <input type="radio" name="pass_univ" value="서울 중위권"/>서울 중위권
                        <input type="radio" name="pass_univ" value="서울 하위권" checked/>서울 하위권 <input type="radio" name="pass_univ" value="지방 상위권"/>지방 상위권
                        <input type="radio" name="pass_univ" value="지방 중위권"/>지방 중위권 <input type="radio" name="pass_univ" value="지방 하위권"/>지방 하위권
                     </c:when>
                     <c:when test="${dto.pass_univ eq '지방 상위권'}">
                        <input type="radio" name="pass_univ" value="서울 상위권" />서울 상위권 <input type="radio" name="pass_univ" value="서울 중위권"/>서울 중위권
                        <input type="radio" name="pass_univ" value="서울 하위권"/>서울 하위권 <input type="radio" name="pass_univ" value="지방 상위권" checked/>지방 상위권
                        <input type="radio" name="pass_univ" value="지방 중위권"/>지방 중위권 <input type="radio" name="pass_univ" value="지방 하위권"/>지방 하위권
                     </c:when>
                     <c:when test="${dto.pass_univ eq '지방 중위권'}">
                        <input type="radio" name="pass_univ" value="서울 상위권" />서울 상위권 <input type="radio" name="pass_univ" value="서울 중위권"/>서울 중위권
                        <input type="radio" name="pass_univ" value="서울 하위권"/>서울 하위권 <input type="radio" name="pass_univ" value="지방 상위권"/>지방 상위권
                        <input type="radio" name="pass_univ" value="지방 중위권" checked/>지방 중위권 <input type="radio" name="pass_univ" value="지방 하위권"/>지방 하위권
                     </c:when>
                     <c:when test="${dto.pass_univ eq '지방 하위권'}">
                        <input type="radio" name="pass_univ" value="서울 상위권" />서울 상위권 <input type="radio" name="pass_univ" value="서울 중위권"/>서울 중위권
                        <input type="radio" name="pass_univ" value="서울 하위권"/>서울 하위권 <input type="radio" name="pass_univ" value="지방 상위권"/>지방 상위권
                        <input type="radio" name="pass_univ" value="지방 중위권"/>지방 중위권 <input type="radio" name="pass_univ" value="지방 하위권" checked/>지방 하위권
                     </c:when>
                  </c:choose>
            </tr>
            <tr>
               <td align="center">학점</td>
               <td><input id="pass_grade" name='pass_grade' value='${dto.pass_grade}'/></td>
            </tr>
            <tr>
               <td align="center">토익</td>
               <td><input id='pass_toeic' value='${dto.pass_toeic}'/></td>
            </tr>
            <tr>
               <td align="center">내용</td>
               <td><textarea id="pass_content" name="pass_content" rows="70" cols="70">${dto.pass_content}</textarea></td>
            </tr>
            <tr>
               <td colspan="2" align="center">
                  <input type="button" id="btn" value="저장">
               </td>
            </tr>
        </table>
</body>
<script type="text/javascript" language="javascript"
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script language="javascript">
    $("#btn").on("click",()=>{
     let text=$("#pass_content").val();
     let pass_seq=$("#pass_seq").val();
     text = text.replace(/(?:\r\n|\r|\n)/g, '<br/>');
      let jsObj={
        pass_seq:pass_seq,
        pass_title:$("#pass_title").val(),
        pass_company:$("#pass_company").val(),
        pass_career:$(':radio[name="pass_career"]:checked').val(),
        pass_job:$("#pass_job").val(),
        pass_univ:$(':radio[name="pass_univ"]:checked').val(),
        pass_grade:$("#pass_grade").val(),
        pass_toeic:$("#pass_toeic").val(),
        pass_content:text
      };
     $.ajax({
        url:"/admin/passboard/content/"+pass_seq+"/update",
        type:"POST",
        contentType:"application/json",
        data:JSON.stringify(jsObj),
        success: function(data){
           window.location.href="/admin/passboard/list";
        },
        error: function(){
         alert("에러");
        }
     })
   })
 </script>
</html>