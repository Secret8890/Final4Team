<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>
<html>
	<head>    
		<meta charset="UTF-8">
			<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
			<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
		<title>board</title>
			<script>
				$(document).on('click', '#btnSave', function(e){
					e.preventDefault();
					review.submit();
				});

				$(document).on('click', '#btnList', function(e){
					e.preventDefault();
					location.href="list.do";
				});

			$(document).ready(function(){
				$("#co_title").autocomplete({
					source : function(request, response) {
						$.ajax({
							url : "/review/searchCompany"
							, type : "GET"
							, data : {co_name:$("#co_title").val()} // 검색 키워드
							, success : function(data){ // 성공
								console.log(data);
								response(
									$.map(data, function(item) {
										return {
											label : item.data    //목록에 표시되는 값
											, value : item.data    //선택 시 input창에 표시되는 값
											, idx : item.data    // db 인덱스를 담을수 있음 (예제)
										};
									})
								);    //response
							}
							,
							error : function(){ //실패
								alert("통신에 실패했습니다.");
							}
						});
					}
					, minLength : 1    
					, autoFocus : false    
					, select : function(evt, ui) {
						console.log("전체 data: " + JSON.stringify(ui));
						console.log("db Index : " + ui.item.idx);
						console.log("검색 데이터 : " + ui.item.value);
					}
					, focus : function(evt, ui) {
						return false;
					}
					, close : function(evt) {
					}
				});
			});


			</script>
			<style>
			.ui-autocomplete {
				position: absolute;
				z-index: 1000;
				cursor: default;
				padding: 0;
				margin-top: 2px;
				list-style: none;
				background-color: #ffffff;
				border: 1px solid #ccc;
				-webkit-border-radius: 5px;
				-moz-border-radius: 5px;
						border-radius: 5px;
				-webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
				-moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
						box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
			}
			.ui-autocomplete > li {
			padding: 3px 20px;
			}
			.ui-autocomplete > li.ui-state-focus {
			background-color: #DDD;
			}
			.ui-helper-hidden-accessible {
			display: none;
			}
			body {
			padding-top: 70px;
			padding-bottom: 30px;
			}
			</style>
	</head>
		<body>
			<article>
				<div class="container" role="main">
					<h2>게시판 폼</h2>
					<form name="review" id="form" role="form" method="post" action="boardform.do">

						<div class="mb-3">
							<label for="reviewnumber">리뷰번호</label>
							<input type="int" class="form-control" name="review_seq" id="title" placeholder="리뷰번호">
						</div>

						<div class="mb-3">
							<label for="companyList">회사이름</label>
							<input type="text" class="form-control" name="co_name" id="co_title" placeholder="회사번호">
						</div>

						<div class="mb-3">

							<label for="title">제목</label>

							<input type="text" class="form-control" name="review_title" id="title" placeholder="제목을 입력해 주세요">

						</div>
						
						<div class="mb-3">
							<label for="reg_id">작성자</label>
							<input type="text" class="form-control" name="u_seq" id="re_id" placeholder="이름을 입력해 주세요">
						</div>
						
						<div class="mb-3">
							<label for="content">내용</label>
							<textarea class="form-control" rows="5" name="review_content" id="content" placeholder="내용을 입력해 주세요" >
							</textarea>
						</div>

					</form>

					<div >
						<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
						<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
					</div>
				</div>
			</article>
		</body>
</html>