<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Recruit</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='/css/recruit.css'>
     <!-- 폰트어썸 아이콘사용 스크립트 -->
     <script src="https://kit.fontawesome.com/e3bdd8104f.js" crossorigin="anonymous"></script>
</head>
<body>
        <form>
            <div class="search_basic">
                <div class="simple_container">
                    <div class="show btn_work">직종 선택</div>
                    <div class="show btn_region">지역 선택</div>
                </div>  
                <input class="execute_search" type="submit" value="검색">  
                <div style="background-color: #f3f3f3;"><i class="fas fa-angle-down"></i></div>
            </div>
        </form>
        <form>
            <div class="search_detail">
                <div class="condition_left">
                    <div class="container_left1 show folded btn_work">
                        <div>직종 선택</div>
                    </div>
                    <div class="container_left1 show folded btn_region">
                        <div>지역 선택</div>
                    </div>
                    <div class="container_left folded">
                        <a>경력</a>
                        <label for="a">A</label>
                        <input type="checkbox" name="career" value="a">
                        <label for="b">B</label>
                        <input type="checkbox" name="career" value="b">
                        <label for="c">C</label>
                        <input type="checkbox" name="career" value="c">
                        </div>
                    <div class="container_left folded">
                        <a>학력</a>
                        <label for="a">A</label>
                        <input type="checkbox" name="education" value="a">
                        <label for="b">B</label>
                        <input type="checkbox" name="education" value="b">
                        <label for="c">C</label>
                        <input type="checkbox" name="education" value="c">
                    </div>
                    <div class="container_left folded">
                        <a>근무 형태</a>
                        <label for="a">A</label>
                        <input type="checkbox" name="work_type" value="a">
                        <label for="b">B</label>
                        <input type="checkbox" name="work_type" value="b">
                        <label for="c">C</label>
                        <input type="checkbox" name="work_type" value="c">
                    </div>
                    <div class="container_left folded">
                        <a>복리 후생</a>
                        <label for="a">A</label>
                        <input type="checkbox" name="welfare" value="a">
                        <label for="b">B</label>
                        <input type="checkbox" name="welfare" value="b">
                        <label for="c">C</label>
                        <input type="checkbox" name="welfare" value="c">
                    </div> 
                    <div class="container_left1 show folded btn_major">
                        <div>전공 선택</div>
                    </div>
                </div>
                <div class="condition_right " >
                    <div class="container_right folded">
                        <a>고용 형태</a>
                        <label for="a">A</label>
                        <input type="checkbox" name="employ_type" value="a">
                        <label for="b">B</label>
                        <input type="checkbox" name="employ_type" value="b">
                        <label for="c">C</label>
                        <input type="checkbox" name="employ_type" value="c">
                    </div>
                    <div class="container_right folded">
                        <a>기타 우대 사항</a>
                        <label for="a">A</label>
                        <input type="checkbox" name="preferential" value="a">
                        <label for="b">B</label>
                        <input type="checkbox" name="preferential" value="b">
                        <label for="c">C</label>
                        <input type="checkbox" name="preferential" value="c">
                    </div>
                    <div style="width: 90%; margin-bottom:0px;"class="container_right folded">
                        <a>희망 임금</a>
                        <input type="text" name="salary_min" placeholder="최소">만원 ~
                        <input style="margin-left: 10px;" type="text" name="salary_max" placeholder="최대">만원 
                    </div>
                    <div style="width: 50%;height: 30px;font-size:15px;" class="container_right2 folded">
                        <input style="margin:0px;" type="checkbox" name="applicable" value="">관계없음
                    </div>
                    
                    <input class="execute_search1" type="submit" value="검색">
                </div>
                <div class="fold"><i class="fas fa-chevron-up"></i></div>
            </div>
        </form>
        

        <div class="search_head">검색 결과</div> 
        <div class="recommend">
            <div class="recom_content">
                <!--
                    <c:forEach items="${bbs}" var="list">
                    <div class="card card-data incruit_card">
                        <div class="card-header">
                            <h3>${list.co_title}</h3>
                        </div>
                        <div class="card-body">
                            <c:if test="${ list.co_location_name.length() < 30 }">
                                <span>${list.co_location_name}</span><br /></c:if>
                            <c:if test="${ list.co_location_name.length() > 30 }">
                                <span>${list.co_location_name.substring(0,10)}...</span><br /></c:if>
                            <span>${list.co_career}</span><br />
                            <h3>${list.co_name}</h3>
                        </div>
                        <div class="card-footer bg-white">마감일 : ${list.co_end_date}</div>
                    </div>
                </c:forEach>
                -->
            </div>
        </div>
        <div class="result hidden">
            <ul class="result_content">

            </ul>
        </div>
        <div class="incruit_modal_out incruit_modal m_worktype">
            <!-- Modal content -->
            <div class="modal_content">
                <div class="incruit_modal_header">
                    <h2>직종 선택</h2>
                </div>
                <div class="incruit_modal_body">
                    <p>모달 내용</p>
                </div>
                <div class="incruit_modal_footer">
                    <h3>직종 제목</h3>
                </div>
            </div>
        </div>

        <div class="incruit_modal_out incruit_modal m_region">
            <!-- Modal content -->
            <div class="modal_content">
                <div class="incruit_modal_header">
                    <h2>지역 선택</h2>
                </div>
                <div class="incruit_modal_body">
                    <p>모달 내용</p>
                </div>
                <div class="incruit_modal_footer">
                    <h3>지역 선택</h3>
                </div>
            </div>
        </div>
        <div class="incruit_modal_out incruit_modal m_major">
            <!-- Modal content -->
            <div class="modal_content">
                <div class="modal_header">
                    <h2>전공 선택</h2>
                </div>
                <div class="incruit_modal_body">
                    <p>모달 내용</p>
                </div>
                <div class="modal_footer">
                    <h3>전공 선택</h3>
                </div>
            </div>
        </div>
    <script src='/js/recruit.js'></script>    
