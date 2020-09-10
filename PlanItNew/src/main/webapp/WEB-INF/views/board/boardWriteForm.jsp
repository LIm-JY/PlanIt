<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/sessionCheck.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/default.css">

<style>
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
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div>
		<h1 class="subtitle">방명록 작성</h1>

		<form method="post" enctype="multipart/form-data">
			<table>
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
					<td><label for="bphoto">사진</label></td>
					<td><input type="file" name="bphoto1" id="bphoto1"></td>

				</tr>
				<tr>
					<td><label for="bphoto">사진</label></td>
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
	</div>


	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

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
		$(".mptitle").html(text);
		
		//모달에서 플래너 제목을 선택하면 바디에 히든으로 감춰둔 input에 들어간다.
		var title = $(this).attr("id");
		$(".pidx").val(title);

		modal.style.display = "none";

	});

	
</script>
