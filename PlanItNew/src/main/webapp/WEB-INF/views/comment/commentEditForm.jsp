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
	<h1>댓글 수정</h1>

	 <div>
		<h1 class="subtitle">댓글 수정</h1>
		<hr>
		<!-- 이 페이지는 데이터 베이스에 저장된 데이터를 value 값에 세팅해야합니다. -->
		<form method="post" enctype="multipart/form-data">
			<input type="hidden" name="cidx" value="${comment.cidx}"  readonly>
			<table class="table">
			
				<tr>
					<td> <input type="hidden" name="bidx" id="bidx" value="${comment.bidx}"></td>
				</tr>
			
				
				<tr>
					<td>작성자 </td>
					<td> <input type="text" name="uname" id="uname" value="${comment.uname}"></td>
				</tr>
			
				<tr>
					<td>댓글내용 </td>
					<td> <input type="text" name="cmsg" id="cmsg" value="${comment.cmsg}"></td>
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
</body>
</html>
<script>
	
	$(document).ready(function(){
		
		
		
		
		
	});
	
	
</script>