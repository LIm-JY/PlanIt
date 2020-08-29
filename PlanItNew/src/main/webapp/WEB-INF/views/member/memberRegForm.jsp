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
	href="${pageContext.request.contextPath}/css/default.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4 {
	font-family: "Lato", sans-serif
}

.mySlides {
	display: none
}

.w3-tag, .fa {
	cursor: pointer
}

.w3-tag {
	height: 15px;
	width: 15px;
	padding: 0;
	margin-top: 6px
}

/* 아이디 체크 시 글씨 색상 */
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
	<%@ include file="/WEB-INF/views/include/header2.jsp"%>

	<!-- Contact -->
	<div class="w3-center w3-padding-64" id="registerForm">
		<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">회원가입</span>
	</div>

	<form class="w3-container" id="regForm" method="post" enctype="multipart/form-data">
		<div class="w3-section">
			<label>Name</label> 
			<input class="w3-input w3-border w3-hover-border-black" style="width: 50%;"
				type="text" name="uname" id ="uname" required>
			<input type="checkbox" name="namechk" id="namechk">
		</div>
		<div class="w3-section">
			<label>Email</label> 
			<input class="w3-input w3-border w3-hover-border-black" style="width: 50%;"
				type="email" name="uid" id = "uid" required>
			<input type="checkbox" name="idchk" id="idchk">
		</div>
		<div class="w3-section">
			<label>Password</label> 
			<input class="w3-input w3-border w3-hover-border-black" style="width: 50%;"
				type ="password" name="upw" required>	
		</div>
		<div class="w3-section">
			<label>Phone Number</label> 
			<input class="w3-input w3-border w3-hover-border-black" style="width: 50%;"
				type = "text" name="uphonenum" required>
		</div>
		<div class="w3-section">
			<label>Profile</label> 
			<input class="w3-input w3-border w3-hover-border-black" style="width: 50%;"
				type = "file" name = "photo">
		</div>
		<button type="submit" class="w3-button w3-block w3-black">가입하기</button>

	</form>

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