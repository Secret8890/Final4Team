<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/company_write.css" />
    <title>Company</title>
</head>
<body>
    <c:if test="${empty content}">
        
    
        <div>
        <table border="1" width="600" height="200" align="center">
            <thead>
            <Button variant="contained" data-row='<sec:authentication property="principal.member.u_name" />' onclick="back(this)" align="center" color="primary">◀</Button>
             <tr>
                 <td width="30%" colSpan="2" align="center"><h2>입력폼</h2></td> 
             </tr>
           </thead>
           <form action="write.do" method="post">
           <tbody>
                 <tr>
                     <th width="30%">회사명</th> 
                     <td><input id="co_name" name="co_name" align="center" size="50" align="center"value='<sec:authentication property="principal.member.u_name" />' readonly/></td>
                 </tr>
                 <tr>
                     <th width="30%">회사url</th> 
                     <td><input id="co_name_href" name="co_name_href" size="50" align="center" /></td>
                 </tr>
                 <tr>
                     <th width="30%">공고명</th> 
                     <td><input id="co_title" name="co_title" size="50" align="center" /></td>
                 </tr>
                 <tr>
                     <th width="30%">상위 직무명</th> 
                     <td><input id="co_job_mid_name" name="co_job_mid_name" size="50" align="center" /></td>
                 </tr>
                 <tr>
                     <th width="30%">직무명</th> 
                     <td><input id="co_job_name" name="co_job_name" size="50" align="center"  /></td>
                 </tr>
                 <tr>
                     <th width="30%">지역</th> 
                     <td><input id="co_location_name" name="co_location_name" size="50" align="center"  /></td>
                 </tr>
                 <tr>
                     <th width="30%">신입,경력</th> 
                     <td><input id="co_career" name="co_career" size="50" align="center"  /></td>
                 </tr>

                 <tr>
                     <th width="30%">모집시작일</th> 
                     <td><input id="co_start_date" name="co_start_date" size="50" align="center"  /></td>
                 </tr>
                 <tr>
                     <th width="30%">마감일</th> 
                     <td><input id="co_end_date" name="co_end_date" size="50" align="center"  /></td>
                 </tr>
                 <tr>
                     <th width="30%">공고url</th> 
                     <td><input id="co_url" name="co_url" size="50" align="center"  /></td>
                 </tr>
                 <tr>
                     <th width="30%">연봉</th> 
                     <td><input id="co_salary" name="co_salary" size="50" align="center"  /></td>
                 </tr>
                 <tr>
                     <th width="30%">근무형태</th> 
                     <td><input id="co_job_type" name="co_job_type" size="50" align="center"  /></td>
                 </tr>
         
                 <tr>
                     <th width="30%">학력</th> 
                     <td><input id="co_education" name="co_education" size="50" align="center"  /></td>
                 </tr>
           </tbody>
        </table>
         </div>
         <Button variant="contained" class="writeSubmit" onclick="submitWrite(this)" 
                data-co_name='<sec:authentication property="principal.member.u_name" />' align="center" color="primary">입력</Button>
        </form>
    </c:if>
    <c:if test="${not empty content}">
        
            <div>update임</div>
            <table border="1" width="600" height="200" align="center">
                <thead>
                    <Button variant="contained" data-row='<sec:authentication property="principal.member.u_name" />' onclick="back(this)" class="back" align="center" color="primary">뒤로</Button>
                <tr>
                    <td width="30%" colSpan="2" align="center"><h2>입력폼</h2></td> 
                </tr>
            </thead>
            <form>
            <tbody>
                    <tr>
                        <th width="30%">번호</th> 
                        <td><input id="co_seq" name="co_seq" align="center" size="50" align="center" value=${content.co_seq} readonly="true"/></td>
                    </tr>
                    <tr>
                        <th width="30%">회사명</th> 
                        <td><input id="co_name" name="co_name" align="center" size="50" align="center" value='<sec:authentication property="principal.member.u_name" />'readonly></td>
                    </tr>
                    <tr>
                        <th width="30%">회사url</th> 
                        <td><input id="co_name_href" name="co_name_href" size="50" align="center" value=${content.co_name_href}></td>
                    </tr>
                    <tr>
                        <th width="30%">공고명</th> 
                        <td><input id="co_title" name="co_title" size="50" align="center" value=${content.co_title}></td>
                    </tr>
                    <tr>
                        <th width="30%">상위 직무명</th> 
                        <td><input id="co_job_mid_name" name="co_job_mid_name"  size="50" align="center" value=${content.co_job_mid_name}></td>
                    </tr>
                    <tr>
                        <th width="30%">직무명</th> 
                        <td><input id="co_job_name" name="co_job_name"  size="50" align="center"  value=${content.co_job_name}></td>
                    </tr>
                    <tr>
                        <th width="30%">지역</th> 
                        <td><input id="co_location_name" name="co_location_name"  size="50" align="center"  value=${content.co_location_name}></td>
                    </tr>
                    <tr>
                        <th width="30%">신입,경력</th> 
                        <td><input id="co_career"  name="co_career"  size="50" align="center" value=${content.co_career}></td>
                    </tr>

                    <tr>
                        <th width="30%">모집시작일</th> 
                        <td><input id="co_start_date" name="co_start_date"  size="50" align="center" value=${content.co_start_date}></td>
                    </tr>
                    <tr>
                        <th width="30%">마감일</th> 
                        <td><input id="co_end_date" name="co_end_date"  size="50" align="center" value=${content.co_end_date}></td>
                    </tr>
                    <tr>
                        <th width="30%">공고url</th> 
                        <td><input id="co_url" name="co_url"  size="50" align="center" value=${content.co_url}></td>
                    </tr>
                    <tr>
                        <th width="30%">연봉</th> 
                        <td><input id="co_salary" name="co_salary"  size="50" align="center" value=${content.co_salary}></td>
                    </tr>
                    <tr>
                        <th width="30%">근무형태</th> 
                        <td><input id="co_job_type" name="co_job_type"  size="50" align="center"  value=${content.co_job_type}></td>
                    </tr>
            
                    <tr>
                        <th width="30%">학력</th> 
                        <td><input id="co_education" name="co_education"  size="50" align="center" value=${content.co_education}></td>
                    </tr>
            </tbody>
            </table>
         </div>
         <Button variant="contained" class="updateSubmit" onclick="editPost(this)" data-row="${content.co_seq}" 
                data-co_name='<sec:authentication property="principal.member.u_name" />' align="center" color="primary">수정</Button>
        </form>
    </c:if>
    <script src="js/company.js"></script>
    <script>
        function back(object){
            let co_name = object.getAttribute('data-row');
            console.log(co_name);
            $("#load-section").load('company/listCompany.do?co_name='+co_name);
        }

        function submitWrite(object){ //company_write의 writeSubmit 버튼과 연결
            $.ajax({
                url: 'company/write.do',
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
                    co_education:$('#co_education').val()
                },
            success : function() {
                alert('신규 공고 등록완');
                let co_name = object.getAttribute('data-co_name');
                console.log(co_name);
                $("#load-section").load('company/listCompany.do?co_name='+co_name);
                }
            })
        }
        function editPost(object){ //company_write의 updateSubmit 버튼과 연결
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
                    co_education:$('#co_education').val()
                },
                success : function(){
                    alert('공고 수정 완');
                    let co_name = object.getAttribute('data-co_name');
                    console.log(co_name);
                    $("#load-section").load('company/listCompany.do?co_name='+co_name);
                }
            })
        }
    </script>
</body>
</html>