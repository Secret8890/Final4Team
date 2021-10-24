<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/intro_manage.css" />
    <!-- 폰트어썸 아이콘사용 스크립트 -->
    <script src="https://kit.fontawesome.com/e3bdd8104f.js" crossorigin="anonymous"></script>
</head>

<body>
    <!--자소서 현황을 한번에 관리하는페이지 -->
    <input type="hidden" id="u_seq" value='<sec:authentication property="principal.member.u_seq"/>'/>
    <div class="totalc">
    <div class="menu">
        <div class="title" onclick="f()">PROFILE <span class="fa fa-bars"></span>
            <div class="arrow"></div>
        </div>
        <div class="dropdown">
            <p class="userInfo_p">내 정보 <span class="fas fa-info-circle"></span></p>
            <p class="self_manage_p">자소서 및 이력서 관리 <span class="fas fa-paperclip"></span></p>
            <p class="apply_list_p">입사 지원한 공고 <span class="fas fa-building"></span></p>
            <p class="aichat_list_p">AI 면접 관리 <span class="fas fa-desktop"></span></p>
        </div>
    </div>

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
                        <col width="320px">
                        <col width="100px">
                        <col width="70px">
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
                        <c:forEach items="${resumeList}" var="list" varStatus="status">
                            <tr>
                            <td>${status.count}</td>
                            <td>${list.re_title}</td>
                            <td>
                                <input type="button" name="resume_edit" data-row="${list.re_seq}" onclick="updateResume(this)" value="수정">
                                <input type="button" name="resume_delete" data-row="${list.re_seq}"onclick="deleteResume(this)" value="삭제">
                            </td>
                            <td>2021.10.07</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>

        <input type="button" id="new_resume" onclick="newResume()" value="새 이력서 작성">
                
                <h3 class="resume_title1">내 자기소개서</h3>
                <table class="resume_setting_table">
                    <colgroup>
                        <col width="30px">
                        <col width="320px">
                        <col width="100px">
                        <col width="70px">
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
                        <c:forEach items="${selfList}" var="list" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td>${list.self_name}</td>
                                <td>
                                    <input type="button" name="self_edit" onclick="updateSelf(this)" data-row="${list.self_seq}" value="수정">
                                    <input type="button" name="self_delete" onclick="deleteSelf(this)" data-row="${list.self_seq}" value="삭제">
                                </td>
                                <td>2021.10.07</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            <input type="button" id="new_self" onclick="newSelf()" value="새 자기소개서 작성">    
            
            </div>
        </div>
    </div>
</div>
<script>
    function newResume(){
        $('#load-section').load('/resume/write');
    }
    function newSelf() {
        $('#load-section').load('self/insert')
    }
    function deleteSelf(object) {
        let self_seq = object.getAttribute('data-row');
        $.ajax({
            url : 'self',
            type : 'DELETE',
            data : {self_seq : self_seq},
            success :  (data)=>{
                if(data) {
                    alert('삭제성공');
                    $("#load-section").load('/resume/intro_manage');
                } else {
                    alert('삭제실패');
                }
            }
        })
    }
    function updateResume(object) {
        let re_seq = object.getAttribute('data-row');
        $('#load-section').load('/resume/update?re_seq='+re_seq);
    }
    function updateSelf(object) {
        let self_seq = object.getAttribute('data-row');
        let u_seq = document.querySelector('#u_seq').value;
        $('#load-section').load('self/update?self_seq='+self_seq+'&u_seq='+u_seq);
    }
    function deleteResume(object) {
        let re_seq = object.getAttribute('data-row');
        $.ajax({
            url : '/resume',
            type : 'DELETE',
            data : {re_seq:re_seq},
            success : (data) => {
                let u_seq = document.querySelector('#u_seq').value;
                if(data){
                    alert('삭제성공');
                    $('#load-section').load('/resume/intro_manage?u_seq='+u_seq);
                    } else {
                    alert('삭제실패');
                    $('#load-section').load('/resume/intro_manage'+u_seq);
                }
            }
        })
    }
</script>
<script>
    function f() {
        document.getElementsByClassName('dropdown')[0].classList.toggle('down');
        document.getElementsByClassName('arrow')[0].classList.toggle('gone');
        if (document.getElementsByClassName('dropdown')[0].classList.contains('down')) {
        setTimeout(function() {
            document.getElementsByClassName('dropdown')[0].style.overflow = 'visible'
        }, 500)
        } else {
        document.getElementsByClassName('dropdown')[0].style.overflow = 'hidden'
        }
    }
</script>
<script src="/js/loadNav.js"></script>
</body>
</html>