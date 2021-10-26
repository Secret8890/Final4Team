<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RESUME CONTENT</title>
</head>
<body>
    <div>
        <table>
            <tr>
                <th width="30%">이력서번호</th> 
                <td>${map["resume"].re_seq}</td>
            </tr>
            <tr>
                <th width="30%">user번호</th> 
                <td>${map["resume"].u_seq}</td>
            </tr>
            <tr>
                <th width="30%">우편번호</th> 
                <td>${map["resume"].re_zipcode}</td>
            </tr>
            <tr>
                <th width="30%">주소</th> 
                <td>${map["resume"].re_address}</td>
            </tr>
            <tr>
                <th width="30%">고등학교</th> 
                <td>${map["resume"].re_high}</td>
            </tr>
            <tr>
                <th width="30%">졸업여부</th> 
                <td>${map["resume"].re_highstatus}</td>
            </tr>
            <tr>
                <th width="30%">입학일</th> 
                <td>${map["resume"].re_highstartdate}</td>
            </tr>
            <tr>
                <th width="30%">졸업일</th> 
                <td>${map["resume"].re_highenddate}</td>
            </tr>

            <tr>
                <th width="30%">대학교</th> 
                <td>${map["resume"].re_univ}</td>
            </tr>
            <tr>
                <th width="30%">졸업여부</th> 
                <td>${map["resume"].re_univstatus}</td>
            </tr>
            <tr>
                <th width="30%">입학일</th> 
                <td>${map["resume"].re_univsdate}</td>
            </tr>
            <tr>
                <th width="30%">졸업일</th> 
                <td>${map["resume"].re_univedate}</td>
            </tr>
            <tr>
                <th width="30%">학점</th> 
                <td>${map["resume"].re_univgrade}</td>
            </tr>
            <tr>
                <th width="30%">전공</th> 
                <td>${map["resume"].re_univmajor}</td>
            </tr>
    
            <tr>
                <th width="30%">석사</th> 
                <td>${map["resume"].re_master}</td>
            </tr>
            <tr>
                <th width="30%">졸업여부</th> 
                <td>${map["resume"].re_masterstatus}</td>
            </tr>
            <tr>
                <th width="30%">입학일</th> 
                <td>${map["resume"].re_mastersdate}</td>
            </tr>
            <tr>
                <th width="30%">졸업일</th> 
                <td>${map["resume"].re_masteredate}</td>
            </tr>
            <tr>
                <th width="30%">학점</th> 
                <td>${map["resume"].re_mastergrade}</td>
            </tr>
            <tr>
                <th width="30%">전공</th> 
                <td>${map["resume"].re_mastermajor}</td>
            </tr>
            <tr>
                <th width="30%">임시저장여부</th> 
                <td>${map["resume"].re_status}</td>
            </tr>
            <tr>
                <th width="30%">이름</th> 
                <td>${map["resume"].re_name}</td>
            </tr>
            <tr>
                <th width="30%">생년월일</th> 
                <td>${map["resume"].re_birth}</td>
            </tr>
            <tr>
                <th width="30%">성별</th> 
                <td>${map["resume"].re_gender}</td>
            </tr>
            <tr>
                <th width="30%">전화번호</th> 
                <td>${map["resume"].re_phone}</td>
            </tr>
            <tr>
                <th width="30%">이메일</th> 
                <td>${map["resume"].re_email}</td>
            </tr>
            <tr>
                <th width="30%">최종학력</th> 
                <td>${map["resume"].re_highmajor}</td>
            </tr>
            <tr>
                <th width="30%">군필</th> 
                <td>${map["resume"].re_military}</td>
            </tr>
            <tr>
                <th width="30%">이력서 제목</th> 
                <td>${map["resume"].re_title}</td>
            </tr>
            <tr>
                <th width="30%">자격증명</th> 
                <td></td>
            </tr>
            <tr>
                <th width="30%">발행처</th> 
                <td></td>
            </tr>
            <tr>
                <th width="30%">취득일</th> 
                <td></td>
            </tr>
            <tr>
                <th width="30%">시험명</th> 
                <td></td>
            </tr>
            <tr>
                <th width="30%">점수</th> 
                <td></td>
            </tr>
            <tr>
                <th width="30%">취득일</th> 
                <td></td>
            </tr>
            <tr>
                <th width="30%">사진</th> 
                <td></td>
            </tr>
        </table>
    </div>
    <script src="js/company.js"></script>
</body>
</html>