<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="header">
        <div class="TOP">
            <a href="../"><img src="/img/로그1.png"></a>
        </div>
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
            <div class="resume_title">이 력 서</div>
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
                                <td><input id="input1" type="text" name="name" placeholder="이름"></td>
                                <th>생년월일</th>
                                <td><input id="input1" type="text" name="birth" placeholder="출생년도"></td>
                                <th>성별</th>
                                <td><select class="gender" name="성별">
                                    <option value="여자">-</option>
                                    <option value="여자">여자</option>
                                    <option value="남자">남자</option>
                                    </select>
                                </td>
                                <th>병역</th>
                                <td><select class="military" name="병역">
                                    <option value="군필">-</option>
                                    <option value="군필">군필</option>
                                    <option value="면제">면제</option>
                                    <option value="해당사항없음">해당 사항 없음</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                    <td><input id="input1" type="text" name="zipcode" placeholder="우편번호"></td>
                                    <td colspan="7"><input id="input1" type="text" name="address1" placeholder="주소"></td>
                            </tr>
                            <tr>
                                <th>휴대폰번호</th>
                                    <td><input id="input1" type="text" name="phone" placeholder="전화번호"></td>
                                <th>이메일</th>
                                    <td colspan="5">
                                    <input id="input1" type="text" name="email_first"placeholder="이메일">@
                                        <select name="email_last">
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
                                    <th>학력</th>
                                    <td><input id="input1" type="text" name="high" placeholder="학교명"></td>
                                    <th>분류</th>
                                    <td><select name="highstatus">
                                        <option value="graduate">-</option>
                                        <option value="graduate">문과</option>
                                        <option value="graduate">이과</option> 
                                        <option value="graduate">예체능</option>
                                        <option value="graduate">전문계</option> 
                                    </select>

                                    <th>졸업여부</th>
                                        <td><select name="highstatus">
                                            <option name="highstatus" value="graduate">-</option>
                                            <option name="highstatus" value="graduate">졸업</option>
                                            <option name="highstatus" value="graduate">중퇴</option> 
                                        </select>
                                        </td>
                                </tr>
                                <tr>       
                                    <th>기간</th>
                                        <td colspan="6"><select name="highdate">
                                            <option value="graduate">-</option>
                                            <option value="graduate">2030</option>
                                            <option value="graduate">2029</option> 
                                            <option value="graduate">2028</option>
                                            <option value="graduate">2027</option> 
                                            <option value="graduate">2026</option> 
                                            <option value="graduate">2025</option> 
                                            <option value="graduate">2024</option> 
                                            <option value="graduate">2023</option> 
                                            <option value="graduate">2022</option> 
                                            <option value="graduate">2021</option> 
                                            <option value="graduate">2020</option> 
                                            <option value="graduate">2019</option> 
                                            <option value="graduate">2018</option> 
                                            <option value="graduate">2017</option> 
                                            <option value="graduate">2016</option> 
                                            <option value="graduate">2015</option> 
                                            <option value="graduate">2014</option> 
                                            <option value="graduate">2013</option> 
                                            <option value="graduate">2012</option> 
                                            <option value="graduate">2011</option> 
                                            <option value="graduate">2010</option>
                                            <option value="graduate">2009</option>
                                            <option value="graduate">2008</option> 
                                            <option value="graduate">2007</option> 
                                            <option value="graduate">2006</option> 
                                            <option value="graduate">2005</option> 
                                            <option value="graduate">2004</option>
                                            <option value="graduate">2003</option>
                                            <option value="graduate">2002</option>
                                            <option value="graduate">2001</option>
                                            <option value="graduate">2000</option>
                                        </select>

                                        <select name="highdate"> 
                                            <option value="graduate">-</option>
                                            <option value="graduate">1</option>
                                            <option value="graduate">2</option> 
                                            <option value="graduate">3</option>
                                            <option value="graduate">4</option> 
                                            <option value="graduate">5</option> 
                                            <option value="graduate">6</option> 
                                            <option value="graduate">7</option> 
                                            <option value="graduate">8</option> 
                                            <option value="graduate">9</option> 
                                            <option value="graduate">10</option> 
                                            <option value="graduate">11</option> 
                                            <option value="graduate">12</option> 
                                        </select> ~ 
                                        
                                        <select name="highdate">
                                            <option value="graduate">-</option>
                                            <option value="graduate">2030</option>
                                            <option value="graduate">2029</option> 
                                            <option value="graduate">2028</option>
                                            <option value="graduate">2027</option> 
                                            <option value="graduate">2026</option> 
                                            <option value="graduate">2025</option> 
                                            <option value="graduate">2024</option> 
                                            <option value="graduate">2023</option> 
                                            <option value="graduate">2022</option> 
                                            <option value="graduate">2021</option> 
                                            <option value="graduate">2020</option> 
                                            <option value="graduate">2019</option> 
                                            <option value="graduate">2018</option> 
                                            <option value="graduate">2017</option> 
                                            <option value="graduate">2016</option> 
                                            <option value="graduate">2015</option> 
                                            <option value="graduate">2014</option> 
                                            <option value="graduate">2013</option> 
                                            <option value="graduate">2012</option> 
                                            <option value="graduate">2011</option> 
                                            <option value="graduate">2010</option>
                                            <option value="graduate">2009</option>
                                            <option value="graduate">2008</option> 
                                            <option value="graduate">2007</option> 
                                            <option value="graduate">2006</option> 
                                            <option value="graduate">2005</option> 
                                            <option value="graduate">2004</option>
                                            <option value="graduate">2003</option>
                                            <option value="graduate">2002</option>
                                            <option value="graduate">2001</option>
                                            <option value="graduate">2000</option>
                                        </select>

                                        <select name="highdate"> 
                                            <option value="graduate">-</option>
                                            <option value="graduate">1</option>
                                            <option value="graduate">2</option> 
                                            <option value="graduate">3</option>
                                            <option value="graduate">4</option> 
                                            <option value="graduate">5</option> 
                                            <option value="graduate">6</option> 
                                            <option value="graduate">7</option> 
                                            <option value="graduate">8</option> 
                                            <option value="graduate">9</option> 
                                            <option value="graduate">10</option> 
                                            <option value="graduate">11</option> 
                                            <option value="graduate">12</option> 
                                        </select>
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
                                    <td><input id="input1" type="text" name="univ" placeholder="학교명"></td>
                                    <th>전공</th>
                                    <td><input id="input1" type="text" name="univ" placeholder="전공명"></td>
                                    <th>졸업여부</th>
                                        <td><select name="univstatus">
                                            <option name="univstatus" value="graduate">-</option>
                                            <option name="univstatus" value="graduate">졸업</option>
                                            <option name="univstatus" value="graduate">중퇴</option> 
                                        </select>
                                        </td>
                                </tr>
                                <tr>
                                    <th>학점</th>
                                    <td><input id="input1" type="text" name="univsdate" placeholder="학점"></td>        
                                    <th>기간</th>
                                        <td colspan="4"><select name="univsdate">
                                            <option value="graduate">-</option>
                                            <option value="graduate">2030</option>
                                            <option value="graduate">2029</option> 
                                            <option value="graduate">2028</option>
                                            <option value="graduate">2027</option> 
                                            <option value="graduate">2026</option> 
                                            <option value="graduate">2025</option> 
                                            <option value="graduate">2024</option> 
                                            <option value="graduate">2023</option> 
                                            <option value="graduate">2022</option> 
                                            <option value="graduate">2021</option> 
                                            <option value="graduate">2020</option> 
                                            <option value="graduate">2019</option> 
                                            <option value="graduate">2018</option> 
                                            <option value="graduate">2017</option> 
                                            <option value="graduate">2016</option> 
                                            <option value="graduate">2015</option> 
                                            <option value="graduate">2014</option> 
                                            <option value="graduate">2013</option> 
                                            <option value="graduate">2012</option> 
                                            <option value="graduate">2011</option> 
                                            <option value="graduate">2010</option>
                                            <option value="graduate">2009</option>
                                            <option value="graduate">2008</option> 
                                            <option value="graduate">2007</option> 
                                            <option value="graduate">2006</option> 
                                            <option value="graduate">2005</option> 
                                            <option value="graduate">2004</option>
                                            <option value="graduate">2003</option>
                                            <option value="graduate">2002</option>
                                            <option value="graduate">2001</option>
                                            <option value="graduate">2000</option>
                                        </select>

                                        <select name="univsdate"> 
                                            <option value="graduate">-</option>
                                            <option value="graduate">1</option>
                                            <option value="graduate">2</option> 
                                            <option value="graduate">3</option>
                                            <option value="graduate">4</option> 
                                            <option value="graduate">5</option> 
                                            <option value="graduate">6</option> 
                                            <option value="graduate">7</option> 
                                            <option value="graduate">8</option> 
                                            <option value="graduate">9</option> 
                                            <option value="graduate">10</option> 
                                            <option value="graduate">11</option> 
                                            <option value="graduate">12</option> 
                                        </select> ~ 
                                        
                                        <select name="univsdate">
                                            <option value="graduate">-</option>
                                            <option value="graduate">2030</option>
                                            <option value="graduate">2029</option> 
                                            <option value="graduate">2028</option>
                                            <option value="graduate">2027</option> 
                                            <option value="graduate">2026</option> 
                                            <option value="graduate">2025</option> 
                                            <option value="graduate">2024</option> 
                                            <option value="graduate">2023</option> 
                                            <option value="graduate">2022</option> 
                                            <option value="graduate">2021</option> 
                                            <option value="graduate">2020</option> 
                                            <option value="graduate">2019</option> 
                                            <option value="graduate">2018</option> 
                                            <option value="graduate">2017</option> 
                                            <option value="graduate">2016</option> 
                                            <option value="graduate">2015</option> 
                                            <option value="graduate">2014</option> 
                                            <option value="graduate">2013</option> 
                                            <option value="graduate">2012</option> 
                                            <option value="graduate">2011</option> 
                                            <option value="graduate">2010</option>
                                            <option value="graduate">2009</option>
                                            <option value="graduate">2008</option> 
                                            <option value="graduate">2007</option> 
                                            <option value="graduate">2006</option> 
                                            <option value="graduate">2005</option> 
                                            <option value="graduate">2004</option>
                                            <option value="graduate">2003</option>
                                            <option value="graduate">2002</option>
                                            <option value="graduate">2001</option>
                                            <option value="graduate">2000</option>
                                        </select>

                                        <select name="univsdate"> 
                                            <option value="graduate">-</option>
                                            <option value="graduate">1</option>
                                            <option value="graduate">2</option> 
                                            <option value="graduate">3</option>
                                            <option value="graduate">4</option> 
                                            <option value="graduate">5</option> 
                                            <option value="graduate">6</option> 
                                            <option value="graduate">7</option> 
                                            <option value="graduate">8</option> 
                                            <option value="graduate">9</option> 
                                            <option value="graduate">10</option> 
                                            <option value="graduate">11</option> 
                                            <option value="graduate">12</option> 
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <input type="button" value="항목 추가"/>

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
                                    <td><input id="input1" type="text" name="master" placeholder="학교명"></td>
                                    <th>전공</th>
                                    <td><input id="input1" type="text" name="master" placeholder="전공명"></td>
                                    <th>졸업여부</th>
                                        <td><select name="masterstatus">
                                            <option name="masterstatus" value="graduate">-</option>
                                            <option name="masterstatus" value="graduate">졸업</option>
                                            <option name="masterstatus" value="graduate">중퇴</option> 
                                        </select>
                                        </td>
                                </tr>
                                <tr>
                                    <th>학점</th>
                                    <td><input id="input1" type="text" name="master" placeholder="학점"></td>        
                                    <th>기간</th>
                                        <td colspan="4"><select name="masterdate">
                                            <option value="graduate">-</option>
                                            <option value="graduate">2030</option>
                                            <option value="graduate">2029</option> 
                                            <option value="graduate">2028</option>
                                            <option value="graduate">2027</option> 
                                            <option value="graduate">2026</option> 
                                            <option value="graduate">2025</option> 
                                            <option value="graduate">2024</option> 
                                            <option value="graduate">2023</option> 
                                            <option value="graduate">2022</option> 
                                            <option value="graduate">2021</option> 
                                            <option value="graduate">2020</option> 
                                            <option value="graduate">2019</option> 
                                            <option value="graduate">2018</option> 
                                            <option value="graduate">2017</option> 
                                            <option value="graduate">2016</option> 
                                            <option value="graduate">2015</option> 
                                            <option value="graduate">2014</option> 
                                            <option value="graduate">2013</option> 
                                            <option value="graduate">2012</option> 
                                            <option value="graduate">2011</option> 
                                            <option value="graduate">2010</option>
                                            <option value="graduate">2009</option>
                                            <option value="graduate">2008</option> 
                                            <option value="graduate">2007</option> 
                                            <option value="graduate">2006</option> 
                                            <option value="graduate">2005</option> 
                                            <option value="graduate">2004</option>
                                            <option value="graduate">2003</option>
                                            <option value="graduate">2002</option>
                                            <option value="graduate">2001</option>
                                            <option value="graduate">2000</option>
                                        </select>

                                        <select name="masterdate"> 
                                            <option value="graduate">-</option>
                                            <option value="graduate">1</option>
                                            <option value="graduate">2</option> 
                                            <option value="graduate">3</option>
                                            <option value="graduate">4</option> 
                                            <option value="graduate">5</option> 
                                            <option value="graduate">6</option> 
                                            <option value="graduate">7</option> 
                                            <option value="graduate">8</option> 
                                            <option value="graduate">9</option> 
                                            <option value="graduate">10</option> 
                                            <option value="graduate">11</option> 
                                            <option value="graduate">12</option> 
                                        </select> ~ 
                                        
                                        <select name="masterdate">
                                            <option value="graduate">-</option>
                                            <option value="graduate">2030</option>
                                            <option value="graduate">2029</option> 
                                            <option value="graduate">2028</option>
                                            <option value="graduate">2027</option> 
                                            <option value="graduate">2026</option> 
                                            <option value="graduate">2025</option> 
                                            <option value="graduate">2024</option> 
                                            <option value="graduate">2023</option> 
                                            <option value="graduate">2022</option> 
                                            <option value="graduate">2021</option> 
                                            <option value="graduate">2020</option> 
                                            <option value="graduate">2019</option> 
                                            <option value="graduate">2018</option> 
                                            <option value="graduate">2017</option> 
                                            <option value="graduate">2016</option> 
                                            <option value="graduate">2015</option> 
                                            <option value="graduate">2014</option> 
                                            <option value="graduate">2013</option> 
                                            <option value="graduate">2012</option> 
                                            <option value="graduate">2011</option> 
                                            <option value="graduate">2010</option>
                                            <option value="graduate">2009</option>
                                            <option value="graduate">2008</option> 
                                            <option value="graduate">2007</option> 
                                            <option value="graduate">2006</option> 
                                            <option value="graduate">2005</option> 
                                            <option value="graduate">2004</option>
                                            <option value="graduate">2003</option>
                                            <option value="graduate">2002</option>
                                            <option value="graduate">2001</option>
                                            <option value="graduate">2000</option>
                                        </select>

                                        <select name="masterdate"> 
                                            <option value="graduate">-</option>
                                            <option value="graduate">1</option>
                                            <option value="graduate">2</option> 
                                            <option value="graduate">3</option>
                                            <option value="graduate">4</option> 
                                            <option value="graduate">5</option> 
                                            <option value="graduate">6</option> 
                                            <option value="graduate">7</option> 
                                            <option value="graduate">8</option> 
                                            <option value="graduate">9</option> 
                                            <option value="graduate">10</option> 
                                            <option value="graduate">11</option> 
                                            <option value="graduate">12</option> 
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <input type="button" value="항목 추가"/>

                        <div class="resume_table4_title">경력사항</div>
                            <table class="resume_table4">
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
                                        <td><input id="input1" type="text" name="ca_co_name" placeholder="회사명"></td>
                                        <th>직급</th>
                                        <td><input id="input1" type="text" name="ca_position" placeholder="직급"></td>
                                        <th>근무부서</th>
                                        <td><input id="input1" type="text" name="ca_dept" placeholder="근무부서"></td>
                                    </tr>
                                    <tr>
                                        <th>근무기간</th>
                                        <td><input id="input1" type="text" name="ca_duration" placeholder="근무기간"></td>
                                        <th>입사일</th>
                                        <td><input id="input1" type="text" name="ca_start" placeholder="입사일"></td>
                                        <th>퇴사일</th>
                                        <td><input id="input1" type="text" name="ca_end" placeholder="퇴사일"></td>
                                    </tr>
                                    <tr>
                                        <th rowspan="3">담당업무</th>
                                        <td colspan="5", rowspan="3"><input id="input2" type="text" name="ca_work" placeholder="담당업무"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="button" value="항목 추가"/>

                        <div class="resume_table5_title">자격증</div>
                        <table class="resume_table5">
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
                                    <td><input id="input1" type="text" name="li_name" placeholder="자격증 이름"></td>
                                    <th>취득일</th>
                                    <td><input id="input1" type="text" name="li_date" placeholder="취득일"></td>
                                    <th>발행처</th>
                                    <td><input id="input1" type="text" name="li_agency" placeholder="발행처"></td>
                                </tr>
                            </tbody>
                        </table>
                        <input type="button" value="항목 추가"/>  
                        
                        <div class="resume_table6_title">어학</div>
                        <table class="resume_table6">
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
                                    <td><input id="input1" type="text" name="la_test_name" placeholder="시험명"></td>
                                    <th>취득일</th>
                                    <td><input id="input1" type="text" name="la_date" placeholder="취득일"></td>
                                    <th>점수</th>
                                    <td><input id="input1" type="text" name="la_score" placeholder="점수"></td>
                                </tr>
                            </tbody>
                        </table>
                        <input type="button" value="항목 추가"/>  

                        <div class="save">
                            <input type="button" name="tempsave" value="임시저장">
                            <input type="submit" name="save" value="작성완료">
                        </div>
                </form>







        <div class="footer">
            <div>FOOTER</div>
        </div>

        
    <script src='/js/resume_write.js'></script>    
</body>
</html>