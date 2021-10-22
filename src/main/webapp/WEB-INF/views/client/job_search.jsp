<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="/js/popup.js"></script>
<title>직종 선택</title>
</head>
<script>
function choiceValue(object){
    const result = $(object).attr('value');
    opener.setJob(result);
    window.close();
}

</script>

<body>
    <h3>직종 검색</h3>
    <div id="aboutJob">
        <div id="resultMajor"></div>
    </div>
<script src="/js/job_popup.js"></script>
</body>
</html>