<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 처리</title>
</head>
<body>


	
		<c:if test="${result gt 0}">
		<script>
		alert(' 완료');
		</script>
		</c:if>

		<c:if test="${result lt 1}">
		<script>
		alert(' 실패');
		
	</script>
	
</c:if>

</body>
</html>