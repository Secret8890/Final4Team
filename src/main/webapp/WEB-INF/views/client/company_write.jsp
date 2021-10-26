<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
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
                    <td><input id="co_job_mid_name" name="co_job_mid_name" size="50" align="center" /></td>
                </tr>
                <tr>
                    <th width="20%">직무명</th> 
                    <td><input id="co_job_name" name="co_job_name" size="50" align="center"  /></td>
                </tr>
                <tr>
                    <th width="20%">지역</th> 
                    <td><input id="co_location_name" name="co_location_name" size="50" align="center"  /></td>
                </tr>
                <tr>
                    <th width="20%">신입,경력</th> 
                    <td><input id="co_career" name="co_career" size="50" align="center"  /></td>
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
                    <td><input id="co_job_type" name="co_job_type" size="50" align="center"  /></td>
                </tr>
        
                <tr>
                    <th width="20%">학력</th> 
                    <td><input id="co_education" name="co_education" size="50" align="center"  /></td>
                </tr>



        </tbody>

        </table>
        <div id="cl_iframe" name="cl_iframe" class="detail">
            <h3>1. 모집부문 및 상세내용</h3><br><br><br>
            <h3>2. 근무조건</h3><br><br><br>
            <h3>3. 전형절차</h3><br><br><br>
            <h3>4. 접수기간 및 방법</h3><br><br><br>
            <h3>5. 유의사항</h3><br><br><br>
        </div>
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
                        <td><input id="co_job_mid_name" name="co_job_mid_name"  size="50" align="center" value=${contents.co_job_mid_name}></td>
                    </tr>
                    <tr>
                        <th width="20%">직무명</th> 
                        <td><input id="co_job_name" name="co_job_name"  size="50" align="center"  value=${contents.co_job_name}></td>
                    </tr>
                    <tr>
                        <th width="20%">지역</th> 
                        <td><input id="co_location_name" name="co_location_name"  size="50" align="center"  value=${contents.co_location_name}></td>
                    </tr>
                    <tr>
                        <th width="20%">신입,경력</th> 
                        <td><input id="co_career"  name="co_career"  size="50" align="center" value=${contents.co_career}></td>
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
                        <td><input id="co_job_type" name="co_job_type"  size="50" align="center"  value=${contents.co_job_type}></td>
                    </tr>
            
                    <tr>
                        <th width="20%">학력</th> 
                        <td><input id="co_education" name="co_education"  size="50" align="center" value=${contents.co_education}></td>
                    </tr>
            </tbody>
            </table>
            <div id="cl_iframe" name="cl_iframe" class="detail">
                ${iframe.cl_iframe}
            </div>
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
            let plainText = document.querySelector(".note-editable").innerHTML;
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
            let plainText = document.querySelector(".note-editable").innerHTML;
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

    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <script>
        // $(document).ready(function() {
        //     $('#cl_iframe').summernote();
        //   });

    </script>
</body>
</html>