<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<h1>게시글 수정</h1>

	 <div>
		<h1 class="subtitle">회원 수정</h1>
		<hr>
		<!-- 이 페이지는 데이터 베이스에 저장된 데이터를 value 값에 세팅해야합니다. -->
		<form method="post" enctype="multipart/form-data">
			<input type="hidden" name="bidx" value="${board.bidx}"  readonly>
			<table class="table">
			<tr>
					<td>멤버 번호 </td>
					<td> <input type="text" name="uidx" id="uidx" value="${board.uidx}"></td>
				</tr>
				<tr>
					<td>제목 </td>
					<td> <input type="text" name="btitle" id="btitle" value="${board.btitle}"></td>
				</tr>
				 <tr>
					<td>내용</td>
					<td> <input type="text" name="bmsg" id="bmsg" value="${board.bmsg}"> </td>
				</tr>
				
			
				 <tr>
					<td>사진</td>
					<td><input type="file" name="bphoto1">
						<br>
						현재 파일 : ${board.bphoto1}
						<input type="hidden" name="oldFile" value="${board.bphoto1}" >
					 </td>
				</tr>
				<tr>
					<td></td>
					 <td><input type="file" name="bphoto2">
						<br>
						현재 파일 : ${board.bphoto2}
						<input type="hidden" name="oldFile" value="${board.bphoto2}" >
					 </td>
				</tr>
				<tr>
					<td></td>
					<td> 
						<input type="submit" name="회원가입">
						<input type="reset">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
</body>
</html>
<script>
	
	$(document).ready(function(){
		
		
		
		
		
	});
	
	
</script>