<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>



</head>
<body>

<c:if test="${!empty loginInfo}">	
	<script>
		location.href = 'mainHome?uidx='+${loginInfo.uidx}+'';
	</script>
</c:if>


<c:if test="${empty loginInfo}">
	<script>
		location.href = 'login'; 
	</script>
</c:if>

</body>



