<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
<c:if test="${!empty loginInfo}">
<%-- 	${loginInfo} 로그인 중 --%>
</c:if>
<c:if test="${empty loginInfo}">
	<script>
		alert('로그인이 필요한 페이지 입니다.');		
		location.href= "<c:url value="/login/login" />";
	</script>
</c:if>


</body>
</html>
