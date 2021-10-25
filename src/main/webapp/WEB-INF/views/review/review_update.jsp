<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<html>
<head>
    <link rel="stylesheet" href="/css/review_update.css"/>
    <title>상세보기</title>
</head>
<body>
    <h2>면접 리뷰 수정</h2>
    <table>
        <tr>
            <th>제목</th>
            <th>회사이름</th>
            <th>작성자</th>
            <th>내용</th>
            <input type="hidden" id="review_seq" value='${update.review_seq}'>
        </tr>
        <tr>
            <td>
                <input type="text" id="review_title" value='${update.review_title}' style="width:200px; height:15px;" /> <br/>
            </td>
            <td>
                <input type="text" id="company_name" value='${update.company_name}' style="width:200px; height:10px;" disabled/> <br/>
            </td>
            <td>
                <input type="text" name="u_seq" value='${update.u_seq}' style="width:200px; height:10px;" disabled/> <br/>
            </td>
            <td>
                <input type="text" id="review_content" placeholder="입력해주세요" value='${update.review_content}' style="width:200px; height:10px;"></td>
            </td>
        </tr>
        
    </table>
    <div class="detail_button1">
        <button id="list" onclick="location.href='/review/list?review_seq=${update.review_seq}'">목록으로</a>
        <button id="review_update" type="button">수정완료</a>
    </div>
</body>
<script>
    $('#review_update').on('click',()=>{
        $.ajax({
            url : '/review',
            type : 'PUT',
            data : {
                review_title : $('#review_title').val(),
                review_content: $('#review_content').val(),
                review_seq: $('#review_seq').val()
            },
            success : (data)=>{
                if(data){
                    alert('수정성공 !');
                    location.href = '/review/list';
                } else {
                    alert('수정실패 ㅠ');
                    location.href = '/review/list';
                }
            }
        });
    })
</script>
</html>