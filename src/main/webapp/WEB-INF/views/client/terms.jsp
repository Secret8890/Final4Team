<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="css/styles.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="/js/terms-script.js"></script>
</head>
<body>
    <div class="terms-all">
        <div class="terms-top">
            <span class="head-text">
            회원가입
        </span>
        </div>
        <div>
            <textarea id="join-text-1" cols="150" rows="20" readonly class="join-text">
        </textarea>
            <div class="terms-check">
                <label><input type="radio" name="check1" value="accept">동의</label>
                <label><input type="radio" name="check1" value="not" checked>동의안함</label>
            </div>
        </div>
        <div>
            <textarea id="join-text-2" cols="150" rows="20" readonly class="join-text">
        </textarea>
            <div class="terms-check">
                <input type="radio" name="check2" value="accept">동의
                <input type="radio" name="check2" value="not" checked>동의안함
            </div>
        </div>
        <div class="terms-bottom">
            <div class="terms-check">
                <label><input type="checkbox" id="allCheck" onchange="allCheck()" name="allCheck">약관에 모두 동의하시겠습니까?</label>
            </div>
            <div class="terms-button-area">
                <input type="button" style="background-color:#007bff; color:#fff" value="가입하기" id="join" class="send-input-button3">
                <input type="button" value="뒤로가기" onclick="location.href='/'">
            </div>
        </div>
    </div>
</body>

</html>