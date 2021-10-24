<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/admin_passboard_upload.css"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
    <title>Document</title>
</head>
<body id="body-pd">
   <div class="l-navbar" id="navbar">
      <nav class="nav">
          <div>
              <div class="nav__brand">
                  <img class="nav__toggle" id="nav-toggle" src="/img/로그5.png" />
                  <!-- <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon> -->
                  <a href="#" class="nav__logo">그것이 알고JOB다</a>
              </div>
              <div class="nav__list">
                  <a href="#" class="nav__link active">
                      <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                      <span class="nav_name">공지사항 관리</span>
                  </a>
                  <a href="#" class="nav__link">
                      <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                      <span class="nav_name">사용자 관리</span>
                  </a>

                  <a href="#" class="nav__link">
                      <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                      <span class="nav_name">통계 관리</span>
                  </a>

                  <a href="#" class="nav__link">
                      <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
                      <span class="nav_name">자기소개서 관리</span>
                  </a>
              </div>
          </div>
      </nav>
  </div>
      <!--관리자 업로드 페이지-->
      <h1>합격 자소서 업로드</h1>
        <table>
            <tr>
               <td width="13%" align="center">제목</td>
               <td><input type="text" id="pass_title" name="pass_title" size="60"></td>
            </tr>
            <tr>
               <td align="center">기업명</td>
               <td><input type="text" id="pass_company" name="pass_company" size="60"></td>
            </tr>
            <tr>
               <td align="center">신입/인턴</td>
               <td><input type="radio" name="pass_career" value="신입" checked/>신입 <input type="radio" name="pass_career" value="인턴"/>인턴</td>
            </tr>
            <tr>
               <td align="center">지원분야</td>
               <td><input type="text" id="pass_job" name="pass_job" size="60"></td>
            </tr>
            <tr>
               <td align="center">학교</td>
               <td><input type="radio" name="pass_univ" value="서울 상위권" checked/>서울 상위권 <input type="radio" name="pass_univ" value="서울 중위권"/>서울 중위권
               <input type="radio" name="pass_univ" value="서울 하위권"/>서울 하위권 <input type="radio" name="pass_univ" value="지방 상위권"/>지방 상위권
               <input type="radio" name="pass_univ" value="지방 중위권"/>지방 중위권 <input type="radio" name="pass_univ" value="지방 하위권"/>지방 하위권</td>
            </tr>
            <tr>
               <td align="center">학점</td>
               <td><input type="text" id="pass_grade" name="pass_grade" size="60"></td>
            </tr>
            <tr>
               <td align="center">토익</td>
               <td><input type="text" id="pass_toeic" name="pass_toeic" size="60"></td>
            </tr>
            <tr>
               <td align="center">내용</td>
               <td><textarea name="content" id="editor">
                  &lt;p&gt;This is some sample content.&lt;/p&gt;
                  </textarea>
               </td>
            </tr>
      </table>
      <div class="uploadbutton">
         <input type="button" id="btn" value="전송">
         <input style="background-color: #e2e2e2; color: #818181;"type="reset" value="다시입력" onclick="input.pass_seq.focus()">
      </div>
</body>
<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script language="javascript">
    $("#btn").on("click",()=>{
      let text=document.querySelector("body > table > tbody > tr:nth-child(8) > td:nth-child(2) > div > div.ck.ck-editor__main > div").innerHTML;
      text = text.replace(/(?:\r\n|\r|\n)/g, '<br/>');
       let jsObj={
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
         url:"/admin/passboard/upload",
         type:"POST",
         contentType:"application/json",
         data:JSON.stringify(jsObj),
         success: function(data){
            window.location.href="/admin/passboard/list";
         }
      })
    })
 </script>
 <script>
   ClassicEditor
         .create(document.querySelector('#editor'))
         .catch(error => {
            console.error(error);
         });
</script>
<!-- IONICONS -->
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
</html>