<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="/js/popup.js"></script>
<link href="/css/search.css" rel="stylesheet" />
<title>전공 검색</title>
</head>
<script>
function choiceValue(object){
    const result = $(object).attr('value');
    opener.setMajor(result);
    window.close();
}

</script>
<script src="/js/major_popup.js"></script>
<body>
    <h3>학과 검색</h3>
    <div id="aboutMajor">
        <div class="aboutMajor">
            <input type="text" id="major_name" placeholder="학과명을 검색하세요"/> 
            <button type="button" onclick="selectMajor()">검색</button>
        </div>
        <div id="resultMajor"></div>
    </div>
</body>
</html>