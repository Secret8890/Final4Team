<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/company_content.css" />
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <title>Company_Content</title>
</head>
<body>
    <div>
        <div class="company_button">
            <Button variant="contained" data-co_name='<sec:authentication property="principal.member.u_name" />' onclick="back(this)" class="back" align="center" color="primary">◀ 뒤로가기</Button>
            <Button class="goUpdate" name="goUpdate" data-row="${content.co_seq}" onclick="goUpdate(this)">수정</Button>
        </div>
        <table>
            <tr>
                <th width="30%">공고번호</th> 
                <td>${content.co_seq}</td>
            </tr>
            <tr>
                <th width="30%">회사명</th> 
                <td>${content.co_name}</td>
            </tr>
            <tr>
                <th width="30%">회사url</th> 
                <td>${content.co_name_href}</td>
            </tr>
            <tr>
                <th width="30%">공고명</th> 
                <td>${content.co_title}</td>
            </tr>
            <tr>
                <th width="30%">상위 직무명</th> 
                <td>${content.co_job_mid_name}</td>
            </tr>
            <tr>
                <th width="30%">직무명</th> 
                <td>${content.co_job_name}</td>
            </tr>
            <tr>
                <th width="30%">지역</th> 
                <td>${content.co_location_name}</td>
            </tr>
            <tr>
                <th width="30%">신입 경력</th> 
                <td>${content.co_career}</td>
            </tr>
            <tr>
                <th width="30%">모집시작일</th> 
                <td>${content.co_start_date}</td>
            </tr>
            <tr>
                <th width="30%">마감일</th> 
                <td>${content.co_end_date}</td>
            </tr>
            <tr>
                <th width="30%">공고url</th> 
                <td>${content.co_url}</td>
            </tr>
            <tr>
                <th width="30%">연봉</th> 
                <td>${content.co_salary}</td>
            </tr>
            <tr>
                <th width="30%">근무형태</th> 
                <td>${content.co_job_type}</td>
            </tr>
            <tr>
                <th width="30%">요구학력</th> 
                <td>${content.co_education}</td>
            </tr>

        </table>
        <div id="cl_iframe" name="cl_iframe" class="detail">
            ${iframe.cl_iframe}
        </div>
    </div>
    <script src="/js/company.js"></script>
    <script>

        function goUpdate(object){
            let co_seq = object.getAttribute('data-row');
            $("#load-section").load('/company/update.do?co_seq='+co_seq);
        }
        function back(object){
            let co_name = object.getAttribute('data-co_name');
            console.log(co_name);
            $("#load-section").load('/company/listCompany.do?co_name='+co_name);
        }

    </script>

</body>
</html>