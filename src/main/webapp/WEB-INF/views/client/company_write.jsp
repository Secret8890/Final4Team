<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company</title>
</head>
<body>
    <c:if test="${empty content}">
        
    
        <div>write임</div>
        <div>
        <table border="1" width="600" height="200" align="center">
            <thead>
            <Button variant="contained" class="back" align="center" color="primary">뒤로</Button>
             <tr>
                 <td width="30%" colSpan="2" align="center"><h2>입력폼</h2></td> 
             </tr>
           </thead>
           <form action="write.do" method="post">
           <tbody>
                 <tr>
                     <th width="30%">회사명</th> 
                     <td><input id="co_name" name="co_name" align="center" size="50" align="center" />
                    </td>
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
         <Button variant="contained" class="writeSubmit" onclick="submitWrite()" align="center" color="primary">입력</Button>
        </form>
    </c:if>
    <c:if test="${not empty content}">
        
            <div>update임</div>
            <table border="1" width="600" height="200" align="center">
                <thead>
                <Button variant="contained" class="back" align="center" color="primary">뒤로</Button>
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
                        <td><input id="co_name" name="co_name" align="center" size="50" align="center" value=${content.co_name}></td>
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
         <Button variant="contained" class="updateSubmit" onclick="editPost()" data-row="${content.co_seq}" align="center" color="primary">수정</Button>
        </form>
    </c:if>
    <script src="js/company.js"></script>
</body>
</html>