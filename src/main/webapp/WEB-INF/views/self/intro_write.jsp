<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='/css/intro_write.css'>
</head>
<body>
        <h1 class="introduce_indicator">자기소개서 작성</h1>
        <div class="introduce_caution">
            <p class="introduce_caution_img"><img src="/img/list.png"></p>
            <div class="introduce_txt">
                <li>나의 성장배경, 성격의 장단점, 지원동기, 입사 후 포부 등을 각 항목별로 설정하여 작성할 수 있습니다.<br>
                <li>작성하신 내용은 10분 단위로 자동 저장됩니다.<br>
                <li>일부 특수문자(<,>,', ")의 경우 정상적으로 출력이 되지 않을 수 있으니 주의바랍니다.<br>
            </div>
        </div>

        <div class="introduce_subject">
            <input type="text" id="self_name" name="subject" placeholder="자기소개서 제목">
        </div>
        <div class="introduce_table">
            <input type="hidden" id="u_seq" name="u_seq" placeholder="U_SEQ(회원번호)" value="<sec:authentication property='principal.member.u_seq' />"/> <br/>
            <div class="self_out">
                <div class="self_area">
                    <div class="introduce_title">
                        <input style="flex-grow:5" type="text" name="qa_q" placeholder="항목 제목">
                    </div>
                    <div class="introduce_content">
                        <textarea name="qa_a" placeholder="자기소개서 내용을 입력하세요" ></textarea>
                    </div>
                    <input type="button" value="삭제하기" class="delQA_button" onclick="delAction(this)">
                </div>
            </div>
            <div class="add_delete">
                    <input type="button" id="addQA_button" value="+ 항목 추가">
                </div>
            <div class="introduce_save">
                <input id="save_button" type="button" value="수정">
            </div>
        </div>
        
    <script src="/js/self_insert.js">
    </script>
</body>
</html>