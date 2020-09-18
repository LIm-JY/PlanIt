<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/sessionCheck.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssMainFooter.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Montserrat+Alternates:wght@600&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<style>
html {
	height: 100%;
	scroll-behavior: smooth;
}

body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding-top: 80px;
	padding-bottom: 40px;
	font-family: "Nanum Gothic", arial, helvetica, sans-serif;
	background-repeat: no-repeat;
	/* 선형 그래디언트 + 두가지색상 이어줌 */
	/* background:linear-gradient(to bottom right, #F5F5F5, #DCDCDC); */
}

table {
	width: 100%;
	border-collapse: collapse;
}

tr{
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
}

#loginFormLogo {
	margin-top: 10px;
	margin-bottom: 0;
	font-family: 'Montserrat Alternates', sans-serif; `
	color: #1ABC9C;
}

/*로그인 폼(카드) 위치*/
.card {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
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
	margin-top: 5px; border : 1px solid lightgrey;
	border-radius: 20%;
	background-color: white;
	border: none;
	border-radius : 20%;  
	background-color :white;
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

#boardListTitleTd{
	text-align: left;
}

#boardListTitle{
	font-size: 14px;
	color: grey;
}

#searchResultMsgDiv{
	margin-top : 80px;
	margin-bottom : 150px;
	font-weight: bolder;
 }
 
.boardListPagingDiv{
	margin-top: 6px;
	paddig-top: 5px;
	margin-bottom: 6px; 

}





/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: absolute; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 800px; /* Full width */
	height: 500px; /* Full heigh
    
    t */
	overflow: auto; /* Enable scroll if needed */
	/*background-color: rgb(0,0,0);  Fallback color */
	background-color: white; /*Black w/ opacity,0.4 */
	margin: auto;
}
/* Modal Content/Box */
.modal-content {
	background-color: white;
	margin: 10% auto; /* 15% from the top and centered */
	padding: 20px;
	/*border: 1px solid lightsteelblue;*/
	width: 70%; /* Could be more or less, depending on screen size */
	height: 60%;
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
<div class="card align-middle"
		style="width: 20rem; border-radius: 20px;">
		
			<div class="card-title" id="card-title" style = "text-align: center;">
			<h2 id="loginFormLogo" class="card-title text-center">Plan It!</h2>
			<span style = "color : grey;">Community</span>
			</div>
			

<div class="card-body" id="card-body" style="text-align: center;">
		<form method="post" enctype="multipart/form-data">
			<table id="boardlistTable">
				<tr>
					<td></td>
					<td><input type="hidden" id="uidx" name="uidx"
						value="${loginInfo.uidx }" readonly></td>
				</tr>
				<tr>
					<td><label for="uname">이름</label></td>
					<td><input type="text" id="uname" name="uname"
						value="${loginInfo.uname }" readonly></td>
				</tr>
				<tr>
					<td><label for="btitle">제목</label></td>
					<td><input type="text" id="btitle" name="btitle" required></td>
				</tr>

				<tr>
					<td><label for="pidx">일정</label></td>
					<td><a id="myBtn"> <input type="text" name="pidx"
							id="pidx" class="pidx"> <span class="mptitle"></span></a></td>

				</tr>
				<tr>
					<td><label for="bmsg">메시지</label></td>
					<td><textarea name="bmsg" id="bmsg" rows="10" cols="20"
							required></textarea></td>
				</tr>



				<tr>
					<td><label for="bphoto1">사진</label></td>
					<td><input type="file" name="bphoto1" id="bphoto1"></td>

				</tr>
				<tr>
					<td><label for="bphoto2">사진</label></td>
					<td><input type="file" name="bphoto2" id="bphoto2"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="글쓰기"> <input
						type="reset"></td>
				</tr>
			</table>
		</form>

		<div id="myModal" class="modal">
			<span class="close">확인</span>
			<!-- Modal content -->
			<div class="modal-content" id="modal-content">
				<table class="table">
					<tr>
						<td>플래너 번호</td>
						<td>플래너 제목</td>
						<td>여행기간</td>
					</tr>
					<c:if test="${not empty dailyList }">
						<c:forEach items="${dailyList}" var="daily">
							<tr>
								<td>
									<button class="ptitle" id="${daily.pidx}">${daily.ptitle}
									</button>
								</td>
								<td>${daily.pstartdate}~${daily.penddate}</td>

							</tr>

						</c:forEach>
					</c:if>
				</table>

			</div>
		</div>

<%@ include file="/WEB-INF/views/include/mainFooter.jsp"%>


</div>
</div>
</body>
</html>
<script>
	//Get the modal
	var modal = document.getElementById("myModal");

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	//var aaa = document.getElementsByClassName("aaa")
	// When the user clicks on the button, open the modal
	btn.onclick = function() {
		modal.style.display = "block";

	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {

		modal.style.display = "none";

	}

	//모달에서 받아오는 정보. 
	$(".ptitle").on("click", function() {

		//모달에서 플래너제목을 선택하면 바디의 스판에 들어간다.
		var text = $(this).text();
		$(".mptitle").text(text);
		
		//모달에서 플래너 제목을 선택하면 바디에 히든으로 감춰둔 input에 들어간다.
 		var title = $(this).attr("id");
		$(".pidx").val(title); 

		modal.style.display = "none";

	});

	
</script>
