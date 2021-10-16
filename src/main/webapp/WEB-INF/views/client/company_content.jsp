<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <input type="button" class="goUpdate" name="goUpdate" data-row="${content.co_seq}" onclick="goUpdate(this)" value="${content.co_title}수정">
    </div>
    <script src="js/company.js"></script>
    <script>

        function goUpdate(object){
            let co_seq = object.getAttribute('data-row');
            $("#load-section").load('company/update.do?co_seq='+co_seq);
        }

    </script>
</body>
</html>