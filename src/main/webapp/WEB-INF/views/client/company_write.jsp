<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/css/company_write.css" />
    <title>Company</title>

</head>
<body>
    <c:if test="${empty contents}">
        
        <div>
        <table width="600" height="200" align="center">
            <thead>
                <tr width="30%" colSpan="2" align="center"><h2>공고 등록</h2></tr> 
            </thead>
            <form action="write.do" method="post">
            <tbody>
                <tr>
                    <th width="20%">회사명</th> 
                    <td><input id="co_name" name="co_name" align="center" size="50" align="center"value='<sec:authentication property="principal.member.u_name" />' readonly/></td>
                </tr>
                <tr>
                    <th width="20%">회사url</th> 
                    <td><input id="co_name_href" name="co_name_href" size="50" align="center" /></td>
                </tr>
                <tr>
                    <th width="20%">공고명</th> 
                    <td><input id="co_title" name="co_title" size="50" align="center" /></td>
                </tr>
                <tr>
                    <th width="20%">상위 직무명</th> 
                    <td>
                        <select id="co_job_mid_name" name="co_job_mid_name" align="center">
                            <option value="">직종선택</option>
                            <option value="기획·전략">기획·전략</option>
                            <option value="마케팅·홍보·조사">마케팅·홍보·조사</option>
                            <option value="회계·세무·재무">회계·세무·재무</option>
                            <option value="인사·노무·HRD">인사·노무·HRD</option>
                            <option value="총무·법무·사무">총무·법무·사무</option>
                            <option value="IT개발·데이터">IT개발·데이터</option>
                            <option value="디자인">디자인</option>
                            <option value="영업·판매·무역">영업·판매·무역</option>
                            <option value="고객상담·TM">고객상담·TM</option>
                            <option value="구매·자재·물류">구매·자재·물류</option>
                            <option value="상품기획·MD">상품기획·MD</option>
                            <option value="운전·운송·배송">운전·운송·배송</option>
                            <option value="서비스">서비스</option>
                            <option value="생산">생산</option>
                            <option value="건설·건축">건설·건축</option>
                            <option value="의료">의료</option>
                            <option value="연구·R&D">연구·R&D</option>
                            <option value="교육">교육</option>
                            <option value="미디어·문화·스포츠">미디어·문화·스포츠</option>
                            <option value="금융·보험">금융·보험</option>
                            <option value="공공·복지">공공·복지</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th width="20%">직무명</th> 
                    <td><input id="co_job_name" name="co_job_name" size="50" align="center"  /></td>
                </tr>
                <tr>
                    <th width="20%">지역</th> 
                    <td>
                        <select id="co_location_name" name="co_location_name" align="center">
                            <option value="">지역선택</option>
                            <option value="서울">서울</option>
                            <option value="경기">경기</option>
                            <option value="부산">부산</option>
                            <option value="대구">대구</option>
                            <option value="충남">충남</option>
                            <option value="충북">충북</option>
                            <option value="경남">경남</option>
                            <option value="경북">경북</option>
                            <option value="광주">광주</option>
                            <option value="대전">대전</option>
                            <option value="인천">인천</option>
                            <option value="강원">강원</option>
                            <option value="울산">울산</option>
                            <option value="세종">세종</option>
                            <option value="전남">전남</option>
                            <option value="전북">전북</option>
                            <option value="제주">제주</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th width="20%">신입,경력</th> 
                    <td>
                        <select id="co_career" name="co_career" align="center">
                            <option value="">신입경력선택</option>
                            <option value="신입">신입</option>
                            <option value="경력">경력</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <th width="20%">모집시작일</th> 
                    <td><input id="co_start_date" name="co_start_date" size="50" align="center"  /></td>
                </tr>
                <tr>
                    <th width="20%">마감일</th> 
                    <td><input id="co_end_date" name="co_end_date" size="50" align="center"  /></td>
                </tr>
                <tr>
                    <th width="20%">공고url</th> 
                    <td><input id="co_url" name="co_url" size="50" align="center"  /></td>
                </tr>
                <tr>
                    <th width="20%">연봉</th> 
                    <td><input id="co_salary" name="co_salary" size="50" align="center"  /></td>
                </tr>
                <tr>
                    <th width="20%">근무형태</th> 
                    <td>
                        <select id="co_job_type" name="co_job_type" align="center">
                            <option value="">근무형태선택</option>
                            <option value="정규직">정규직</option>
                            <option value="계약직">계약직</option>
                            <option value="인턴직">인턴직</option>
                            <option value="파견직">파견직</option>
                            <option value="아르바이트">아르바이트</option>
                        </select>
                </tr>
        
                <tr>
                    <th width="20%">학력</th> 
                    <td>
                        <select id="co_education" name="co_education" align="center">
                            <option value="">학력선택</option>
                            <option value="학력무관">학력무관</option>
                            <option value="고등학교졸업">고등학교졸업</option>
                            <option value="고등학교졸업이상">고등학교졸업이상</option>
                            <option value="대학졸업(2,3년)">대학졸업(2,3년)</option>
                            <option value="대학졸업(2,3년)이상">대학졸업(2,3년)이상</option>
                            <option value="대학교졸업(4년)">대학교졸업(4년)</option>
                            <option value="대학교졸업(4년)이상">대학교졸업(4년)이상</option>
                            <option value="석사졸업">석사졸업</option>
                            <option value="석사졸업이상">석사졸업이상</option>
                            <option value="박사졸업">박사졸업</option>
                        </select>
                    </td>
                </tr>
        </tbody>

        </table>
        <textarea id="cl_iframe" name="cl_iframe" class="detail">
            <h3>1. 모집부문 및 상세내용</h3>
            <p></p>
            <p></p>
            <h3>2. 근무조건</h3>
            <p></p>
            <p></p>
            <h3>3. 전형절차</h3>
            <p></p>
            <p></p>
            <h3>4. 접수기간 및 방법</h3>
            <p></p>
            <p></p>
            <h3>5. 유의사항</h3>
            <p></p>
            <p></p>
        </textarea>
        <div class="company_list_button">
            <Button class="company_button" variant="contained" data-row='<sec:authentication property="principal.member.u_name" />' onclick="back(this)" color="primary">뒤로가기</Button>
            <Button class="company_button" variant="contained" class="writeSubmit" onclick="submitWrite(this)" 
                data-co_name='<sec:authentication property="principal.member.u_name" />' color="primary">입력</Button>
        </div>
    </div>
    
    </form>
    </c:if>
    <c:if test="${not empty contents}">
        
            <table width="600" height="200" align="center">
                <thead>
                    <tr width="30%" colSpan="2" align="center"><h2>입력폼</h2></tr>
                </thead>
            <form>
            <tbody>
                    <tr>
                        <th width="20%">번호</th> 
                        <td><input id="co_seq" name="co_seq" align="center" size="50" align="center" value=${contents.co_seq}></td>
                    </tr>
                    <tr>
                        <th width="20%">회사명</th> 
                        <td><input id="co_name" name="co_name" align="center" size="50" align="center" value='<sec:authentication property="principal.member.u_name" />'readonly></td>
                    </tr>
                    <tr>
                        <th width="20%">회사url</th> 
                        <td><input id="co_name_href" name="co_name_href" size="50" align="center" value=${contents.co_name_href}></td>
                    </tr>
                    <tr>
                        <th width="20%">공고명</th> 
                        <td><input id="co_title" name="co_title" size="50" align="center" value=${contents.co_title}></td>
                    </tr>
                    <tr>
                        <th width="20%">상위 직무명</th> 
                        <td>
                            <select id="co_job_mid_name" name="co_job_mid_name" align="center">
                                <option value="${contents.co_job_mid_name}">${contents.co_job_mid_name}</option>
                                <option value="기획·전략">기획·전략</option>
                                <option value="마케팅·홍보·조사">마케팅·홍보·조사</option>
                                <option value="회계·세무·재무">회계·세무·재무</option>
                                <option value="인사·노무·HRD">인사·노무·HRD</option>
                                <option value="총무·법무·사무">총무·법무·사무</option>
                                <option value="IT개발·데이터">IT개발·데이터</option>
                                <option value="디자인">디자인</option>
                                <option value="영업·판매·무역">영업·판매·무역</option>
                                <option value="고객상담·TM">고객상담·TM</option>
                                <option value="구매·자재·물류">구매·자재·물류</option>
                                <option value="상품기획·MD">상품기획·MD</option>
                                <option value="운전·운송·배송">운전·운송·배송</option>
                                <option value="서비스">서비스</option>
                                <option value="생산">생산</option>
                                <option value="건설·건축">건설·건축</option>
                                <option value="의료">의료</option>
                                <option value="연구·R&D">연구·R&D</option>
                                <option value="교육">교육</option>
                                <option value="미디어·문화·스포츠">미디어·문화·스포츠</option>
                                <option value="금융·보험">금융·보험</option>
                                <option value="공공·복지">공공·복지</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th width="20%">직무명</th> 
                        <td><input id="co_job_name" name="co_job_name"  size="50" align="center"  value=${contents.co_job_name}></td>
                    </tr>
                    <tr>
                        <th width="20%">지역</th> 
                        <td>
                            <select id="co_location_name" name="co_location_name" align="center">
                                <option value="${contents.co_location_name}">${contents.co_location_name}</option>
                                <option value="서울">서울</option>
                                <option value="경기">경기</option>
                                <option value="부산">부산</option>
                                <option value="대구">대구</option>
                                <option value="충남">충남</option>
                                <option value="충북">충북</option>
                                <option value="경남">경남</option>
                                <option value="경북">경북</option>
                                <option value="광주">광주</option>
                                <option value="대전">대전</option>
                                <option value="인천">인천</option>
                                <option value="강원">강원</option>
                                <option value="울산">울산</option>
                                <option value="세종">세종</option>
                                <option value="전남">전남</option>
                                <option value="전북">전북</option>
                                <option value="제주">제주</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th width="20%">신입,경력</th> 
                        <td>
                            <select id="co_career" name="co_career" align="center">
                                <option value="${contents.co_career}">${contents.co_career}</option>
                                <option value="신입">신입</option>
                                <option value="경력">경력</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <th width="20%">모집시작일</th> 
                        <td><input id="co_start_date" name="co_start_date"  size="50" align="center" value=${contents.co_start_date}></td>
                    </tr>
                    <tr>
                        <th width="20%">마감일</th> 
                        <td><input id="co_end_date" name="co_end_date"  size="50" align="center" value=${contents.co_end_date}></td>
                    </tr>
                    <tr>
                        <th width="20%">공고url</th> 
                        <td><input id="co_url" name="co_url"  size="50" align="center" value=${contents.co_url}></td>
                    </tr>
                    <tr>
                        <th width="20%">연봉</th> 
                        <td><input id="co_salary" name="co_salary"  size="50" align="center" value=${contents.co_salary}></td>
                    </tr>
                    <tr>
                        <th width="20%">근무형태</th> 
                        <td>
                            <select id="co_job_type" name="co_job_type" align="center">
                                <option value="${contents.co_job_type}">${contents.co_job_type}</option>
                                <option value="정규직">정규직</option>
                                <option value="계약직">계약직</option>
                                <option value="인턴직">인턴직</option>
                                <option value="파견직">파견직</option>
                                <option value="아르바이트">아르바이트</option>
                            </select>
                        </td>
                    </tr>
            
                    <tr>
                        <th width="20%">학력</th> 
                        <td>
                            <select id="co_education" name="co_education" align="center">
                                <option value="${contents.co_education}">${contents.co_education}</option>
                                <option value="학력무관">학력무관</option>
                                <option value="고등학교졸업">고등학교졸업</option>
                                <option value="고등학교졸업이상">고등학교졸업이상</option>
                                <option value="대학졸업(2,3년)">대학졸업(2,3년)</option>
                                <option value="대학졸업(2,3년)이상">대학졸업(2,3년)이상</option>
                                <option value="대학교졸업(4년)">대학교졸업(4년)</option>
                                <option value="대학교졸업(4년)이상">대학교졸업(4년)이상</option>
                                <option value="석사졸업">석사졸업</option>
                                <option value="석사졸업이상">석사졸업이상</option>
                                <option value="박사졸업">박사졸업</option>
                            </select>
                        </td>
                    </tr>
            </tbody>
            </table>
            <textarea id="cl_iframe" name="cl_iframe" class="detail">
                ${iframe.cl_iframe}
            </textarea>
            <div class="company_list_button">
                <Button class="company_button" variant="contained" data-row='<sec:authentication property="principal.member.u_name" />' onclick="back(this)" color="primary">뒤로가기</Button>
                <Button class="company_button" variant="contained" class="editPost" onclick="editPost(this)" 
                    data-co_name='<sec:authentication property="principal.member.u_name" />' color="primary">입력</Button>
            </div>
         </div>
        </form>
    </c:if>
    <script src="js/company.js"></script>
    <script>
        function back(object){
            let co_name = object.getAttribute('data-row');
            console.log(co_name);
            $("#load-section").load('/company/listCompany.do?co_name='+co_name);
        }
        function submitWrite(object){ //company_write의 writeSubmit 버튼과 연결

            let plainText = document.querySelector(".ck-content").innerHTML;
            $.ajax({
                url: '/company/write.do',
                type : 'POST',
                data : {
                    co_name:$('#co_name').val(),
                    co_name_href:$('#co_name_href').val(),
                    co_title:$('#co_title').val(),
                    co_job_mid_name:$('#co_job_mid_name').val(),
                    co_job_name:$('#co_job_name').val(),
                    co_location_name:$('#co_location_name').val(),
                    co_career:$('#co_career').val(),
                    co_start_date:$('#co_start_date').val(),
                    co_end_date:$('#co_end_date').val(),
                    co_url:$('#co_url').val(),
                    co_salary:$('#co_salary').val(),
                    co_job_type:$('#co_job_type').val(),
                    co_education:$('#co_education').val(),
                    cl_iframe:plainText,
                },
            success : function() {
                alert('신규 공고 등록완');
                let co_name = object.getAttribute('data-co_name');
                console.log(co_name);
                $("#load-section").load('/company/listCompany.do?co_name='+co_name);
                }
            })
        }
        function editPost(object){ //company_write의 updateSubmit 버튼과 연결
            let plainText = document.querySelector(".ck-content").innerHTML;
            $.ajax({
                
                url: 'company/update.do?co_seq='+$('#co_seq').val(),
                type: 'PUT',
                data:{
                    co_name:$('#co_name').val(),
                    co_name_href:$('#co_name_href').val(),
                    co_title:$('#co_title').val(),
                    co_job_mid_name:$('#co_job_mid_name').val(),
                    co_job_name:$('#co_job_name').val(),
                    co_location_name:$('#co_location_name').val(),
                    co_career:$('#co_career').val(),
                    co_start_date:$('#co_start_date').val(),
                    co_end_date:$('#co_end_date').val(),
                    co_url:$('#co_url').val(),
                    co_salary:$('#co_salary').val(),
                    co_job_type:$('#co_job_type').val(),
                    co_education:$('#co_education').val(),
                    cl_iframe:plainText
                },
                success : function(){
                    alert('공고 수정 완');
                    let co_name = object.getAttribute('data-co_name');
                    console.log(co_name);
                    $("#load-section").load('/company/listCompany.do?co_name='+co_name);
                }
            })
        }
    </script>
    <script>
        ClassicEditor
              .create(document.querySelector('#cl_iframe'))
              .catch(error => {
                 console.error(error);
              });
     </script>

</body>
</html>