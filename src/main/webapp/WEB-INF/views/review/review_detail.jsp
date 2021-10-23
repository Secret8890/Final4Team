<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>상세보기</title>
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
<body>
    <table>
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
        <a href="list.do" id="list" class="btn">목록으로</a>
        <a href="selectUpdate.do?review_seq=${board.review_seq}" id="update" class="btn">수정하기</a>
     
    
</body>

</html>