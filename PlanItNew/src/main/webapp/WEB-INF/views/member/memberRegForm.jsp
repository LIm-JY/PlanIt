<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Form</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/default.css"/>

<style>
.check_ok {
	color: blue;
}

.check_not {
	color: red;
}

#idchk, #namechk {
	display: none;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div>
		<h2 class="subtitie">회원가입</h2>
		<hr>
		<form id="regForm" method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<td>이메일</td>
					<td><input type="email" name="uid" id="uid">
					<span id="checkmsg"></span>
					<input type="checkbox" name="idchk" id="idchk">
					</td>
				</tr>
				
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="upw" required></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="uname" id = 'uname'>
					<span id="checkmsg02"></span>
					<input type="checkbox" name="namechk" id="namechk">
					</td>
				</tr>
				
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="uphonenum" required></td>
				</tr>
				
				<tr>
					<td>프로필</td>
					<td><input type="file" name="photo"></td>
				</tr>
				
				<tr>
					<td></td>
					<td><input type="submit" name="회원가입"> <input
						type="reset"></td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
<script>
	$(document).ready(function() {

		$('#regForm').submit(function() {
			if (!$('#idchk').prop('checked')) {
				alert('아이디 중복 체크를 하세요.');
				$('#uid').focus();
				return false;
			}
		});
		$('#uid').focusin(function() {
			$(this).val('');
			$('#idchk').prop('checked', false);
			$('#checkmsg').text('');
			$('#checkmsg').removeClass('check_not');
			$('#checkmsg').removeClass('check_ok');
		});

		$('#uid').focusout(function() {
			if ($(this).val().length < 1) {
				$('#checkmsg').text("이메일을 입력해주세요.");
				$('#checkmsg').addClass('check_not');
				return false;
			}

			//ajax 비동기 통신

			$.ajax({
				url : 'idCheck',
				data : {
					uid : $(this).val()
				},
				success : function(data) {
					if (data == 'Y') {
						$('#checkmsg').text("사용가능한 이메일입니다.");
						$('#checkmsg').addClass('check_ok');
						$('#idchk').prop('checked', true);
					} else {
						$('#checkmsg').text("사용중인 이메일입니다.");
						$('#checkmsg').addClass('check_not');
						$$('#idchk').prop('checked', false);
					}
				}
			});
		});

		//닉네임 중복

		$('#regForm').submit(function() {
			if (!$('#namechk').prop('checked')) {
				alert('닉네임 중복 체크를 해주세요');
				$('#uname').focus();
				return false;
			}
		});

		$('#uname').focusin(function() {
			$(this).val('');
			$('#namechk').prop('checked', false);
			$('#checkmsg02').text('');
			$('#checkmsg02').removeClass('check_not');
			$('#checkmsg02').removeClass('check_ok');
		});

		$('#uname').focusout(function() {
			if ($(this).val().length < 1) {
				$('#checkmsg02').text("닉네임을 입력해주세요.");
				$('#checkmsg02').addClass('check_not');
				return false;
			}

			//ajax 닉네임 중복

			$.ajax({
				url : 'nameCheck',
				data : {
					uname : $(this).val()
				},
				success : function(data) {
					if (data == 'Y') {
						$('#checkmsg02').text("사용가능한 닉네임입니다.");
						$('#checkmsg02').addClass('check_ok');
						$('#namechk').prop('checked', true);
					} else {
						$('#checkmsg02').text("사용중인 닉네임입니다.");
						$('#checkmsg02').addClass('check_not');
						$$('#namechk').prop('checked', false);
					}
				}
			});
		});

	});
</script> 

<!-- <script>

	$(document).ready(function(){
		
		$('#regForm').submit(function(){
			if(!$('#idchk').prop('checked')){
				alert('아이디 중복 체크를 하세요.'); 
				$('#uid').focus(); 
				return false; 
			}
		}); 

		$('#uid').focusin(function(){
			$(this).val(''); 
			$('#idchk').prop('checked', false); 
			$('#checkmsg').text(''); 
			$('#checkmsg').removeClass('check_not'); 
			$('#checkmsg').removeClass('check_ok'); 
		}); 
		
		$('#uid').focusout(function(){
			if($(this).val().length<1){
				$('#checkmsg').text("이메일을 입력해주세요."); 
				$('#check,sg').addClass('check_not');
				return false; 
			}	
			
			//ajax 비동기 통신
			
			$.ajax({
				url : 'idCheck', 
				data : {uid : $(this).val()}, 
				success : function(data){
					if(data == 'Y'){
						$('#checkmsg').text("사용가능한 이메일입니다.");
						$('#checkmsg').addClass('check_ok');
						$('#idchk').prop('checked', true); 
					} else {
						$('#checkmsg').text("사용중인 이메일입니다."); 
						$('#checkmsg').addClass('check_not'); 
						$$('#idchk').prop('checked', false); 
					}	
				}
			}); 
		});
	}); 
	

</script> -->