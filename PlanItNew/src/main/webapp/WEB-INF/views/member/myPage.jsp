<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div>
		<h1 class="subtitle">my page</h1>
		<hr>
		<input type="hidden" name="uidx" value="${myInfo.uidx}" readonly>
		<table class="table">

			<c:set var="ukakao" value="${myInfo.ukakao}" />
			<c:if test="${ukakao eq N}">
				<tr>
					<td>아이디(이메일)</td>
					<td>${myInfo.uid}</td>
				</tr>
			</c:if>

			<tr>
				<td>닉네임</td>
				<td>${myInfo.uname}</td>
			</tr>

			<tr>
				<td>연락처</td>
				<td>${myInfo.uphonenum}</td>
			</tr>

			<tr>
				<td>프로필 사진</td>
				<td><img alt="사진 " src="${imagePath}/${myInfo.uphoto}"></td>
			</tr>
			<tr>
				<td></td>	
				<td><a href="../member/memberEdit?uidx=${myInfo.uidx}">수정하기</a></td>
	
			</tr>
		</table>

	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>

<script>
	console.log(typeof ('${myInfo.ukakao}'));
</script>