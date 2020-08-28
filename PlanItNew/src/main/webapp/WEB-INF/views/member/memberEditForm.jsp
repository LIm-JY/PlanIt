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
<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<div>
		<h1 class="subtitle">회원 정보 수정</h1>
		<hr>
		<form id="editForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="uidx" value="${member.uidx}" readonly>
			<table class="table">
				
				<tr>
					<td>아이디(이메일)</td>
					<td><input type = "text" id ="uid" name = "uid" value = "${member.uid}" readonly> 아이디(이메일)는 수정이 불가 </td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type = "text" id ="uname" name = "uname" value = "${member.uname}" required>  </td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type = "password" id ="upw" name = "upw" value = "${member.upw}" required> </td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type = "text" id ="uphonenum" name = "uphonenum" value = "${member.uphonenum}" required> </td>
				</tr>
				<tr>
					<td>프로필 사진</td>
					<td><input type = "file" id ="uphoto" name = "photo">
						<br>
						현재 프로필 사진 : ${member.uphoto}
						<input type ="hidden" name ="oldFile" value ="${member.uphoto}">
					
					 </td>
				</tr>
				<tr>
					<td> </td>
					<td>	
						<input type = "submit" name = "수정완료"> 
						<input type = "reset" name = "취소" >
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>


<body>


</body>
</html>

	<script> 
		$(document).ready(function(){
		}); 
	
	
	</script>