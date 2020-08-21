<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 회원 정보 추가입력</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<div>
		<form action = "completeKakaoReg" 
		 	id="regForm" method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<td>카카오 로그인 아이디(변경불가)</td>
					<td> <input type="text" name="uid" id="uid" value="${uid}" readonly>
					 </td>
				</tr>
				<tr>
					<td>닉네임 (기본값 : 설정되어있는 카카오 이름)</td>
					<td> <input type="text" name="uname" id="uname" value="${uname}" required> </td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td> <input type="text" name="uphonenum" id="phonenum" required> </td>
				</tr>
				
				<tr>
					<td>프로필사진가져오기</td>
					<td><img src = "${photo}" width = "200px" > </td>
					
					<%-- <td><input type="image" name="photo" value = "${photo}"></td> --%>
				</tr>
				
				<tr>
					<td></td>
					<td><input type="submit" name="회원가입"> 
						<input type="reset"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
