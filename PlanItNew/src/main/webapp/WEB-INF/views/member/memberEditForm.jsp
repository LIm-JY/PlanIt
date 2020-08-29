<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!--아이콘  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style>
.check_ok {
	color: blue;
}

.check_not {
	color: red;
}

#idchk {
	display: none;
}
</style>

</head>

<!-- Sidebar -->
<div class="w3-sidebar w3-bar-block w3-card w3-animate-left"
	style="display: none" id="mySidebar">
	<button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close
		&times;</button>
	<a href="#" class="w3-bar-item w3-button">나의 플랜 </a> <a href="#"
		class="w3-bar-item w3-button">내가 쓴 게시글</a> <a href="#"
		class="w3-bar-item w3-button">내가 좋아요 한 글</a>
</div>

<div id="main">
	<div class="w3-container w3-green">
		<h1>나의 정보 수정</h1>
		<button id="openNav" class="w3-button w3-green w3-xlarge"
			onclick="w3_open()">&#9776;</button>
	</div>
	<div class="container">
		<hr>


		<form class="form-horizontal" id="editForm" method="post"
			enctype="multipart/form-data">

			<input type="hidden" name="uidx" value="${member.uidx}" readonly>

			<div class="form-group">
				<label class="control-label col-sm-2" for="email">ID(이메일)</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="uid" name="uid"
						value="${member.uid}" readonly>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="name">닉네임</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="uname" name="uname"
						value="${member.uname}" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">비밀번호 </label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="upw"
						placeholder="새로운 비밀번호를 입력하세요." name="upw" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="phonenumber">휴대폰
					번호</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="uphonenum"
						name="uphonenum" value="${member.uphonenum}" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="photo">사진</label>
				<div class="col-sm-10">
					<input type="file" id="uphoto" name="photo"> <br> 현재
					프로필 사진 : ${member.uphoto} <input type="hidden" name="oldFile"
						value="${member.uphoto}">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
			</div>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/menuBar.jsp"%>

<script>
	function w3_open() {
		document.getElementById("main").style.marginLeft = "25%";
		document.getElementById("mySidebar").style.width = "25%";
		document.getElementById("mySidebar").style.display = "block";
		document.getElementById("openNav").style.display = 'none';
	}
	function w3_close() {
		document.getElementById("main").style.marginLeft = "0%";
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("openNav").style.display = "inline-block";
	}
</script>


<body>


</body>
</html>

<script>
	$(document).ready(function() {
	});
</script>