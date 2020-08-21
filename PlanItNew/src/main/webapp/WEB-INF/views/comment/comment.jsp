<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
</style>
</head>
<body>
<c:if test="${result gt 0}">

	<script>
	
	alert('댓글 등록 완료');
	location.reload();
	</script>
		
	
	
	</c:if>
	
	<c:if test="${result lt 1}">
	<script>
	
	alert('댓글등록 실패');
	location.href = '<c:url value="/board/boardList"/>';
	</script>
	
	</c:if>
</body>
</html>