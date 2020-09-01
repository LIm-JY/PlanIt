<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!--아이콘  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
<style>
#myAccountInfo {
	font-weight : bolder; 
}

#editSubmitTd {
	text-align: center;
	font-weight: bolder;
}

.editBtn {
	  text-decoration: none;
      font-size:1rem;
      color:blue;
      display:inline-block;
      border-radius: 10px;
}

#icon {
	background-image: url(../images/icons/dollar.png);
	background-repeat: no-repeat;
	background-position: 2px 3px;
}
;

</style>
<body>

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
		<div class="w3-container w3-default">
			<h1>My Page</h1>
			<button id="openNav" class="w3-button w3-large"
				onclick="w3_open()">&#9776;</button>
		</div>

		<div class="w3-container">
			<hr>
	
			<input type="hidden" name="uidx" value="${myInfo.uidx}" readonly>
			<table class="table table-c">
				<tr>
					<th colspan="2" class="active">나의 계정 정보</th>

				</tr>
				<c:set var="ukakao" value="${myInfo.ukakao}" />
				<c:if test="${ukakao eq N}">
					<tr>
						<th>아이디(이메일)</th>
						<td class="w3-right-align">${myInfo.uid}</td>
					</tr>
				</c:if>
				<tr>
					<th>닉네임</th>
					<td class="w3-right-align">${myInfo.uname}</td>
				</tr>

				<tr>
					<th>연락처</th>
					<td class="w3-right-align">${myInfo.uphonenum}</td>
				</tr>

				<tr>
					<th>프로필 사진</th>
					<td class="w3-right-align"><img alt="사진 " src="${imagePath}/${myInfo.uphoto}"></td>
				</tr>
				<tr>
					<td colspan="2" id="editSubmitTd">
					<a class="editBtn"
						href="../member/memberEdit?uidx=${myInfo.uidx}">
						<button type ="button" class = "btn btn-default">
						수정하기
						</button>
						</a>
				
						</td>

				</tr>
			</table>

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



</body>
</html>

<script>
	console.log(typeof ('${myInfo.ukakao}'));
</script>