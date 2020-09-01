<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">

		<!-- Website CSS style -->
		<link rel="stylesheet" type="text/css" href="assets/css/main.css">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Noto+Sans+KR:wght@100;400&family=Work+Sans:ital,wght@0,200;0,300;0,400;1,200&display=swap" rel="stylesheet">
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

<title>Admin</title>
<style> 

body, html{
    height: 100%;
 	background-repeat: no-repeat;
 	background-color: white;
 	font-family: 'Oxygen', sans-serif;
}

.main{
 	margin-top: 50px;
}

h3.title { 
	font-size: 30px;
	font-family: 'Jua'; 
	font-weight: 400; 
	color: #00CED1;
	
}

hr{
	width: 10%;
	color: #fff;
}

.form-group{
	margin-bottom: 15px;
}

label{
	margin-bottom: 15px;
}

input,
input::-webkit-input-placeholder {
    font-size: 11px;
    padding-top: 5px;
}

.main-login{
/*     border: 1px solid lightgrey;  */
 	background-color: #fff;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

}

.main-center{
 	margin-top: 15px;
 	margin: 0 auto;
 	max-width: 330px;
    padding: 40px 40px;

}

.login-button{
	margin-top: 5px;
}

.login-register{
	font-size: 11px;
	text-align: center;
}
/* 아이디 체크 시 글씨 색상 */
.check_ok {
	color: blue;
}

.check_not {
	color: red;
}

#regSubmitBtn{
		color: #fff;
	    background-color: #00CED1; /* DarkTurquoise #00CED1 */
	    border-color: #00CED1;
	    font-size: 14px;
		font-weight: bolder;

}

#idchk, #namechk{
	display: none;
}

#input-file-button{
  width: 278px;
  padding: 6px 10px;
  background-color: white;
  border-radius: 4px;
  color: lightgrey;
  cursor: pointer;
  text-align: center;
  border: 1px solid lightgrey;
}  
    
</style>
</head>
	<body>
		<div class="container" id="registerForm">
			<div class="row main"> 
				<div class="main-login main-center" style="width:40em; border-radius:20px;">
                    <div class="panel-heading">
                        <div class="panel-title text-center" id = "panel-title">
	               		<h3 class="title">회원가입</h3>
	               		<hr>
	               	   </div>
                    </div> 
					<form class="form-horizontal"  id="regForm" method="post" enctype="multipart/form-data">
						
						<div class="form-group">
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="uid" id="uid"  placeholder="이메일을 입력하세요." required/>
								</div>
							</div>
                        <input type="checkbox" name="idchk" id="idchk">
                        <span  id="checkmsg"></span>
						</div>
                        <div class="form-group">

							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="upw" id="upw"  placeholder="패스워드를 입력하세요." required/>
								</div>
							</div>
						</div>

<!--						<div class="form-group">
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="password"  placeholder="패스워드를 확인합니다."/>
								</div>
							</div>
						</div>-->
                        
                        <div class="form-group">
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="uname" id="uname"  placeholder="닉네임을 입력하세요." required/>
								</div>
							</div>
                         <input type="checkbox" name="namechk" id="namechk">
			             <span  id="checkmsg02"></span>
						</div>
                        
                        <div class="form-group">
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="uphonenum" id="uphonenum"  placeholder="연락처를 입력하세요."/>
								</div>
							</div>
						</div>
                        
                        <div class="form-group">
                            <div class ="cols-sm-10" id = "inputFileContainer"> 
                                <div class ="input-group" id = "inputFileContainer">
                                    <label className = "input-file-button" for="input-file" id ="input-file-button">프로필 사진 업로드</label>
                                <input type="file" id="input-file" style= "display: none"/>
                                </div>
                            </div>
                        </div>
                        
                        <hr>

						<div class="form-group ">
							<button id="regSubmitBtn" type="submit" class="btn btn-primary btn-lg btn-block login-button" style ="height : 41.7px; margin-bottom : 5px;">작성완료</button>
						</div>
						<div class="login-register">
				            <a href="<c:url value="/home"/>" >뒤로 돌아가기</a>
				         </div>
					</form>
				</div>
			</div>
		</div>

        <script type="text/javascript" src="assets/js/bootstrap.js"></script>
	</body>
</html>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

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
						$('#idchk').prop('checked', false);
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