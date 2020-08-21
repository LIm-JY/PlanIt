<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>LoginForm</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
</style>

</head>

<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div>
		<h2 class="subtitle">로그인</h2>
		<hr>
		<form method="post" >
			<input type="hidden" name="redirectUri" value="${header.referer}"
				style="width: 50%;">

			<table class="table">
				<tr>
					<td></td>
					<td><input type="email" name="uid" value="${cookie.uid.value}"
						placeholder="이메일을 입력하세요."></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="password" name="upw"
						placeholder="비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="checkbox" name="remember" value="r"
						${cookie.uid != null ? 'checked' : '' }> 아이디 기억하기</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="로그인"></td>
				</tr>
			</table>

		</form>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>
<script>
	
	$(document).ready(function(){
	});	
</script>
 --%>
