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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cssMainFooter.css">
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

.dark-button, .dark-button-2 {
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





/*전체를 감싸는 테그*/
.boardListcontainer {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
	width: 500px !important;
	height: 700px;
	background-color: #FFFFFF;
}

table {
	width: 100%;
}

tr {
	border-bottom: 1px solid #eee;
}

hr {
	width: 85%;
	border: 0;
	border-top: 1px solid #eee;
}

/*작성자 입력란  */
input {
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 1px solid lightgrey;
	width: 100%;
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

/* imaged preview */
.filebox .upload-display { /* 이미지가 표시될 지역 */
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img { /* 추가될 이미지 */
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}
</style>
</head>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<body>

	<div class="boardListcontainer"
		style="width: 20rem; border-radius: 20px;">
		<!--1번  시작 : 전체 영역을 감싸는 태그 -->


		<div class="card-title" id="card-title" style="text-align: center;">
			<!--2번시작 : 검색과 제목창시작  -->
			<h3 id="loginFormLogo" class="card-title text-center">community</h3>
			<br> <br>
			<p id="ptext" align="left">다양한 여행 정보를 확인해 보세요.</p>
		</div>
		<br> <br>


		<div class="card-body" id="card-body" style="text-align: center;">
			<!--3번  시작 :테이블 시작 -->
			<br>
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
						<td><input type="submit" value="글쓰기"> 
						<input type="reset"></td>
					</tr>

				</table>
			</form>

			<br> <br>
		</div>
		<!--3번  끝-->

     <!--글쓰기 버튼 div  -->
      <div class="light-button button-wrapper" id="writeButton" style ="margin-bottom: 30px;">
         <div class="button" style = "border-radius: 10px; border: 1px solid #1abc9c;">
            <a href = "../board/boardWrite" style = "text-decoration: none;">
            <span class="span" style ="font-size: 14px;">글쓰기
            </span>
            </a>
         </div>
      </div>
        <!--글쓰기 버튼 /div -->








		<div class="light-button button-wrapper" id="writeButton">
			<div class="button">
				<span class="span" font-size="15px"> 취소 </span>
			</div>
		</div>
		
				<div class="light-button button-wrapper" id="writeButton">
			<div class="button">
				<span class="span" font-size="15px"> 작성완료 </span>
			</div>
		</div>




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





	</div>
		<!--1번  끝-->
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
