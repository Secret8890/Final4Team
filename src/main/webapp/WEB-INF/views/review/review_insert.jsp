<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>
<html>
	<head>    
		<meta charset="UTF-8">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" rel="Stylesheet">
		<link rel="stylesheet" href="/css/boardform.css"/>
		<title>board</title>
	</head>
	<body>
		<article>
			<div class="container" role="main">
				<h2>면접 리뷰</h2>
				<div class="mb-3">
					<label for="companyList">회사이름</label>
					<input type="text" class="form-control" name="co_name" id="co_title" placeholder="회사이름">
				</div>
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control2" name="review_title" id="review_title" placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3">
					<textarea class="form-control3" rows="5" name="review_content" id="review_content" placeholder="내용을 입력해 주세요"></textarea>
				</div>
				<button type="button" class="btn btn-sm btn-primary1" onclick="review_insert()">저장</button>
				<button type="button" class="btn btn-sm btn-primary" onclick="review_back()">취소</button>
			</div>
		</article>
	</body>
	<script src="/js/review/insert_script.js">
	</script>
	<style rel="stylesheet" href="/css/review_insert.css">
		
	</style>
</html>