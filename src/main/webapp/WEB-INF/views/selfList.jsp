<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html; charset=utf-8" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>자기소개서 List페이지</title>
        </head>

        <div class="card-body">
			<table class="table table-dark">
			    <thead>
                    <h2>작성중인 자기소개서(회사별)</h2>
			        <tr align="center">
						<th>자기소개서(self_seq)</th>
			            <th>회사(co_seq)</th>
                        <th>버튼</th>
			            
			        </tr>
			    </thead>
			    <tbody>
			    	<c:forEach items="${list}" var="list">
						<tr align="center">
							<td>${list.self_seq}</td>
				 			<td>${list.co_seq}</td>
                            <td>
                                <button onclick="location.href='selectQA.do?self_seq=${list.self_seq}'">이동하기</button>
								<button onclick="location.href='deleteSelf.do?self_seq=${list.self_seq}'">삭제하기</button>
                            </td>
						</tr>
                        
					</c:forEach>
					<a href="insert.do">자기소개서 생성</a>
	            </tbody>
	        </table>
	    </div>

        </html>