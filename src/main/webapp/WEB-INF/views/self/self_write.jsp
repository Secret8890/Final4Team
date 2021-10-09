<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>success_index</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='/css/resume_write.css'>


</head>
<body>
        <div class="caution_text">자기소개서 작성 시 주의사항</div>
            <div class="caution">   
                <p class="caution_img"><img src="/img/cautionpen.png"></p>
                <div class="caution_txt">
                <li>[필수] 표시가 붙은 항목은 필수입력 항목이니 반드시 기입해 주세요.</li>
                <li>개인정보 보호를 위해 일정시간(약 1시간) 후 ‘자동로그아웃’ 될 수 있으니, ‘이력서 저장’ 버튼을 수시로 클릭하여 기입하신 정보를 저장하시기 바랍니다.</li>
                <li>구직신청 후에는 기본으로 설정한 이력서와 자기소개서만 인재정보 검색서비스를 통해 구인업체에 공개됩니다.</li>
                <li>기본으로 설정된 이력서와 자기소개서는 [미리보기] 기능을 통해 한 화면에서 조회·인쇄·파일로 저장할 수 있습니다.</li>
            </div>
        </div>
        <form>
        
        <input type="hidden" id="u_seq" value='<sec:authentication property="principal.member.u_seq" />'>
            <div class="resume_title_container">
                <input type="text" id="self_name" class="resume_title_input" placeholder="이력서 관리시 제목">
            </div>
            <div class="out_container">
                        <div class="license_area">
                            <div class="resume_table5_title">자격증</div>
                            <table class="resume_table5 license_table">
                                <colgroup>
                                    <col width="90px">
                                    <col width="100px">
                                    <col width="90px">
                                    <col width="100px">
                                    <col width="90px">
                                    <col width="30px">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>자격증</th>
                                        <td><input type="text" name="li_name" placeholder="자격증 이름"></td>
                                        <th>취득일</th>
                                        <td><input type="text" name="li_date" placeholder="취득일"></td>
                                        <th>발행처</th>
                                        <td><input type="text" name="li_agency" placeholder="발행처"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div align="right">
                            <input type="button" id="addLicense" value="항목 추가"/>  
                            <input type="button" id="removeLicense" value="항목 삭제"/> 
                        </div> 
                        <div class="save">
                            <input type="button" name="tempsave" value="임시저장">
                            <input type="button" id="save_button" name="save" value="작성완료">
                        </div>
                </form>
    <script src='/js/resume_write.js'></script>    
</body>
</html>