<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>자기소개서 List페이지</title>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        </head>

        <div class="card-body">
			<table class="table table-dark">
			    <tbody>
                    <script>
                        var num =0;
                    </script>
                    <c:forEach items="${list}" var="list">
                        <script>
                            num=num+1;
                            document.write('' + num + '번 문항<br>');
                            
                        </script>
                        
						<tr align="center">
                        <!--
                            <h2>QA_SEQ = ${list.qa_seq}</h2>
                            
                            Q :<br>
                            <input type="text" value='${list.qa_q}' name=""><br>
                            A :<br>
                            <input type="text" value='${list.qa_a}' name=""><br>
                            <button> 저장하기 </button> <br><br><br>-->
                            
                            <form action="/update.do" method="POST">
                                <!--<h2>QA_SEQ = ${list.qa_seq}</h2>-->
                                <input type="hidden" name="qa_seq" value='${list.qa_seq} ' style="width:1000px; height:100px;" /> <br/>
                                Q :<br>
                                <input type="text" name="qa_q" placeholder="입력해주세요" value='${list.qa_q}' style="width:1000px; height:100px;"/> <br/>
                                A :<br>
                                <input type="text" name="qa_a" placeholder="입력해주세요" value='${list.qa_a}'style="width:1000px; height:100px;" /> <br/>
                                <input type="hidden" name="self_seq" value='${list.self_seq}' />
                                <button>저장하기</button>
                                <button onclick="location.href='deleteQA.do?qa_seq=${list.qa_seq}'">삭제하기</button>
                                 <br><br><br> 
                            </form>
						</tr>
                        
					</c:forEach>
                    <div id="qa_area"> </div>
                        <input type="text" id="self_seq" name="self_seq" placeholder="SELF_SEQ(자기소개서번호)" value='${seq}'/> <br/>
                        <button id="addQA">문항추가</button>                        
                    <script>
                        const qa = document.querySelector('#addQA');
                        qa.addEventListener('click',add_qa);
                        function add_qa(){
                        $.ajax({
                            url : '/rest/insert',
                            type : 'POST',
                            data : { self_seq : $('#self_seq').val()},
                            success : (seq_data) => {
                                // var newForm = document.createElement('form');
                                // newForm.method = 'POST';
                                // newForm.action = '/update.do';
                                // var inputSeq = document.createElement('input');
                                // inputSeq.setAttribute('name',"qa_seq");
                                // inputSeq.setAttribute('value',seq_data);
                                // inputSeq.setAttribute('type','hidden');
                                // newForm.appendChild(inputSeq);
                                // var span1 = document.createElement('span');
                                // span1.innerText = 'Q : ';
                                // var input1 = document.createElement('input');
                                // input1.setAttribute("type","text");
                                // input1.setAttribute("name","qa_q");
                                // input1.style.width = "1000px";
                                // input1.style.height = "100px";
                                // input1.setAttribute("placeholder","입력해주세요.");
                                // var span2 = document.createElement('span');
                                // span2.innerText = 'A : ';
                                // var input2 = document.createElement('input');
                                // input2.setAttribute("type","text");
                                // input2.setAttribute("name","qa_a");
                                // input2.style.width = "1000px";
                                // input2.style.height = "100px";
                                // input2.setAttribute("placeholder","입력해주세요.");
                                // document.body.appendChild(newForm);
                                // newForm.appendChild(span1);
                                // newForm.appendChild(input1);
                                // newForm.appendChild(document.createElement('br'));
                                // newForm.appendChild(span2);
                                // newForm.appendChild(input2);
                                // var save_button = document.createElement('button');
                                // save_button.innerText = "저장하기";
                                // var cancel_button = document.createElement('button');
                                // cancel_button.innerText = "삭제하기";
                                // const location_href = "location.href='deleteQA.do?qa_seq="+seq_data+"'";
                                // console.log(location_href)
                                // cancel_button.setAttribute('onclick',location_href);
                                // newForm.appendChild(save_button);
                                // newForm.appendChild(cancel_button);
                                location.href = "selectQA.do?self_seq=" + $('#self_seq').val();
                            }
                        });
                        }
                    </script>
	            </tbody>
	        </table>
	    </div>
        <body>            
            <h1>자기소개서 List페이지</h1>
            <hr />
        </body>

        </html>