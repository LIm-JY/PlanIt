<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${result }
<c:if test="${result gt 0}">

	<script>
	
	alert('데일리 저장완료');
	location.href = "<c:url value="/planner/plannerReg"/>";
	/* location.href = '<c:url value="/login/login"/>'; */

	</script>
		
	
	
	</c:if>
	
</body>
</html>