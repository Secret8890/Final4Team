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
        <div class="caution">
            작성 주의사항
        </div>
        <form>
            <div class="out_container">
                <div class="outline">
                    <div class="name_container">
                        <input type="text" name="name" placeholder="이름"/>
                        <div class="gender">
                            <label style="margin-right:0px" for="male">남</label><br>
                            <input type="radio" id="male" name="gender" value="male">
                            <label style="margin-right:0px" for="female">여</label><br>
                            <input type="radio" id="female" name="gender" value="female">
                            <input style="margin-left:15px;font-size:15px"type="text" name="birth" placeholder="출생연도"/>
                        </div>
                    </div>
                    <div class="addr_container">
                        <input style="width:10%" type="text" name="zipcode" placeholder="우편번호"/>
                        <input type="text" name="address1" placeholder="주소1"/>
                        <input type="text" name="address2" placeholder="주소2"/>
                    </div>
                    <div class="mail_container">
                        <input type="text" name="phone" placeholder="전화번호"/>
                        <div class="email">
                            <input type="text" name="email_first"placeholder="이메일"/>@
                            <select name="email_last">
                                <option value="gmail">gmail.com</option>
                                <option value="naver">naver.com</option>
                                <option value="daum">daum.net</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="education">
                    <div style="flex-grow: 5;background-color: aquamarine">학력</div>
                    <div class="highschool"style="flex-grow: 25;text-align:center">
                        <div class="high_content" style="align-self:center;width:80%;padding:20px 40px">
                            <input type="text" style="width: 14%" name="high" placeholder="고등학교명"/>
                            <div class="radio">
                                <label>졸업</label>
                                <input type="radio" name="highstatus" value="graduate">
                            </div>
                            <div class="radio">
                                <label>중퇴</label>
                                <input type="radio" name="highstatus" value="retire">
                            </div>
                            <input type="text" style="width: 14%" name="high" placeholder="입학일"/>
                            <input type="text" style="width: 14%" name="high" placeholder="졸업일"/>
                        </div>
                        <input type="button" style="margin:10px;align-self:flex-end;padding:20px 40px" value="항목 추가"/>
                    </div>
                </div>

                <div class="education">
                    <div style="flex-grow: 15;background-color: aquamarine">학력</div>
                    <div class="university"style="flex-grow: 7;text-align:center">
                        <div class="univ_content" style="align-self:center;width:80%;padding:20px 40px">
                            <input type="text" style="width: 15%" name="univ" placeholder="대학교명"/>
                            <div class="radio">
                                <label>졸업</label>
                                <input type="radio" name="univstatus" value="graduate">
                            </div>
                            <div class="radio">
                                <label>중퇴</label>
                                <input type="radio" name="univstatus" value="retire">
                            </div>
                            <input type="text" style="width: 10%" name="univsdate" placeholder="입학일"/>
                            <input type="text" style="width: 10%" name="univedate" placeholder="졸업일"/>
                            <input type="text" style="width: 10%" name="univgrade" placeholder="학점"/>
                            <input type="text" style="width: 10%" name="univmajor" placeholder="전공"/>
                        </div>
                        <input type="button" style="margin:10px;align-self:flex-end;padding:20px 40px" value="항목 추가"/>
                    </div>
                </div>

                <div class="education">
                    <div style="flex-grow: 15;background-color: aquamarine">학력</div>
                    <div class="masters"style="flex-grow: 7;text-align:center">
                        <div class="master_content" style="align-self:center;width:70%;padding:20px 40px">
                            <input type="text" style="width: 15%" name="master" placeholder="대학원명"/>
                            <div class="radio">
                                <label>졸업</label>
                                <input type="radio" name="masterstatus" value="graduate">
                            </div>
                            <div class="radio">
                                <label>중퇴</label>
                                <input type="radio" name="masterstatus" value="retire">
                            </div>
                            <input type="text" style="width: 10%" name="mastersdate" placeholder="입학일"/>
                            <input type="text" style="width: 10%" name="masteredate" placeholder="졸업일"/>
                            <input type="text" style="width: 10%" name="mastergrade" placeholder="학점"/>
                            <input type="text" style="width: 10%" name="mastermajor" placeholder="전공"/>
                        </div>
                        <input type="button" style="margin:10px;align-self:flex-end;padding:20px 40px" value="항목 추가"/>
                    </div>
                </div>

                <div class="career">
                    <div style="width:150px;background-color: aquamarine">경력사항</div>
                    <div class="company"style="text-align:center">
                        <div class="company_content" style="align-self:center;width:90%;padding:20px 40px">
                            <input type="text" style="width: 15%;line-height:30px" name="ca_co_name" placeholder="회사명"/>
                            <input type="text" style="width: 11%" name="ca_position" placeholder="직급"/>
                            <input type="text" style="width: 11%" name="ca_end" placeholder="퇴사일"/>
                            <input type="text" style="width: 11%" name="ca_duration" placeholder="근무기간"/>
                            <input type="text" style="width: 11%" name="ca_dept" placeholder="근무부서"/>
                            <input type="text" style="width: 11%" name="ca_work" placeholder="담당업무"/>
                            <input type="text" style="width: 11%" name="ca_start" placeholder="입사일"/>
                        </div>
                        <input type="button" style="margin:10px;align-self:flex-end;padding:20px 40px" value="항목 추가"/>
                    </div>
                </div>

                <div class="military">
                    <div style="flex-grow: 1;background-color: aquamarine">병역</div>
                    <div class="_military" style="flex-grow: 12;text-align:center;flex-direction:row;justify-content:center;line-height:150px">
                        <div class="radio">
                            <label for="done">군필</label>
                            <input type="radio" id="done" name="military" value="done">
                        </div>
                        <div class="radio">
                            <label for="incomplete">미필</label>
                            <input type="radio" id="incomplete" name="military" value="incomplete">
                        </div>
                    </div>
                </div>

                <div class="license">
                    <div style="flex-grow: 4;background-color: aquamarine">자격증</div>
                    <div class="_license"style="flex-grow: 26;text-align:center">
                        <div class="license_content" style="align-self:center;width:60%;padding:20px 40px">
                            <input type="text" style="width: 20%;line-height:30px" name="li_name" placeholder="자격증이름"/>
                            <input type="text" style="width: 16%" name="li_agency" placeholder="발행처"/>
                            <input type="text" style="width: 16%" name="li_date" placeholder="획득일"/>
                        </div>
                        <input type="button" style="margin:10px;align-self:flex-end;padding:20px 40px" value="항목 추가"/>
                    </div>
                </div>

                <div class="language">
                    <div style="flex-grow: 5;background-color: aquamarine">어학</div>
                    <div class="_language"style="flex-grow: 26;text-align:center">
                        <div class="language_content" style="align-self:center;width:60%;padding:20px 40px">
                            <input type="text" style="width: 20%;line-height:30px " name="la_test_name" placeholder="시험명"/>
                            <input type="text" style="width: 16%" name="la_score" placeholder="점수"/>
                            <input type="text" style="width: 16%" name="la_date" placeholder="획득일"/>
                        </div>
                        <input type="button" style="margin:10px;align-self:flex-end;padding:20px 40px" value="항목 추가"/>
                    </div>
                </div>

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