<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/css/review_update.css"/>
    <title>상세보기</title>
</head>
<body>
    <h2>면접 리뷰</h2>
    <table border="1px solid">
            <tr>
                <th>제목</th>
                <td>${board.review_title}</td>

                <th>조회수</th>
                <td>${board.pass_hit}</td>

                <th>이력서번호</th>
                <td>${board.review_seq}</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td colspan="1">${board.u_seq}</td>
                
                <th>작성시간</th>
                <td colspan="3">${board.review_date}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="5">
                    ${board.review_content}
                </td>
            </tr>
    </table>
        <div class="detail_button">
            <a href="/review/list" id="list" class="btn">목록으로</a>
            <a href="javascript:void(0)" data-num="${board.review_seq}" onclick="review_update(this)" class="btn1">수정하기</a>
        </div>
        <script>
        </script>
</body>

</html>