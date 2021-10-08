<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/intro_manage.css" />
</head>

<body>
    <!--자소서 현황을 한번에 관리하는페이지 -->
    <div class="header">
        <div class="TOP">
            <a href="../"><img src="/img/로그1.png"></a>
    </div>
    <div class="setting_main">
        <nav>
            <div class="side_nav">
                <h3 class="side_nav_text">PROFILE</h3>
                <a href="#">내 정보</a>
                <a href="#">자기소개서 관리</a>
                <a href="#">이력서 관리</a>
                <a class="a1" href="#">AI 면접 관리</a>
            </div>
        </nav>

        <div class="manage_main">
            <h1 class="intro_manage_text">이력서/자기소개서 관리</h1>
            <div class="resume_caution">   
                <p class="resume_caution_img"><img src="/img/list.png"></p>
                <div class="resume_caution_txt">
                    <li> 등록한 이력서 및 자기소개서를 조회하고 관리할 수 있습니다.<br>
                    <li> 이력서 및 자기소개서 버튼을 통해 새 이력서 및 자기소개서를 작성, 관리할 수 있습니다.<br>
                    <li> 이력서 및 자기소개서 선택을 통해 기본 이력서 및 자기소개서로 설정할 수 있습니다.<br>
                </div>
            </div>

            <div class="resume_container">
                <h3 class="resume_title">내 이력서</h3>
                <table class="resume_setting_table">
                    <colgroup>
                        <col width="30px">
                        <col width="370px">
                        <col width="100px">
                        <col width="20px">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">이력서 제목</th>
                            <th scope="col">관리</th>
                            <th scope="col">최종수정일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>내 자기소개서 제목</td>
                            <td>
                                <input type="button" value="수정">
                                <input type="button" value="삭제">
                            </td>
                            <td>2021.10.07</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>내 자기소개서 제목</td>
                            <td>
                                <input type="button" value="수정">
                                <input type="button" value="삭제">
                            </td>
                            <td>2021.10.07</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>내 자기소개서 제목</td>
                            <td>
                                <input type="button" value="수정">
                                <input type="button" value="삭제">
                            </td>
                            <td>2021.10.07</td>
                        </tr>
                    </tbody>
                </table>

        <input type="button" value="새 이력서 작성">
                
                <h3 class="resume_title1">내 자기소개서</h3>
                <table class="resume_setting_table">
                    <colgroup>
                        <col width="30px">
                        <col width="370px">
                        <col width="100px">
                        <col width="20px">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">자기소개서 제목</th>
                            <th scope="col">관리</th>
                            <th scope="col">최종수정일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>내 자기소개서 제목</td>
                            <td>
                                <input type="button" value="수정">
                                <input type="button" value="삭제">
                            </td>
                            <td>2021.10.07</td>
                        </tr>
                    </tbody>
                </table>

            <input type="button" value="새 자기소개서 작성">    
                
            </div>
        </div>
    </div>

</body>
</html>