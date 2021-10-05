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
				Resume List with SpringBoot
			</h1>
			<a href='write.do'>입력</a>
			&nbsp;&nbsp;&nbsp;
			<a href='../index.do'>인덱스</a>
			<br/>
			<table border='1' cellpadding='7' cellspacing='2' width='50%'>
			<tr>
			<th>고유번호</th>
			<th>이력서제목</th>
			<th>삭제버튼</th>
			</tr>
			<c:if test="${empty list}">
			    <tr>
				   <td align='center' colspan="22">데이터가 하나도 없음</td>
				</tr>
			</c:if>
			<c:forEach items="${list}" var="resume">
			    <tr>
				<td align='center'>${resume.re_seq}</td>
				<td align='center'>${resume.re_title}</td>
				<td align='center'><a href='del.do?re_seq=${resume.re_seq}'>삭제</a></td>
				</tr>
			</c:forEach>
			</table>
		</center>
	</body>
</html>