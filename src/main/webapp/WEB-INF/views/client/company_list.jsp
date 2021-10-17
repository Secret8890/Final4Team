<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company_list</title>
    <!--공고쓰고 post로 날릴때 CO_NAME을 MEMBER의 U_NAME을 받는 형태로 MAPPER.XML에 sql 만들어야함
        쓰기,수정,삭제 눌렀다가 다시 list로 갈때도 동일하게 지금회사로 올린것만 나오게해야함
        내용보기 view 대충 만들어놓기
    -->
</head>
<body>
    <center>
        &nbsp;&nbsp;&nbsp;
        <button class="back">뒤로</button>
        <button class="write">쓰기</button>
        <br/>
        <table border='1' cellpadding='7' cellspacing='2' width='50%'>
        <tr>
        <th>번호</th>
        <th>기업명</th>
        <th>제목</th>
        <th>수정</th>
        <th>삭제</th>
        </tr>
        <c:if test="${empty list}">
            <tr>
               <td align='center' colspan="5">데이터가 하나도 없음</td>
            </tr>
        </c:if>
        <c:forEach items="${list}" var="list">
            <tr>
            <td align='center'>${list.co_seq}</td>
            <td align='center'>${list.co_name}</td>
            <td><a class="content" onclick="viewContent()">${list.co_title}</a></td>
            <td><input type="button" name="edit" data-row="${list.co_seq}" onclick="update(this)" value="수정"></td>
            <td><input type="button" name="delete" data-row="${list.co_seq}" onclick="del(this)" value="삭제"></td>
            </tr>
        </c:forEach>
        
        </table>
    </center>
    
    <script>
        function del(object){
            let co_seq = object.getAttribute('data-row');
            $.ajax({
                url: 'company/delete.do',
                type: 'DELETE',
                data : {co_seq:co_seq},
                success : (data) => {
                    if(data){
                        alert('삭제성공');
                        $('#load-section').load('company/list.do');
                    }
                    else {
                        alert('삭제실패');
                    }
                }
            })
        }
        function update(object){
            let co_seq = object.getAttribute('data-row');
            $('#load-section').load('company/content.do?co_seq='+co_seq);
        }
    </script>
    <script src="js/company.js"></script>
</body>
</html>