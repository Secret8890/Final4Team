<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Title</title>
		<style>
			table, th, td {
			   border: 1px solid black;
			   border-collapse: collapse;
			}
			th, td {
			   padding: 5px;
			}
			a { text-decoration:none }
		</style>
		
	</head>

	<body style="text-align:center">
		<center>
			<h1>
				Review List with SpringBoot
			</h1>
			<a href='boardform.do'>입력</a>
			&nbsp;&nbsp;&nbsp;
			<a href='../index.do'>인덱스</a>
			<br/>
			<table style='width:60%' cellpadding='7' cellspacing='2'>
			<tr style="height: 20px">
				<th>리뷰번호</th>
				<th>유저이름</th>
				<th>회사</th>
				<th>제목</th>
				<th>내용</th>
				<th>날짜</th>
			</tr>
			
				
			
			<c:if test="${empty list}">
			    <tr>
				   <td align='center' colspan="7">데이터가 하나도 없음</td>
				</tr>
			</c:if>
			<c:forEach items="${list}" var="review">
			    <tr>
				<td align='center'>${review.review_seq}</td>
				<td align='center'>${review.u_seq}</td>
				<td align='center'>${review.co_seq}</td>
				<td align='center'>${review.review_title}</td>
				<td align='center'>${review.review_content}</td>
				<td align='center'>${review.review_date}</td>
				<td align='center'><a href='del.do?review_seq=${review.review_seq}'>삭제</a></td>
				</tr>
			</c:forEach>
			
			</table>
			<form>
				<input type="hidden" name="currPage" />
				<input type="hidden" name="pageSize" />
			</form>
			<div class="listHead">
				.... list head content ....
			</div>
			<div class="listBody">
				.... list body content ....
			</div>
			<div class="listFooter">
				<div class="paginate"></div>
			</div>
		</center>
	</body>
</html>