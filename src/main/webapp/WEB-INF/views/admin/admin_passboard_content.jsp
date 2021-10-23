<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/admin_passboard_content.css" rel="stylesheet" />
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
      <form id="form_upload" class="form_upload">
        <table>
            <tr>
               <td width="10%" align="center">제목</td>
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
              type:"DELETE",
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
<!-- IONICONS -->
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<!--js-->
<script src="/js/adminjs.js"></script>
</html>