</body>
<script type="text/javascript" language="javascript"
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script language="javascript">
    var page=1;

    $(function(){
        getList(page);
        page++;
    })

    $(window).scroll(()=>{
        if($(window).scrollTop()>=$(document).height()-$(window).height()){
            getList(page);
            page++;
        }
    })

    function getList(page){
        $.ajax({
            url:"/incruit/getList",
            type:"POST",
            data:{page:page},
            dataType:"json",
            success: function(json){
                tableDisplay(json.board, page);
            }
        })
    }

    function tableDisplay(board, page){
        var html="";
        if(page==1){
            $.each(board, function(i){
                html+="<div class='card card-data incruit_card'>";
                html+="<div class='card-header'>";
                html+="<h3>"+board[i].co_title+"</h3>";
                html+="</div>";
                html+="<div class='card-body'>";
                if(board[i].co_location_name.length<30){
                    html+="<span>"+board[i].co_location_name+"</span><br />";
                }else{
                    html+="<span>"+board[i].co_location_name.substring(0,10)+"...</span><br />";
                }
                html+="<span>"+board[i].co_career+"</span><br />";
                html+="<h3>"+board[i].co_name+"</h3>";
                html+="</div>";
                html+="<div class='card-footer bg-white'>마감일 : "+board[i].co_end_date+"</div>";
                html+="</div>";
            })
            $(".recom_content").html(list);
        }else{
            $.each(board, function(i){
                html+="<div class='card card-data incruit_card'>";
                html+="<div class='card-header'>";
                html+="<h3>"+board[i].co_title+"</h3>";
                html+="</div>";
                html+="<div class='card-body'>";
                if(board[i].co_location_name.length<30){
                    html+="<span>"+board[i].co_location_name+"</span><br />";
                }else{
                    html+="<span>"+board[i].co_location_name.substring(0,10)+"...</span><br />";
                }
                html+="<span>"+board[i].co_career+"</span><br />";
                html+="<h3>"+board[i].co_name+"</h3>";
                html+="</div>";
                html+="<div class='card-footer bg-white'>마감일 : "+board[i].co_end_date+"</div>";
                html+="</div>";
            })
            $(".recom_content").append(html);
        }
    }
</script>
</html>