<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>success_index</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='/css/recruit.css'>


</head>
<body>
    <div class="header">
        <div class="TOP">
            <a href="../"><img src="/img/로그1.png"></a>
        </div>
        <div class="recommend">
            <div class="recom_content">
                <div>추천 공고</div>
                <div>추천 공고</div>
                <div>추천 공고</div>
                <div>추천 공고</div>
            </div>
        </div>
        <form>
            <div class="search">
                <div class="condition_left">
                    <div class="container_left show">
                        <div>직종 선택</div>
                    </div>
                    <div class="container_left show">
                        <div>지역 선택</div>
                    </div>
                    <div class="container_left">
                        <a>경　 　력</a>
                        <label for="a">A</label>
                        <input type="radio" name="career" value="a">
                        <label for="b">B</label>
                        <input type="radio" name="career" value="b">
                        <label for="c">C</label>
                        <input type="radio" name="career" value="c">
                    </div>
                    <div class="container_left">
                        <a>학　 　력</a>
                        <label for="a">A</label>
                        <input type="radio" name="education" value="a">
                        <label for="b">B</label>
                        <input type="radio" name="education" value="b">
                        <label for="c">C</label>
                        <input type="radio" name="education" value="c">
                    </div>
                    <div class="container_left">
                        <a>근무 형태</a>
                        <label for="a">A</label>
                        <input type="radio" name="work_type" value="a">
                        <label for="b">B</label>
                        <input type="radio" name="work_type" value="b">
                        <label for="c">C</label>
                        <input type="radio" name="work_type" value="c">
                    </div>
                    <div class="container_left">
                        <a>복리 후생</a>
                        <label for="a">A</label>
                        <input type="radio" name="welfare" value="a">
                        <label for="b">B</label>
                        <input type="radio" name="welfare" value="b">
                        <label for="c">C</label>
                        <input type="radio" name="welfare" value="c">
                    </div>
                    <div class="container_left show">
                        <div>전공 선택</div>
                    </div>
                </div>
                <div class="condition_right" >
                    <div style="width: 60%;margin-bottom: 80px" class="container_right">
                        <a>고용 　　 형태</a>
                        <label for="a">A</label>
                        <input type="radio" name="employ_type" value="a">
                        <label for="b">B</label>
                        <input type="radio" name="employ_type" value="b">
                        <label for="c">C</label>
                        <input type="radio" name="employ_type" value="c">
                    </div>
                    <div style="width: 60%;margin-bottom: 80px" class="container_right">
                        <a>기타 우대 사항</a>
                        <label for="a">A</label>
                        <input type="radio" name="preferential" value="a">
                        <label for="b">B</label>
                        <input type="radio" name="preferential" value="b">
                        <label for="c">C</label>
                        <input type="radio" name="preferential" value="c">
                    </div>
                    <div style="width: 90%;margin-bottom: 10px"class="container_right">
                        <a>희망 임금</a>
                        <input type="text" name="salary_min" placeholder="최소">-
                        <input type="text" name="salary_max" placeholder="최대">
                    </div>
                    <div style="width: 40%;height: 30px;font-size:15px" class="container_right">
                        <a>해당 여부</a>
                        <label for="a">A</label>
                        <input type="radio" name="applicable" value="a">
                        <label for="b">B</label>
                        <input type="radio" name="applicable" value="b">
                    </div>
                    <input style="align-self:flex-end;padding: 25px;margin-right:100px;font-size:25px" type="submit" value="검색">
                </div>
            </div>
        </form>
        <div class="result">
            <ul class="result_content">
                <li>공고 검색결과</li>
                <li>공고 검색결과</li>
                <li>공고 검색결과</li>
                <li>공고 검색결과</li>
            </ul>
        </div>
        <div class="footer">
            <div>FOOTER</div>
        </div>
        <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="modal_content">
                <div class="modal_header">
                    <span class="close">&times;</span>
                    <h2>모달 제목</h2>
                </div>
                <div class="modal_body">
                    <p>모달 내용</p>
                </div>
                <div class="modal_footer">
                    <h3>모달 footer</h3>
                </div>
            </div>
        </div>
    <script src='/js/recruit.js'></script>    
</body>
</html>