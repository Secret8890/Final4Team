<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css"/>
    <title>Company</title>
</head>
<body>
    <div>
        <table border="1" width="600" height="200" align="center">
            
            <thead>
            <Button variant="contained" name="back" align="center" color="primary">뒤로</Button>
             <tr>
                 <td width="30%" colSpan="2" align="center"><h2>입력폼</h2></td> 
                 
             </tr>
           </thead>
           <tbody>
                 <tr>
                     <th width="30%">user번호</th> 
                     <td><input name="u_seq" align="center" size="50" align="center" /></td>
                 </tr>
                 <tr>
                     <th width="30%">우편번호</th> 
                     <td><input name="re_zipcode" size="50" align="center" /></td>
                 </tr>
                 <tr>
                     <th width="30%">주소</th> 
                     <td><input name="re_address" size="50" align="center" /></td>
                 </tr>
                 <tr>
                     <th width="30%">고등학교</th> 
                     <td><input name="re_high"  size="50" align="center" /></td>
                 </tr>
                 <tr>
                     <th width="30%">졸업여부</th> 
                     <td><input name="re_highstatus"  size="50" align="center"  /></td>
                 </tr>
                 <tr>
                     <th width="30%">입학일</th> 
                     <td><input name="re_highstartdate"  size="50" align="center"  /></td>
                 </tr>
                 <tr>
                     <th width="30%">졸업일</th> 
                     <td><input name="re_highenddate"  size="50" align="center"  /></td>
                 </tr>

                 <tr>
                     <th width="30%">대학교</th> 
                     <td><input name="re_univ"  size="50" align="center"  /></td>
                 </tr>
                 <tr>
                     <th width="30%">졸업여부</th> 
                     <td><input name="re_univstatus"  size="50" align="center"  /></td>
                 </tr>
                 <tr>
                     <th width="30%">입학일</th> 
                     <td><input name="re_univsdate"  size="50" align="center"  /></td>
                 </tr>
                 <tr>
                     <th width="30%">졸업일</th> 
                     <td><input name="re_univedate"  size="50" align="center"  /></td>
                 </tr>
                 <tr>
                     <th width="30%">학점</th> 
                     <td><input name="re_univgrade"  size="50" align="center"  /></td>
                 </tr>
                 <tr>
                     <th width="30%">전공</th> 
                     <td><input name="re_univmajor"  size="50" align="center"  /></td>
                 </tr>
         
                 <tr>
                     <th width="30%">석사</th> 
                     <td><input name="re_master"  size="50" align="center"  /></td>
                 </tr>
           </tbody>
        </table>
         </div>
</body>
</html>