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
                <li>[필수] 표시가 붙은 항목은 필수입력 항목이니 반드시 기입해 주세요.</li>
                <li>개인정보 보호를 위해 일정시간(약 1시간) 후 ‘자동로그아웃’ 될 수 있으니, ‘이력서 저장’ 버튼을 수시로 클릭하여 기입하신 정보를 저장하시기 바랍니다.</li>
                <li>구직신청 후에는 기본으로 설정한 이력서와 자기소개서만 인재정보 검색서비스를 통해 구인업체에 공개됩니다.</li>
                <li>기본으로 설정된 이력서와 자기소개서는 [미리보기] 기능을 통해 한 화면에서 조회·인쇄·파일로 저장할 수 있습니다.</li>
            </div>
        </div>
        <form>
        
        <input type="hidden" id="u_seq" value='<sec:authentication property="principal.member.u_seq" />'>
        <input type="hidden" id="re_seq" value="${map['resume'].re_seq}"/>
            <div class="resume_title_container">
                <input type="text" id="re_title" class="resume_title_input" placeholder="이력서 관리시 제목" value="${map["resume"].re_title}">
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
                                <td><input type="text" id="re_name" value="${map["resume"].re_name}" name="name" placeholder="이름"></td>
                                <th>생년월일</th>
                                <td><input type="text" id="re_birth" value="${map["resume"].re_birth}" name="birth" placeholder="출생년도"></td>
                                <th>성별</th>
                                <td><select class="gender" id="re_gender" name="성별">
                                    <option value="-" <c:if test="${map['resume'].re_gender eq '-'}">selected</c:if>>-</option>
                                    <option value="여자" <c:if test="${map['resume'].re_gender eq '여자'}">selected</c:if>>여자</option>
                                    <option value="남자" <c:if test="${map['resume'].re_gender eq '남자'}">selected</c:if>>남자</option>
                                    </select>
                                </td>
                                <th>병역</th>
                                <td><select class="military" id="re_military" name="병역" >
                                    <option value="-" <c:if test="${map['resume'].re_military eq '-'}">selected</c:if>>-</option>
                                    <option value="군필" <c:if test="${map['resume'].re_military eq '군필'}">selected</c:if>>군필</option>
                                    <option value="면제" <c:if test="${map['resume'].re_military eq '면제'}">selected</c:if>>면제</option>
                                    <option value="해당사항없음" <c:if test="${map['resume'].re_military eq '해당사항없음'}">selected</c:if>>해당사항없음</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                    <td><input type="text" id="re_zipcode" name="zipcode" placeholder="우편번호" value="${map["resume"].re_zipcode}"></td>
                                    <td colspan="7"><input style="width: 100%" type="text" id="re_address" name="address1" placeholder="주소" value="${map["resume"].re_address}"></td>
                            </tr>
                            <tr>
                                <th>휴대폰번호</th>
                                    <td><input type="text" id="re_phone" name="phone" placeholder="전화번호" value="${map["resume"].re_phone}"></td>
                                <th>이메일</th>
                                    <td colspan="5">
                                    <input type="text" id="email_first" name="email_first"placeholder="이메일" value="${map["resume"].re_email.split('@')[0]}">@
                                        <%-- <select id="email_last" name="email_last">
                                            <option value="gmail">gmail.com</option>
                                            <option value="naver">naver.com</option> 
                                            <option value="daum">daum.com</option>
                                        </select> --%>
                                        <input type="text" id="email_last" name ="email_last" value="${map["resume"].re_email.split('@')[1]}"/>
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
                                    <td><input id="re_high" type="text" name="high" placeholder="학교명" value="${map['resume'].re_high}"></td>
                                    <th>분류</th>
                                    <td>
                                        <select id="re_highmajor" name="highmajor">
                                        <option value="-" <c:if test="${map['resume'].re_highmajor eq '-'}">selected</c:if>>-</option>
                                        <option value="문과" <c:if test="${map['resume'].re_highmajor eq '문과'}">selected</c:if>>문과</option>
                                        <option value="이과" <c:if test="${map['resume'].re_highmajor eq '이과'}">selected</c:if>>이과</option> 
                                        <option value="예체능" <c:if test="${map['resume'].re_highmajor eq '예체능'}">selected</c:if>>예체능</option>
                                        <option value="전문계" <c:if test="${map['resume'].re_highmajor eq '전문계'}">selected</c:if>>전문계</option> 
                                    </select>

                                    <th>졸업여부</th>
                                        <td><select id="re_highstatus" name="highstatus">
                                            <option value="-" <c:if test="${map['resume'].re_highstatus eq '-'}">selected</c:if>>-</option>
                                            <option value="졸업" <c:if test="${map['resume'].re_highstatus eq '졸업'}">selected</c:if>>졸업</option>
                                            <option value="중퇴" <c:if test="${map['resume'].re_highstatus eq '중퇴'}">selected</c:if>>중퇴</option> 
                                        </select>
                                        </td>
                                </tr>
                                <tr>       
                                    <th>기간</th>
                                        <td colspan="6">
                                        
                                        <input type="date" id="re_highstartdate"
                                            <c:if test="${map['resume'].re_highstartdate ne '1111-11-11' 
                                            && map['resume'].re_highstartdate ne null}"> 
                                            value="${map['resume'].re_highstartdate}"
                                            </c:if>
                                        >
                                        ~
                                        <input type="date" id="re_highenddate"
                                            <c:if test="${map['resume'].re_highenddate ne '1111-11-11' 
                                            && map['resume'].re_highenddate ne null}"> 
                                            value="${map['resume'].re_highenddate}"
                                            </c:if>
                                        >
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        <input type="button" value="항목 삭제"/>

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
                                    <td><input id="re_univ" type="text" name="univ" placeholder="학교명" value="${map['resume'].re_univ}"></td>
                                    <th>전공</th>
                                    <td><input id="re_univmajor" type="text" name="univ" placeholder="전공명" value="${map['resume'].re_univmajor}"></td>
                                    <th>졸업여부</th>
                                        <td><select id="re_univstatus"name="univstatus">
                                            <option name="univstatus" value="-" <c:if test="${map['resume'].re_univstatus eq '-'}">selected</c:if>>-</option>
                                            <option name="univstatus" value="졸업" <c:if test="${map['resume'].re_univstatus eq '졸업'}">selected</c:if>>졸업</option>
                                            <option name="univstatus" value="중퇴" <c:if test="${map['resume'].re_univstatus eq '중퇴'}">selected</c:if>>중퇴</option> 
                                        </select>
                                        </td>
                                </tr>
                                <tr>
                                    <th>학점</th>
                                    <td><input id="re_univgrade" type="text" name="univsdate" placeholder="학점" value="${map['resume'].re_univgrade}"></td>        
                                    <th>기간</th>
                                        <td colspan="4">
                                        <input type="date" id="re_univsdate" 
                                            <c:if test="${map['resume'].re_univsdate ne '1111-11-11' 
                                            && map['resume'].re_univsdate ne null}"> 
                                            value="${map['resume'].re_univsdate}"
                                            </c:if>
                                        >
                                        ~
                                        <input type="date" id="re_univedate"
                                            <c:if test="${map['resume'].re_univedate ne '1111-11-11' 
                                            && map['resume'].re_univedate ne null}"> 
                                            value="${map['resume'].re_univedate}"
                                            </c:if>
                                        >
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <input type="button" value="항목 삭제"/>

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
                                    <td><input id="re_master" type="text" placeholder="학교명" value="${map['resume'].re_master}"></td>
                                    <th>전공</th>
                                    <td><input id="re_mastermajor" type="text" placeholder="전공명" value="${map['resume'].re_mastermajor}"></td>
                                    <th>졸업여부</th>
                                    <td><select id="re_masterstatus">
                                        <option value="-" <c:if test="${map['resume'].re_masterstatus eq '-'}">selected</c:if>>-</option>
                                        <option value="졸업" <c:if test="${map['resume'].re_masterstatus eq '졸업'}">selected</c:if>>졸업</option>
                                        <option value="중퇴" <c:if test="${map['resume'].re_masterstatus eq '중퇴'}">selected</c:if>>중퇴</option> 
                                    </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>학점</th>
                                    <td><input id="re_mastergrade" type="text" placeholder="학점" value="${map['resume'].re_mastergrade}"></td>        
                                    <th>기간</th>
                                    <td colspan="3">
                                        <input type="date" id="re_mastersdate"
                                            <c:if test="${map['resume'].re_mastersdate ne '1111-11-11' 
                                            && map['resume'].re_mastersdate ne null}"> 
                                            value="${map['resume'].re_mastersdate}"
                                            </c:if>
                                        >
                                        ~
                                        <input type="date" id="re_masteredate"
                                            <c:if test="${map['resume'].re_masteredate ne '1111-11-11' 
                                            && map['resume'].re_masteredate ne null}"> 
                                            value="${map['resume'].re_masteredate}"
                                            </c:if>
                                        >
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <input type="button" value="항목 삭제"/>
                        
                        <div class="carrer_area">
                            <div class="resume_table4_title">경력사항</div>
                            <c:forEach items="${map['careerList']}" var="list">
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
                                        
                                            <input type="hidden" name="ca_seq" value="${list.ca_seq}">
                                            <th>회사명</th>
                                            <td><input type="text" name="ca_co_name" value="${list.ca_co_name}"></td>
                                            <th>직급</th>
                                            <td><input  type="text" name="ca_position" value="${list.ca_position}"></td>
                                            <th>근무부서</th>
                                            <td><input  type="text" name="ca_dept" value="${list.ca_dept}"></td>
                                        </tr>
                                        <tr>
                                            <th>근무기간</th>
                                            <td><input type="text" name="ca_duration" value="${list.ca_duration}"></td>
                                            <th>입사일</th>
                                            <td>
                                                <input type="date" name="ca_start" 
                                                    <c:if test="${list.ca_start ne '1111-11-11' 
                                                    && list.ca_start ne null}"> 
                                                    value="${list.ca_start}"
                                                    </c:if>
                                                >
                                            </td>
                                            <th>퇴사일</th>
                                            <td>
                                                <input type="date" name="ca_end" 
                                                    <c:if test="${list.ca_end ne '1111-11-11' 
                                                    && list.ca_end ne null}"> 
                                                    value="${list.ca_end}"
                                                    </c:if>
                                                >
                                            </td>
                                        </tr>
                                        <tr>
                                            <th rowspan="3">담당업무</th>
                                            <td colspan="5", rowspan="3"><input type="text" name="ca_work" placeholder="담당업무"></td>
                                        </tr>
                                    </tbody>
                                </table> 
                            </c:forEach>   
                        </div>
                        <div align="right">
                            <input type="button" id="addCarrer" value="항목 추가"/>
                            <input type="button" id="removeCarrer" value="항목 삭제"/>
                        </div>
                        <div class="license_area">
                            <div class="resume_table5_title">자격증</div>
                            <c:forEach items="${map['licenseList']}" var="list">
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
                                            <td><input type="text" name="li_name" value="${list.li_name}"></td>
                                            <th>취득일</th>
                                            <td><input type="text" name="li_date" value="${list.li_date}"></td>
                                            <th>발행처</th>
                                            <td><input type="text" name="li_agency" value="${list.li_agency}"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </c:forEach>
                            <c:if test="${empty map['licenseList']}">
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
                            </c:if>
                        </div>
                        <div align="right">
                            <input type="button" id="addLicense" value="항목 추가"/>  
                            <input type="button" id="removeLicense" value="항목 삭제"/> 
                        </div> 
                        <div class="language_area">
                            <div class="resume_table6_title">어학</div>
                            <c:forEach items="${map['languageList']}" var="list">
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
                                            <td><input type="text" name="la_test_name" value="${list.la_test_name}"></td>
                                            <th>취득일</th>
                                            <td><input type="text" name="la_date" value="${list.la_date}"></td>
                                            <th>점수</th>
                                            <td><input type="text" name="la_score" value="${list.la_score}"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </c:forEach>
                            <c:if test="${empty map['languageList']}">
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
                            </c:if>  
                        </div>
                        <div align="right">
                            <input type="button" id="addLanguage" value="항목 추가"/>  
                            <input type="button" id="removeLanguage" value="항목 삭제"/>  
                        </div>
                        <div class="save">
                            <input type="button" name="tempsave" value="임시저장">
                            <input type="button" id="update_button" name="save" value="작성완료">
                        </div>
                </form>
    <script src='/js/resume_write.js'></script>    
</body>
</html>