<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Title</title>
		<style>
			table, th, td {
			   border: 1px solid black;
			   border-collapse: collapse;
			}
			th, td {
			   padding: 5px;
			}
			a { text-decoration:none }
		</style>
		<script src="/js/trim.js"></script>
		<script language="javascript"> 
		    function check(){
				f.submit();
			}
		
		    function checkByteLen(str, size){
		        var byteLen = getByteLen(str);
				if(byteLen <= size){
					return true;
				}else{
					return false;
				}
			}
			function getByteLen(str){
			   return str.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
		    }
			
			function enterCheck(elm){
				if(event.keyCode == 13){
				
						check();
					}
				}
			
		</script>
	</head>
	
	<body>
	<center>
	   <h1>
			Resume Input with SpringBoot
	   </h1>
	   <form name="f" action="write.do" method="post">
		   <table border="1" width="300" height="200">
			  <tr>
				 <td width="30%" colspan="2" align="center"><h2>입력폼</h2></td> 
			  </tr>
			  <tr>
				<th width="30%">이력서번호</th> 
				<td><input name="re_seq" align="center" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">user번호</th> 
				<td><input name="u_seq" align="center" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			  <tr>
				 <th width="30%">우편번호</th> 
				 <td><input name="re_zipcode" size="20" align="center" onkeydown="enterCheck(this)"></td>
			  </tr>
			  <tr>
				<th width="30%">주소</th> 
				<td><input name="re_address1" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">상세주소</th> 
				<td><input name="re_address2" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">고등학교</th> 
				<td><input name="re_high" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">졸업여부</th> 
				<td><input name="re_highstatus" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">입학일</th> 
				<td><input name="re_highstartdate" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">졸업일</th> 
				<td><input name="re_highenddate" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>

			 <tr>
				<th width="30%">대학교</th> 
				<td><input name="re_univ" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">졸업여부</th> 
				<td><input name="re_univstatus" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">입학일</th> 
				<td><input name="re_univsdate" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">졸업일</th> 
				<td><input name="re_univedate" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">학점</th> 
				<td><input name="re_univgrade" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">전공</th> 
				<td><input name="re_univmajor" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
	
			 <tr>
				<th width="30%">석사</th> 
				<td><input name="re_master" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">졸업여부</th> 
				<td><input name="re_masterstatus" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">입학일</th> 
				<td><input name="re_mastersdate" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">졸업일</th> 
				<td><input name="re_masteredate" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">학점</th> 
				<td><input name="re_mastergrade" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">전공</th> 
				<td><input name="re_mastermajor" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">임시저장여부</th> 
				<td><input name="re_status" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>
			 <tr>
				<th width="30%">군필</th> 
				<td><input name="re_military" size="20" align="center" onkeydown="enterCheck(this)"></td>
			 </tr>

			 
			  <tr>
				 <td colspan="2" align="center">
					 <input type="button" value="전송" onclick="check()"/>
					 <input type="reset" value="취소" onclick="history.back()"/>
				 </td> 
			  </tr>
		   </table>
	   </form>
	</center>
	</body>
</html>