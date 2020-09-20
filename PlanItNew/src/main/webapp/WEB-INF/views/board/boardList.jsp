<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/sessionCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Montserrat+Alternates:wght@600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<style>

/*버튼 디자인 */
 .button-wrapper {
        display: inline-block;
        margin: 20px 5px;
        padding: 40px;
    }
    .dark-button,
    .dark-button-2 {
        background: #333;
    }
    .button {
        background: #fff;
        border: none;
        padding: 2px;
        cursor: pointer;
        display: block;
        position: relative;
        overflow: hidden;
        transition: all .35s ease-in-out .35s;
        margin: 0 auto;
        width: 70px;
        text-align: center;
    }
    .dark-button .button,
    .dark-button .button span {
        background: #36B4C7;
        color: #fff;
    }
    .dark-button .button:after,
    .dark-button .button:before,
    .dark-button .button:hover span {
        background: #fff;
        color: #444;
    } 
    .dark-button-2 .button,
    .dark-button-2 .button span {
        background: #333;
        color: #fff;
    }
    .dark-button-2 .button:after,
    .dark-button-2 .button:before,
    .dark-button-2 .button:hover span {
        background: #fff;
        color: #444;
    } 
    .span {
        display: block;
        padding: 5px 10px;
        background: #fff;
        z-index: 100;
        position: relative;
        transition: all .35s ease-in-out .35s;
    }
    .button:hover span {
        background: #36B4C7;
        color: #fff;
        transition: all .35s ease-in-out .35s;
    }
    .button:after {
        bottom: -100%;
        right: -100%;
        content: "";
        width: 100%;
        height: 100%;
        position: absolute;
        background: #36B4C7;
        transition: all .35s ease-in-out .5s;
    }
    .button:hover:after {
        right: 0;
        bottom: 0;
        transition: all ease-in-out .35s;
    }
    .button:before {
        top: -100%;
        left: -100%;
        content: "";
        width: 100%;
        height: 100%;
        position: absolute;
        background: #36B4C7;
        transition: all .35s ease-in-out .5s;
    }
    .button:hover:before {
        left: 0;
        top: 0;
        transition: all ease-in-out .35s;
    }









html {
	height: 100%;
}

/*로그인 폼(카드) 위치*/
.boardListcontainer {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
	width: 500px !important;
	height: 700px;
	background-color: #F6F6F6;
	

}

table {
	width: 100%;
	border-collapse: collapse;
}

#boardlistTable{
	
}

tr {
	border-bottom: 1px solid #eee;
}

/* #boardListProfileTd{
 border-bottom: 0px;
}
 */
hr {
	width: 85%;
	border: 0;
	border-top: 1px solid #eee;
}

a {
	text-decoration: none;
	color: #1ABC9C;
}

img {
	border-radius: 70%;
	width : 30px; 
height : 30px;
}

