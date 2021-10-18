<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company_Content</title>
</head>
<body>
    <div>

        공고 내용 나올 페이지
        <Button variant="contained" data-co_name='<sec:authentication property="principal.member.u_name" />' onclick="back(this)" class="back" align="center" color="primary">뒤로</Button>
        <input type="button" class="goUpdate" name="goUpdate" data-row="${content.co_seq}" onclick="goUpdate(this)" value="${content.co_title}수정">
    </div>
    <script src="js/company.js"></script>
    <script>

        function goUpdate(object){
            let co_seq = object.getAttribute('data-row');
            $("#load-section").load('company/update.do?co_seq='+co_seq);
        }
        function back(object){
            let co_name = object.getAttribute('data-co_name');
            console.log(co_name);
            $("#load-section").load('company/listCompany.do?co_name='+co_name);
        }

    </script>
</body>
</html>