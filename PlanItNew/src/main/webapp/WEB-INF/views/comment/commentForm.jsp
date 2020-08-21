<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">

</head>
<body>
<div>
		<h1 class="subtitle">댓글 작성</h1>
		<form action="<c:url value='/comment/comment'/>" method="post" enctype="multipart/form-data">
			<table class="table" border="1">
				<tr>
				<th>보드인덱스<br>히든으로 감춰야함</th>
				<th>작성자 닉네임</th>
				<th>내용입력</th>
				</tr>
			
				<tr>
					<th><input type="text" id="bidx" name="bidx" value ="${viewBoard.bidx}" readonly></th>
					<th><input type="text" name="uname" id="uname" value="${loginInfo.uname}"></th>
					<th><input type="text" name="cmsg" id="cmsg"	required placeholder="댓글을 입력해주세요"></th>
				</tr>
				<tr>
					<th colspan="3"><input type="submit" value="댓글등록"></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>