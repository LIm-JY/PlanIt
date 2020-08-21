<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ include file="/WEB-INF/views/include/sessionCheck.jsp" %>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: absolute; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 614px; /* Full width */
    height: 500px; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	margin: auto;
}
/* Modal Content/Box */
.modal-content {
    background-color: white;
    margin: 10% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid lightsteelblue;
    width: 70%; /* Could be more or less, depending on screen size */                          
	height: 60%;
}
/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<h1>글쓰기</h1>
	<h1>회원 리스트</h1>

	<c:if test = "${not empty memberListView}">
		${memberListView.memberTotalCount}명
	</c:if>
	
	<div>
		<h1 class="subtitle">방명록 작성</h1>
	
		<form method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td><label for="uidx">여기는 히든으로 감출거임</label></td>
					<td><input type="text" id="uidx" name="uidx" value="${loginInfo.uidx }"readonly></td>
				</tr>
				<tr>
					<td><label for="uname">이름</label></td>
					<td><input type="text" id="uname" name="uname" value="${loginInfo.uname }" readonly></td>
				</tr>
				<tr>
					<td><label for="btitle">제목</label></td>
					<td><input type="text" id="btitle" name="btitle" required></td>
				</tr>
				
					<tr>
					<td><label for="uidx">일정</label></td>
					<td><a href="planModal" rel="modal:open" id="myBtn">
						<input type="text" name="pidx" id="pidx" value="ptitle.value"></a>
					 
            		</td>
					
				</tr>
				<tr>
					<td><label for="bmsg">메시지</label></td>
					<td><textarea name="bmsg" id="bmsg" rows="10" cols="20"
							required></textarea></td>
				</tr>
				
			
				
				<tr>
					<td><label for="bphoto">사진</label></td>
					<td><input type="file" name="bphoto1" id="bphoto1"></td>
					
				</tr>
				<tr>
					<td><label for="bphoto">사진</label></td>
					<td><input type="file" name="bphoto2" id="bphoto2"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="글쓰기"> <input
						type="reset"></td>
				</tr>
			</table>
		</form>
		
		<div id="myModal" class="modal">
      <span class="close">확인</span> 
            <!-- Modal content -->
            <div class="modal-content" id="modal-content">
                
                    
            </div>
            </div>
	</div>
	
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
</body>
</html>
<script>
 


// 비동기 통신
/* $.ajax({
	url : 'idCheck',
	data : { uid : $(this).val()},
	success : function(data){
		if(data == 'Y'){
			$('#checkmsg').text("사용가능한 아이디 입니다.");
			$('#checkmsg').addClass('check_ok');
			$('#idchk').prop('checked', true);
		} else {
			$('#checkmsg').text("사용이 불가능한 아이디 입니다.");
			$('#checkmsg').addClass('check_not');
			$('#idchk').prop('checked', false);
		}
	}
}); */
</script>