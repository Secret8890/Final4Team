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
			<th>resume번호</th>
			<th>user번호</th>
			<th>우편번호</th>
			<th>주소1</th>
			<th>주소2</th>
			<th>고등학교</th>
			<th>졸업여부</th>
			<th>입학년도</th>
			<th>졸업년도</th>
			<th>대학교</th>
			<th>졸업여부</th>
			<th>입학년도</th>
			<th>졸업년도</th>
			<th>평균학점</th>
			<th>학사전공</th>
			<th>대학교(석사)</th>
			<th>졸업여부</th>
			<th>입학년도</th>
			<th>졸업년도</th>
			<th>평균학점</th>
			<th>석사전공</th>
			<th>임시저장여부</th>
			<th>군필</th>
			</tr>
			<c:if test="${empty list}">
			    <tr>
				   <td align='center' colspan="22">데이터가 하나도 없음</td>
				</tr>
			</c:if>
			<c:forEach items="${list}" var="resume">
			    <tr>
				<td align='center'>${resume.re_seq}</td>
				<td align='center'>${resume.u_seq}</td>
				<td align='center'>${resume.re_zipcode}</td>
				<td align='center'>${resume.re_address1}</td>
				<td align='center'>${resume.re_address2}</td>
				<td align='center'>${resume.re_high}</td>
				<td align='center'>${resume.re_highstatus}</td>
				<td align='center'>${resume.re_highstartdate}</td>
				<td align='center'>${resume.re_highenddate}</td>
				<td align='center'>${resume.re_univ}</td>
				<td align='center'>${resume.re_univstatus}</td>
				<td align='center'>${resume.re_univsdate}</td>
				<td align='center'>${resume.re_univedate}</td>
				<td align='center'>${resume.re_univgrade}</td>
				<td align='center'>${resume.re_univmajor}</td>
				<td align='center'>${resume.re_master}</td>
				<td align='center'>${resume.re_masterstatus}</td>
				<td align='center'>${resume.re_mastersdate}</td>
				<td align='center'>${resume.re_masteredate}</td>
				<td align='center'>${resume.re_mastergrade}</td>
				<td align='center'>${resume.re_mastermajor}</td>
				<td align='center'>${resume.re_status}</td>
				<td align='center'>${resume.re_military}</td>
				<td align='center'><a href='del.do?re_seq=${resume.re_seq}'>삭제</a></td>
				</tr>
			</c:forEach>
			</table>
		</center>
	</body>
</html>