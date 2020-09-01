<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${!empty loginInfo}">	
	 	<script> location.href = "${pageContext.request.contextPath}/board/boardList"</script>
</c:if>

<c:if test="${empty loginInfo}">
	<script>
		location.href = 'home'; 
	</script>
</c:if>