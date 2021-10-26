var page=1;
    boardDisplay(page);
    function loadWriteForm() {
        $('#load-section').load('/review/insert');
        $('#main-section').hide();
    }
    function boardDisplay(pageNum){
        page=pageNum;
        $.ajax({
            type:"GET",
            url:"/review/listGet?pageNum="+pageNum,
            dataType:"json",
            success:function(json){
                tableDisplay(json.board);
                pageDisplay(json.pager);
            }
        })
    }
	function tableDisplay(board){
        u_seq = document.querySelector('#u_seq').value;
        var html="";
        html+="<table id='table__table'>";
        html+="<tr>";
        html+="<th>리뷰번호</th>";
        html+="<th color='gray'>제목</th>";
        //html+="<th color='gray'>유저번호</th>";
        html+="<th color='gray'>회사이름</th>";
        html+="<th color='gray'>날짜</th>";
        html+="<th color='gray'>조회수</th>";
        html+="<th color='gray'>삭제</th>";
        html+="</tr>";
        $.each(board, function(i){
            html+="<tr>";
            html+="<TD>"+board[i].review_seq+"</TD>";
            html+="<TD><a href='javascript:void(0)' onclick='review_detail(this)' data-num="+board[i].review_seq+">"+board[i].review_title+"</TD>";
                //html+="<TD>"+board[i].u_seq+"</TD>";
            html+="<TD>"+board[i].company_name+"</TD>";
            html+="<TD>"+board[i].review_date+"</TD>";
            html+="<TD>"+board[i].pass_hit+"</TD>";
            if(board[i].u_seq == u_seq) {
            html+="<TD data-num="+board[i].review_seq+" onclick='deleteClick(this)'>삭제</TD>";
            }
            html+="</tr>";
        });
        html+="</table>";
        $("#restBoardListDiv").html(html);
    }
    function pageDisplay(pager){
        var html="";
        if(pager.startPage>pager.blockSize){
            html+="<a href='javascript:boardDisplay(1);'>[처음]</a>";
            html+="<a href='javascript:boardDisplay("+pager.prevPage+");'>[이전]</a>";
        }else{
            html+="[처음][이전]";
        }

        for(var i=pager.startPage; i<=pager.endPage; i++){
            if(pager.pageNum!=i){
                html+="<a href='javascript:boardDisplay("+i+");'>["+i+"]</a>";
            }else{
                html+="["+i+"]";
            }
        }

        if(pager.endPage!=pager.totalPage){
            html+="<a href='javascript:boardDisplay("+pager.nextPage+");'>[다음]</a>";
            html+="<a href='javascript:boardDisplay("+pager.totalPage+");'>[마지막]</a>";
        }else{
            html+="[다음][마지막]";
        }

        $("#pageNumDiv").html(html);
    }
    function review_detail(obj){
        let num = $(obj).attr("data-num");
        $('#main-section').load('/review/detail?review_seq='+num);
    }
    function review_update(obj){
        let num = $(obj).attr("data-num");
        $('#main-section').load('/review/update?review_seq='+num);
    }
    function deleteClick(obj){
        let num=$(obj).attr("data-num");
        console.log(num);
        if(confirm("삭제하시겠습니까?")){
            $.ajax({
                url:"/review",
                type:"DELETE",
                data:{
                    review_seq: num // 키:벨류 형식으로 해주기위해 컨트롤러에서 형변환,,,
                },
                success:function(data){
                    alert(data);
                    window.location.href="/review/list";
                },error:function(){
                    alert('에러');
                }
            })
        }
    }