<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">

</head>
<body>

	<c:if test="${result == 1}">

		<script>
			alert('로그인 되었습니다.');
			location.href = '<c:url value="../home"/>';
		</script>

	</c:if>

	<c:if test="${result == 0}">
		<script>
			alert('추가정보를 입력해주세요.');
			location.href = '<c:url value="/member/completeKakaoReg"/>';
		</script>

	</c:if>

</body>
</html>

