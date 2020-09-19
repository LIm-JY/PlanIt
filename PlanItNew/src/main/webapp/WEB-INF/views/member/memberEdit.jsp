<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>

<style>
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<div>
		
		
		<c:if test="${result gt 0}">
			
			<script>
			 alert("회원 수정에 성공하였습니다. 홈페이지로 돌아갑니다.");
				location.href = '../'
			</script>
			
			
		</c:if>
		
		<c:if test="${result lt 1}">
			<script>
				 alert("회원 수정에 실패하였습니다. 다시 시도해주세요.");
				 history.go(-1);
			</script>
			</c:if>
		
		
		
		</h3>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>


