<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
</head>
<body>
	<%@ include file = "/WEB-INF/views/include/header.jsp" %>
	
	<div> 
		<h2 class = "subtitle">회원가입</h2>
		<hr> 
		<h3> 
			<c:if test = "${result gt 0}">
				<div>회원가입 완료</div>
			</c:if>
			
			<c:if test = "${result lt 1}">
				<div>회원가입 실패</div>
			</c:if>
			
		</h3>
	</div>

	<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