#loginFormLogo {
	margin-top: 10px;
	margin-bottom: 0;
	font-family: 'Montserrat Alternates', sans-serif; `
	color: #1ABC9C;
	float: left;
}

#ptext{
	float: left;
}

#card-title {
	color: #1ABC9C;
	margin-top: 5px;
	margin-bottom: -10px;
}

#card-body {
	padding-top: 2px;
	height: 400px;
}

#mainBoardList {
	height: 350px;
}

form>span>p {
	font-size: 10px;
}

#boardlistTable>tbody>tr>td {
	border: 0px;
}

/* 게시글 검색 버튼  */
#boardListSearchBtn {
	margin-top: 5px;
	border: 1px solid lightgrey;
	border-radius: 20%;
	background-color: white;
	border: none;
	border-radius: 20%;
	background-color: white;
	color: grey;
}

/*게시글 검색 input  */
#boardListSearchInput {
	width: 80%;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 1px solid lightgrey;
}

/*게시글 작성자 이름 */
#boardListName {
	color: grey;
	font-size: 9px;
}

#boardListTitleTd {
	text-align: left;
	height: 70px;

}

.boardListDate{
font-size: 9px;
}

#boardListTitle {
	font-size: 14px;
	color: grey;
	height: 70px;
			
	
	
}

#searchResultMsgDiv {
	margin-top: 80px;
	margin-bottom: 150px;
	font-weight: bolder;
}

.boardListPagingDiv {
	margin-top: 6px;
	paddig-top: 5px;
	margin-bottom: 6px;
}

#boardListProfileTd, .number{
	width : 50px;
}




</style>
</head>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<body>


	<div class="boardListcontainer"
		style="width: 20rem; border-radius: 20px;">
		<!--1번  시작-->

		<div class="card-title" id="card-title" style="text-align: center;">
			<h3 id="loginFormLogo" class="card-title text-center">community</h3><br><br>
			<p id="ptext" align="left">다양한 여행 정보를 확인해 보세요.</p>
			
			<div class="searchBox">
				<form>
					<select name="searchType" style="display: none">
						<option value="both">ID + NAME</option>
					</select> <input type="text" name="keyword" id="boardListSearchInput">
					<button type="submit" value="검색" id="boardListSearchBtn">
						<i class="fa fa-search" aria-hidden="true"></i>
					</button>
				</form>
			</div>
		</div>


		<div class="card-body" id="card-body" style="text-align: center;">
			<!--2번  시작-->

			<c:if test="${not empty listView}">

				<br>
				
				<table id="boardlistTable">
					<c:if test="${not empty listView.boardList }">
						<c:url value="${initParam['memberUploadPath']}" var="imagePath" />
						
						<tr>
							<td colspan="3">제목</td>
							<td>작성일</td>
							<td>좋아요</td>
						</tr>

					
				
						
						
						<c:forEach items="${listView.boardList}" var="board">

							<tr class="boardUser">
								<td id="boardListProfileTd"><img
									src="${imagePath}/${board.uphoto}" >
								</td>
								
								<td rowspan="2" class="number"></td>

								<td rowspan="2" id="boardListTitleTd"><a
									href="${board.bidx}"> <span id="boardListTitle">
											${board.btitle}</span></a></td>
											
								<td rowspan="2" class="boardListDate">
									${board.bregdate}
								</td>
								
								<td id="joinlike">
								
								</td>
								
							</tr>

							<tr id="boardListName" >
								<td>${board.uname}
							</tr>
							

						</c:forEach>
						
						
						
						
						 
						
					
				
						<script>
							function reorder() {
								//ddidx 재배치
								$(".boardUser").each(function(i, box) {
									$(box).find(".number").html(i + 1);

								});
							}

							reorder();
						</script>

					</c:if>
				</table>



				<c:if test="${empty listView.boardList }">
					<div id="searchResultMsgDiv">
						<span id="searchResultMsg">조회된 글이 없습니다.</span>
					</div>
				</c:if>
				
				<c:if test="${listView.pageTotalCount > 0}">

            <div class="paging">
               <c:forEach begin="1" end="${listView.pageTotalCount}" var="i">

                  <a
                     class="paging_num ${i == listView.currentPageNumber ? 'now_page' : ''}"
                     href="boardList?page=${i}">${i}</a>
               </c:forEach>
               
               <div class="light-button button-wrapper">
    <div class="button">
        <span class="span" font-size="15px">
            글쓰기
        </span>
    </div>  
</div>
            </div>

         </c:if>

			</c:if>



			

		</div>
		<!--2번  끝-->

	</div>
	<!--1번  끝-->



</body>

</html>

<script>
function likeAllSelect() {
	$.ajax({
		
		url: 'http://localhost:8080/it/board/boardList',
		type: "get",
	
		success:
		function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
			var html = '';
			for(var i; i<data.length; i++){
				
				html += '<input type="text" name="bidx" id ="test"value="${board.bidx}" readonly>';
				html += '<input type="text" name="uidx" value="${loginInfo.uidx}" readonly>';
				html += '<label for="btnLike" onclick="checkLike();">';
				html += '<img id="like_img"alt="식당" class="dtypeIcon" src="/it/resources/images/unlike.png" width="30px" height="30px"></label>';
				html += '<input type="checkbox" id="btnLike" >';
				html += '<div id="like_result" style="display:inline-block;">${like.uidx }</div>';
				
				$("#joinlike").html(html);
			}
			
			
		}
		});
		

}




function likeSelect() {
	$.ajax({
		url: 'http://localhost:8080/it/board/boardView/'+${loginInfo.uidx}+'/'+${listView.boardList[i].bidx},
		type: "get",

		success:
		function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
			console.log(data);
			if(data == 1){
				 $('img#like_img').attr('src', '/it/resources/images/like.png');
					$('#btnLike').prop('checked', true);

			}else if(data == 0){
				 $('img#like_img').attr('src', '/it/resources/images/unlike.png');		
					$('#btnLike').prop('checked', false);

			}
		// data중 put한 것의 이름 like
		}
		});

}







function checkLike(){


if(!$('#btnLike').prop('checked')){
	
	$.ajax({
	url: 'http://localhost:8080/it/board/boardView',
	type: "POST",
	data: {uidx:i,'${loginInfo.uidx}', 
		   bidx: '${listView.boardList[i].bidx}'},
	success:
		
	function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
		likeAllSelect();
		likeSelect();
	}
		   ,
	error:
	function (request, status, error){
	alert("ajax실패")
	}
	});
	
	}else if($('#btnLike').prop('checked')){
		
		console.log("delete");
		$.ajax({
			url: 'http://localhost:8080/it/board/boardView/'+${loginInfo.uidx}+'/'+${listView.boardList[i].bidx},
			type: "delete",
			/* data: {uidx:'${loginInfo.uidx}', 
				   bidx: '${viewBoard.bidx}'}, */
			success:
			function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
			// $('img#like_img').attr('src', '/it/resources/images/unlike.png');// data중 put한 것의 이름 like
				likeAllSelect();
				likeSelect();
			}
				   ,
			error:
			function (request, status, error){
			alert("ajax실패")
			}
			});
	}	
		
	
	
}
	
$(document).ready(function(){
	
	likeAllSelect();
	likeSelect();
	
});
 








	/* 순서 조정 */

	function boardDel(bidx) {
		if (confirm('선택하신 회원 정보를 삭제하시겠습니까?')) {
			location.href = 'boardDelete?bidx=' + bidx;
		}

	}

	function boardList() {
		location.href = 'boardList';
	}
	
	
	$(window).on("scroll", function() {
		var scrollHeight = $(document).height();
		var scrollPosition = $(window).height() + $(window).scrollTop();		

		$("#scrollHeight").text(scrollHeight);
		$("#scrollPosition").text(scrollPosition);
		$("#bottom").text(scrollHeight - scrollPosition);

		if (scrollPosition > scrollHeight - 500) {			
			//todo
			$("body").append('<div id="content"></div>');
		}
	});
	
	
	
	
</script>


