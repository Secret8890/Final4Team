<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>유저정보변경</title>
</head>
<body>
    <div class="text-header">
        <h1>정보변경</h1>
    </div>
    <sec:authentication property="principal.member.u_name"/> <br/>
    <sec:authentication property="principal.member.u_id" /><br/>
    <sec:authentication property="principal.member.u_name" /><br/>
    <sec:authentication property="principal.member.u_gender" /><br/>
    <sec:authentication property="principal.member.u_birth" /><br/>
    <sec:authentication property="principal.member.u_job" /><br/>
    <sec:authentication property="principal.member.u_degree" /><br/>
    <sec:authentication property="principal.member.u_email" /><br/>
    <sec:authentication property="principal.member.u_major" /><br/>
    <sec:authentication property="principal.member.u_phone" /><br/>
    <sec:authentication property="principal.member.u_career" /><br/>
</body>
</html>