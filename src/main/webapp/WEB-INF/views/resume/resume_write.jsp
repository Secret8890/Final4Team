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
        <div class="caution_text">이력서 작성 시 주의사항</div>
            <div class="caution">   
                <p class="caution_img"><img src="/img/cautionpen.png"></p>
                <div class="caution_txt">
                <li>개인정보 보호를 위해 일정시간(약 1시간) 후 ‘자동로그아웃’ 될 수 있으니, ‘이력서 저장’ 버튼을 수시로 클릭하여 기입하신 정보를 저장하시기 바랍니다.</li>
                <li>기본으로 설정된 이력서와 자기소개서는 이력서 및 자기소개서 관리 페이지를 통해 조회·수정·삭제할 수 있습니다.</li>
            </div>
        </div>
        <form>
        
        <input type="hidden" id="u_seq" value='<sec:authentication property="principal.member.u_seq" />'>
            <div class="resume_title_container">
                <input type="text" id="re_title" class="resume_title_input" placeholder="이력서 관리시 제목">
            </div>
            <div class="out_container">
                    <table class="resume_table">
                        <colgroup>
                            <col width="90px">
                            <col width="100px">
                            <col width="90px">
                            <col width="100px">
                            <col width="60px">
                            <col width="30px">
                            <col width="60px">
                            <col width="50px">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>이름</th>
                                <td><input type="text" id="re_name" name="name" placeholder="이름"></td>
                                <th>생년월일</th>
                                <td><input type="text" id="re_birth" name="birth" placeholder="출생년도"></td>
                                <th>성별</th>
                                <td><select class="gender" id="re_gender" name="성별">
                                    <option value="-">-</option>
                                    <option value="여자">여자</option>
                                    <option value="남자">남자</option>
                                    </select>
                                </td>
                                <th>병역</th>
                                <td><select class="military" id="re_military" name="병역">
                                    <option value="군필">-</option>
                                    <option value="군필">군필</option>
                                    <option value="면제">면제</option>
                                    <option value="해당사항없음">해당 사항 없음</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                    <td><input type="text" id="re_zipcode" name="zipcode" placeholder="우편번호" readonly>
                                        <button type="button" id="searchAddress" onclick="execution_daum_address()">검색</button></td>
                                    <td colspan="7"><input style="width: 100%" type="text" id="re_address" name="address" placeholder="주소" readonly></td>
                            </tr>
                            <tr>
                                <th>휴대폰번호</th>
                                    <td><input type="text" id="re_phone" name="phone" placeholder="전화번호"></td>
                                <th>이메일</th>
                                    <td colspan="5">
                                    <input type="text" id="email_first" name="email_first"placeholder="이메일">@
                                        <select id="email_last" name="email_last">
                                            <option value="gmail">gmail.com</option>
                                            <option value="naver">naver.com</option> 
                                            <option value="daum">daum.com</option>
                                        </select>
                                    </td>
                                </th>
                            </tbody>
                        </table>

                        <div class="resume_table1_title">고등학교</div>
                        <table class="resume_table1">
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
                                    <th>학교명</th>
                                    <td><input id="re_high" type="text" name="high" placeholder="학교명"></td>
                                    <th>분류</th>
                                    <td>
                                        <select id="re_highmajor" name="highmajor">
                                        <option value="-">-</option>
                                        <option value="문과">문과</option>
                                        <option value="이과">이과</option> 
                                        <option value="예체능">예체능</option>
                                        <option value="전문계">전문계</option> 
                                    </select>

                                    <th>졸업여부</th>
                                        <td><select id="re_highstatus" name="highstatus">
                                            <option value="-">-</option>
                                            <option value="졸업">졸업</option>
                                            <option value="중퇴">중퇴</option> 
                                        </select>
                                        </td>
                                </tr>
                                <tr>       
                                    <th>기간</th>
                                        <td colspan="6">
                                        <input type="date" id="re_highstartdate">
                                        ~
                                        <input type="date" id="re_highenddate"> 
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        <%-- <input type="button" value="항목 삭제"/> --%>

                        <div class="resume_table2_title">대학교</div>
                        <table class="resume_table2">
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
                                    <th>학력</th>
                                    <td><input id="re_univ" type="text" name="univ" placeholder="학교명"></td>
                                    <th>전공</th>
                                    <td><input id="re_univmajor" type="text" name="univ" placeholder="전공명"></td>
                                    <th>졸업여부</th>
                                        <td><select id="re_univstatus"name="univstatus">
                                            <option name="univstatus" value="-">-</option>
                                            <option name="univstatus" value="졸업">졸업</option>
                                            <option name="univstatus" value="중퇴">중퇴</option> 
                                        </select>
                                        </td>
                                </tr>
                                <tr>
                                    <th>학점</th>
                                    <td><input id="re_univgrade" type="text" name="univsdate" placeholder="학점"></td>        
                                    <th>기간</th>
                                        <td colspan="4">
                                        <input type="date" id="re_univsdate">
                                        ~
                                        <input type="date" id="re_univedate">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <%-- <input type="button" value="항목 삭제"/> --%>

                        <div class="resume_table3_title">대학원</div>
                        <table class="resume_table3">
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
                                    <th>학력</th>
                                    <td><input id="re_master" type="text" placeholder="학교명"></td>
                                    <th>전공</th>
                                    <td><input id="re_mastermajor" type="text" placeholder="전공명"></td>
                                    <th>졸업여부</th>
                                    <td><select id="re_masterstatus">
                                        <option value="-">-</option>
                                        <option value="졸업">졸업</option>
                                        <option value="중퇴">중퇴</option> 
                                    </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>학점</th>
                                    <td><input id="re_mastergrade" type="text" placeholder="학점"></td>        
                                    <th>기간</th>
                                    <td colspan="3">
                                        <input type="date" id="re_mastersdate">
                                        ~
                                        <input type="date" id="re_masteredate">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <%-- <input type="button" value="항목 삭제"/> --%>
                        
                        <div class="carrer_area">
                            <div class="resume_table4_title">경력사항</div>
                            <table class="resume_table4 career_table">
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
                                        <th>회사명</th>
                                        <td><input type="text" name="ca_co_name" placeholder="회사명"></td>
                                        <th>직급</th>
                                        <td><input  type="text" name="ca_position" placeholder="직급"></td>
                                        <th>근무부서</th>
                                        <td><input  type="text" name="ca_dept" placeholder="근무부서"></td>
                                    </tr>
                                    <tr>
                                        <th>근무기간</th>
                                        <td><input type="text" name="ca_duration" placeholder="근무기간"></td>
                                        <th>입사일</th>
                                        <td><input type="date" name="ca_start" placeholder="입사일"></td>
                                        <th>퇴사일</th>
                                        <td><input type="date" name="ca_end" placeholder="퇴사일"></td>
                                    </tr>
                                    <tr>
                                        <th rowspan="3">담당업무</th>
                                        <td colspan="5", rowspan="3"><input type="text" name="ca_work" placeholder="담당업무"></td>
                                    </tr>
                                </tbody>
                            </table>    
                        </div>
                        <div align="right">
                            <input type="button" id="addCarrer" value="항목 추가"/>
                            <input type="button" id="removeCarrer" value="항목 삭제"/>
                        </div>
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
                        <div class="language_area">
                            <div class="resume_table6_title">어학</div>
                            <table class="resume_table6 language_table">
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
                                        <th>어학</th>
                                        <td><input type="text" name="la_test_name" placeholder="시험명"></td>
                                        <th>취득일</th>
                                        <td><input type="text" name="la_date" placeholder="취득일"></td>
                                        <th>점수</th>
                                        <td><input type="text" name="la_score" placeholder="점수"></td>
                                    </tr>
                                </tbody>
                            </table>  
                        </div>
                        <div align="right">
                            <input type="button" id="addLanguage" value="항목 추가"/>  
                            <input type="button" id="removeLanguage" value="항목 삭제"/>  
                        </div>
                        <div class="save">
                            <input type="button" name="tempsave" value="임시저장">
                            <input type="button" id="save_button" name="save" value="작성완료">
                        </div>
                </form>
    <script src='/js/resume_write.js'></script>
</body>
</html>