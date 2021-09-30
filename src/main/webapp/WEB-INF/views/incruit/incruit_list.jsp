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
</head>
<body>
    
        <form>
            <div class="search_basic">
                <div class="simple_container">
                    <div class="show btn_work">직종 선택</div>
                    <div class="show btn_region">지역 선택</div>
                </div>  
                <input class="execute_search" type="submit" style="width:15%" value="검색">  
                <div class="expand" style="padding: 25px;background-color:aquamarine">펼치기</div>
            </div>
        </form>
        <form>
            <div class="search_detail ">
                <div class="condition_left" >
                    <div class="container_left show folded btn_work">
                        <div>직종 선택</div>
                    </div>
                    <div class="container_left show folded btn_region">
                        <div>지역 선택</div>
                    </div>
                    <div class="container_left folded">
                        <a>경　 　력</a>
                        <label for="a">A</label>
                        <input type="checkbox" name="career" value="a">
                        <label for="b">B</label>
                        <input type="checkbox" name="career" value="b">
                        <label for="c">C</label>
                        <input type="checkbox" name="career" value="c">
                    </div>
                    <div class="container_left folded">
                        <a>학　 　력</a>
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
                    <div class="container_left show folded btn_major">
                        <div>전공 선택</div>
                    </div>
                </div>
                <div class="condition_right " >
                    <div style="width: 60%;margin-bottom: 80px" class="container_right folded">
                        <a>고용 　　 형태</a>
                        <label for="a">A</label>
                        <input type="checkbox" name="employ_type" value="a">
                        <label for="b">B</label>
                        <input type="checkbox" name="employ_type" value="b">
                        <label for="c">C</label>
                        <input type="checkbox" name="employ_type" value="c">
                    </div>
                    <div style="width: 60%;margin-bottom: 80px" class="container_right folded">
                        <a>기타 우대 사항</a>
                        <label for="a">A</label>
                        <input type="checkbox" name="preferential" value="a">
                        <label for="b">B</label>
                        <input type="checkbox" name="preferential" value="b">
                        <label for="c">C</label>
                        <input type="checkbox" name="preferential" value="c">
                    </div>
                    <div style="width: 90%;margin-bottom: 10px"class="container_right folded">
                        <a>희망 임금</a>
                        <input type="text" name="salary_min" placeholder="최소">-
                        <input type="text" name="salary_max" placeholder="최대">
                    </div>
                    <div style="width: 40%;height: 30px;font-size:15px" class="container_right folded">
                        <a>해당 여부</a>
                        <label for="a">A</label>
                        <input type="checkbox" name="applicable" value="a">
                        <label for="b">B</label>
                        <input type="checkbox" name="applicable" value="b">
                    </div>
                    <div class="fold" style="padding: 25px;background-color:aquamarine;margin-right: auto">접기</div>
                    <input class="execute_search" style="align-self:flex-end;padding: 25px;margin-right:100px;font-size:25px" type="submit" value="검색">
                </div>
            </div>
        </form>
        <div class="recommend">
            <div class="recom_content">
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
</html>