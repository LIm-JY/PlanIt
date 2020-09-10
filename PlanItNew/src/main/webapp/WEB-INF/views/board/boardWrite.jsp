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
	
	alert('게시글이 성공적으로 등록되었습니다.');
	 location.href = '<c:url value="/board/boardList"/>';

	</script>
		
	
	
	</c:if>
	
	<c:if test="${result lt 1}">
	<script>
	
	alert('확인 후 다시 시도해주세요.');
	location.href = '<c:url value="/board/boardList"/>';
	</script>
	
	</c:if>
</body>
</html>