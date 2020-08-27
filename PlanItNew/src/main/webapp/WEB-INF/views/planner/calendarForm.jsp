<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜 저장 처리</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body>


 



	<c:if test="${result gt 0}">

	<script>
	
	alert(' 완료');
	location.href='<c:url value="/planner/plannerReg?ptitle='${ptitle}'+&pstartdate='${startdate}'&penddate='${enddate}'&pidx='${pidx}'"/>';


	</script>
		
	
	
	</c:if>
	
	<c:if test="${result lt 1}">
	<script>
	
	alert(' 실패');
	location.href='<c:url value="/planner/calendarRegForm"/>';


	</script>
	
	</c:if>
</body>
</html>