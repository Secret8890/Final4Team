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
    <link rel='stylesheet' type='text/css' media='screen' href='/css/intro_write.css'>
</head>
<body>
    <form>
        <input type="hidden" id="u_seq" value='<sec:authentication property="principal.member.u_seq" />'>
        <input type="hidden" id="re_seq" value="${map['resume'].re_seq}"/>
        <div class="resume_title_container">
            ${map["resume"].re_title}
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
                        <td>${map["resume"].re_name}</td>
                        <th>생년월일</th>
                        <td>${map["resume"].re_birth}</td>
                        <th>성별</th>
                        <td>
                            ${map['resume'].re_gender}
                        </td>
                        <th>병역</th>
                        <td>
                            ${map['resume'].re_military}
                        </td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>${map["resume"].re_zipcode}</td>
                        <td colspan="7">${map["resume"].re_address}</td>
                    </tr>
                    <tr>
                        <th>휴대폰번호</th>
                        <td>${map["resume"].re_phone}</td>
                        <th>이메일</th>
                        <td colspan="5">
                            ${map["resume"].re_email}
                        </td>
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
                            <td>${map['resume'].re_high}</td>
                            <th>분류</th>
                            <td>
                                ${map['resume'].re_highmajor}
                            </select>

                            <th>졸업여부</th>
                            <td>
                                ${map['resume'].re_highstatus}
                            </td>
                        </tr>
                        <tr>       
                            <th>기간</th>
                                <td colspan="6">
                                
                                <input type="date" id="re_highstartdate" readonly
                                    <c:if test="${map['resume'].re_highstartdate ne '1111-11-11' 
                                    && map['resume'].re_highstartdate ne null}"> 
                                    value="${map['resume'].re_highstartdate}"
                                    </c:if>
                                >
                                ~
                                <input type="date" id="re_highenddate" readonly
                                    <c:if test="${map['resume'].re_highenddate ne '1111-11-11' 
                                    && map['resume'].re_highenddate ne null}"> 
                                    value="${map['resume'].re_highenddate}"
                                    </c:if>
                                >
                            </td>
                        </tr>
                    </tbody>
                </table>

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
                            <td>${map['resume'].re_univ}</td>
                            <th>전공</th>
                            <td>${map['resume'].re_univmajor}</td>
                            <th>졸업여부</th>
                            <td>
                                ${map['resume'].re_univstatus}
                            </td>
                        </tr>
                        <tr>
                            <th>학점</th>
                            <td>${map['resume'].re_univgrade}</td>        
                            <th>기간</th>
                                <td colspan="4">
                                <input type="date" id="re_univsdate" readonly
                                    <c:if test="${map['resume'].re_univsdate ne '1111-11-11' 
                                    && map['resume'].re_univsdate ne null}"> 
                                    value="${map['resume'].re_univsdate}"
                                    </c:if>
                                >
                                ~
                                <input type="date" id="re_univedate" readonly
                                    <c:if test="${map['resume'].re_univedate ne '1111-11-11' 
                                    && map['resume'].re_univedate ne null}"> 
                                    value="${map['resume'].re_univedate}"
                                    </c:if>
                                >
                            </td>
                        </tr>
                        </tbody>
                    </table>

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
                            <td>${map['resume'].re_master}</td>
                            <th>전공</th>
                            <td>${map['resume'].re_mastermajor}</td>
                            <th>졸업여부</th>
                            <td>
                                ${map['resume'].re_masterstatus}
                            </td>
                        </tr>
                        <tr>
                            <th>학점</th>
                            <td>${map['resume'].re_mastergrade}</td>        
                            <th>기간</th>
                            <td colspan="3">
                                <input type="date" id="re_mastersdate" readonly
                                    <c:if test="${map['resume'].re_mastersdate ne '1111-11-11' 
                                    && map['resume'].re_mastersdate ne null}"> 
                                    value="${map['resume'].re_mastersdate}"
                                    </c:if>
                                >
                                ~
                                <input type="date" id="re_masteredate" readonly
                                    <c:if test="${map['resume'].re_masteredate ne '1111-11-11' 
                                    && map['resume'].re_masteredate ne null}"> 
                                    value="${map['resume'].re_masteredate}"
                                    </c:if>
                                >
                            </td>
                        </tr>
                        </tbody>
                    </table>
                
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
                                    <td>${list.ca_co_name}</td>
                                    <th>직급</th>
                                    <td>${list.ca_position}</td>
                                    <th>근무부서</th>
                                    <td>${list.ca_dept}</td>
                                </tr>
                                <tr>
                                    <th>근무기간</th>
                                    <td>${list.ca_duration}</td>
                                    <th>입사일</th>
                                    <td>
                                        <input type="date" name="ca_start" readonly
                                            <c:if test="${list.ca_start ne '1111-11-11' 
                                            && list.ca_start ne null}"> 
                                            value="${list.ca_start}"
                                            </c:if>
                                        >
                                    </td>
                                    <th>퇴사일</th>
                                    <td>
                                        <input type="date" name="ca_end" readonly
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
                                    <input type="hidden" name="li_seq" value="${list.li_seq}">
                                    <th>자격증</th>
                                    <td>${list.li_name}</td>
                                    <th>취득일</th>
                                    <td>${list.li_date}</td>
                                    <th>발행처</th>
                                    <td>${list.li_agency}</td>
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

                <div class="language_area">
                    <div class="resume_table6_title">어학</div>
                    <c:forEach items="${map['languageList']}" var="list">
                        <input type="hidden" name="la_seq" value="${list.la_seq}">
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
                                    <td>${list.la_test_name}</td>
                                    <th>취득일</th>
                                    <td>${list.la_date}</td>
                                    <th>점수</th>
                                    <td>${list.la_score}</td>
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
            </form>
            <div class="introduce_subject">
                ${map['self'].self_name}
            </div>
            <div class="introduce_table">   
                <div class="self_out">
                    <c:forEach items="${map1['quesList']}" var="list">
                        <div class="self_area">
                            <div class="introduce_title">
                                ${list.qa_q}
                            </div>
                            <div class="introduce_content">
                                <textarea name="qa_a" readonly>${list.qa_a}</textarea>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="save">
                    <input type="button" name="tempsave" value="목록으로" onclick="showList()">
                </div>
            </div>
    <script src='/js/resume_write.js'></script>    
</body>
<script>
    function showList(){
        $('#load-section').load('/user/apply');
    }
</script>
</html>