<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="/js/school_popup.js"></script>
<link href="/css/search.css" rel="stylesheet" />
<title>학교 검색</title>
</head>
<script>
function choiceValue(object){
    const result = $(object).attr('value');
    opener.setSchool(result);
    window.close();
}
</script>
<body>
    <h3>학교선택</h3>
    <div id="aboutSchool">
    <div class="aboutSchool">
        <input type="text" id="school" placeholder="학교명을 검색하세요"/>
        <button type="button" onclick=selectSchool()>검색</button>
    </div>
    <div id="resultSchool"></div>
</body>
</html>