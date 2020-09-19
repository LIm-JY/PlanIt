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

/* input[type="checkbox"] {
       display:none;
}

label {
     color:blue;
     text-decoration:underline;
     margin-top:10px;
     cursor:pointer;
     display:inline-block;
}

label:after {
     content:"more";  
}

input:checked ~ label:after {
     content:"less";  
}

.inner {
     max-height:100px;
     overflow:hidden;
     transition:all .3s ease;
     width:100%;
}

input:checked + .inner {
     max-height:500px;
}
 */










html {
	height: 100%;
}

/*로그인 폼(카드) 위치*/
.boardListcontainer {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
	width: 500px !important;
	height: 600px;
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
	font-size: 20px;
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
			<h2 id="loginFormLogo" class="card-title text-center">플랜차트</h2>
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
				
											<div class="outer">
						<input type="checkbox" id="readmore" />
						<div class="inner">
				<table id="boardlistTable">
					<c:if test="${not empty listView.boardList }">
						<c:url value="${initParam['memberUploadPath']}" var="imagePath" />
						
						

					
				
						
						
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


						</div>
<label for="readmore">Read </label>
	</div>


				<c:if test="${empty listView.boardList }">
					<div id="searchResultMsgDiv">
						<span id="searchResultMsg">조회된 글이 없습니다.</span>
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


