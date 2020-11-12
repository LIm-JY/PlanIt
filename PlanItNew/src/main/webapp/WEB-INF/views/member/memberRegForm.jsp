<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head> 
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Montserrat+Alternates:wght@600&display=swap" rel="stylesheet">
	<title>회원가입</title>
<style> 
	html{
	 height: 100%;
	}
	
	 body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 90px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
  		/* 선형 그래디언트 + 두가지색상 이어줌 */
  		/* background:linear-gradient(to bottom right, #F5F5F5, #DCDCDC); */
	}
	
	hr {
		width: 85%;
	    border: 0;
	    border-top: 1px solid #eee;
	}
	
	#loginFormLogo{
    	margin-top:-10px;
	    font-family: 'Montserrat Alternates', sans-serif;
	    color: #1abc9c;
    }
      
	#loginFormLogoKr{
    	text-align : center; 
    	font-size: 13px; 
    	color: grey;
    }
    
    /* 쉽고 간편 문구*/
    #loginFormLogoSimple{
     	font-weight: bolder;
    	color: #1abc9c;
    }
    
    /*로그인 폼(카드) 위치*/
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	.form-group{
		margin-bottom: 15px;
	}
	
	/* 아이디 체크 시 글씨 색상 */
	#checkmsgDiv{ 
		text-align: right;
		font-size: 12px;
		height: 18px;		
	}
	
	.check_ok {
		color: blue;
		
	}
	
	.check_not {
		color: red;
	}

	#regSubmitBtn{
		color: #fff;
	    background-color: #1abc9c; /* DarkTurquoise #1abc9c */
	    border-color: #1abc9c;
	    font-size: 14px;
		font-weight: bolder;
		height : 41.7px; 
		margin-bottom : 5px;

	}
	
	/* 회원가입 input을 감싸는 div */
	#regForm{
		
	}

	#btn-Yes{
			font-size: 14px;
			font-weight: bolder;
	}	
	
	/* 아직 안만들었다 */
	#input-group-eVerify{
		text-align: center;
		color: grey;
		background: white;
	}
	
	/* 아직 안만들었다 */
	#eVerify{
		font-size: 11px;
		border: none; 
		background-color: white;
		}

	#idchk, #namechk{
	 	display : none; 	
	}
	
	#input-file-button{
	  width: 278px;
	  padding: 6px 10px;
	  background-color: white;
	  color: #1abc9c;
	  cursor: pointer;
	  font-size: 13px;
	  text-align: center;
	  font-weight: bold;
	 /*  border: 1px solid lightgrey; */
	} 

	.form-control {
		width: 278px;
		border-radius: 0;
		font-size : 12px;
		border-bottom: 1px solid lightgrey;
		border-left: medium none;
		border-right: medium none;
		border-top: medium none;
		
	}

	.btn-primary {
	    color: #fff;
	    background-color: #1abc9c; /* DarkTurquoise #1abc9c */
	    border-color: #1abc9c;
	    }
	    
	.login-register{
	 	text-align: center;
	
	} 
	#goBackBtn{
		font-size: 9px;
	 	color: lightGrey; 
	
	}

	#checkMsgPwRule{
		color: lightgrey;
		font-size:9px;
	
	}
	
	.align-middle{
		height: 510px;
	}
	
	/* 상단 회원가입 문구  */
	.form-reg-heading{
		text-align : center; 
		font-size: 14px; 
		color: grey; 
		margin-bottom: 1px;
	
	}
	
	/* 회원가입 form 전용 타이틀 */
	.card-title{
		padding-top: 0.25rem;
		margin-bottom : 0.25rem;
	}

</style>
</head>
	<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
	
	<!--회원가입 폼 전체 div -->
	<div class="card align-middle" id = "registerForm" style="width:20rem; border-radius:10px;">	
		<!--회원가입 폼 타이틀 div-->
        <div class="card-title" style="margin-top:20px;">
        
        	<h6 id="loginFormLogoKr">여행을 <span id = "loginFormLogoSimple">쉽고 간편</span>하게</h6>
			<h1 id = "loginFormLogo" class="card-title text-center">Plan It!</h1>			
			<h6 class="form-reg-heading">회원가입</h6>
			
		</div>
        
        <!--회원가입 폼 바디-->
		<div class="card-body">
            <form id = "regForm" method="post" enctype = "multipart/form-data">
                           
       
                <label for="uid" class="sr-only">이메일을 입력하세요.</label> 
                <input type="email" id="uid" name ="uid" class="form-control" placeholder="이메일을 입력하세요." required autofocus>
       				<input type="checkbox" name="idchk" id="idchk">
	                <div id = "checkmsgDiv">
	                <span  id="checkmsg"></span>
					</div>
       			
       			
                <label for="upw" class="sr-only">비밀번호를 입력하세요.</label>
                <input type="password" maxlength ="12"
					id="upw" name ="upw" class="form-control" placeholder="비밀번호 입력" minlength="6" required>
                <div id = "checkmsgDiv" style ="text-align: left;">
                	<span id = "checkMsgPwRule"> **최소 6자 이상, 최대  12자</span>
                </div>
                
                <label for="upw" class="sr-only">비밀번호를 한번 더 입력해주세요.</label>
                <input type="password" maxlength ="12"
                	id="chkUpw" name ="chkUpw" class="form-control" placeholder="비밀번호 재입력" required>
	       			<div id = "checkmsgDiv">
	       			<span  id="checkmsg03"></span>
	       			</div>
       			
       			<label for="uname" class="sr-only">닉네임을 입력하세요.(*최대5자)</label>
                <input type="text" maxlength ="5" 
                	id="uname" name ="uname" class="form-control" placeholder="닉네임을 입력하세요." required>
                	<input type="checkbox" name="namechk" id="namechk">
                    <div id = "checkmsgDiv" style = "text-align: left;" >
						<span id ="checkMsgPwRule"> ** 최대 5자　　　　　　　</span>	 <!--공백지우지 마셈 제발   -->
						<span id="checkmsg02"> </span>
					</div>
				
				
                <label for="uname" class="sr-only">연락처를 입력하세요.</label>
                <input type="text" maxlength ="11" 
                	id="uphonenum" name ="uphonenum" class="form-control" placeholder="연락처를 입력하세요." 
                	minlength = "9" required>
	                <div id = "checkmsgDiv" style ="text-align: left;">
	                	<span id = "checkMsgPwRule"> ** 공백없이 숫자만 입력해 주세요.</span>
	                </div>
    
    			<div class ="input-group" id = "inputFileContainer">
                     <label class = "input-file-button" for="input-file" id ="input-file-button">+ 프로필 사진 등록하기
                     <i class="fa fa-search" aria-hidden="true"></i>　</label>
                     <input type="file" id="input-file" name="photo"style= "display: none"/>
                </div>
    			
    
    
                <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" style ="height : 41.7px; margin-bottom : 5px;">작성완료</button>
    			
	    			<div class="login-register">
					    <a href="<c:url value="/"/>" >
						<span id = "goBackBtn">뒤로 돌아가기</span></a>
					</div>            
         
                </form>
      
		</div>
	</div>

</body>
</html>

<script>
	
	/*이메일 규칙 */
	function email_check( email ) {
	    
	    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    return (email != '' && email != 'undefined' && regex.test(email));
	
	}




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
					if (data == 'Y' && email_check($('#uid').val()) ) {
						$('#checkmsg').text("사용가능한 이메일입니다.");
						$('#checkmsg').addClass('check_ok');
						$('#idchk').prop('checked', true);
					} else {
						$('#checkmsg').text("사용할수 없는 이메일입니다.");
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
				$('#checkmsg02').text("　 　닉네임을 입력해주세요.");
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
						$('#checkmsg02').text("　 사용가능한 닉네임입니다.");
						$('#checkmsg02').addClass('check_ok');
						$('#namechk').prop('checked', true);
					} else {
						$('#checkmsg02').text("　　 사용중인 닉네임입니다.");
						$('#checkmsg02').addClass('check_not');
						$$('#namechk').prop('checked', false);
					}
				}
			});
		});

		/* 
		$('#regForm').submit(function() {
			if ($('#upw').val() != $('#chkUpw').val()) {
				$('#checkmsg03').text("비밀번호가 다릅니다.");
				$('#chkUpw').focus();
				return false;
			}
		}); */
		
		/*비밀번호 중복체크 */
		$('#chkUpw').focusout(function() {
			if ($('#upw').val() != $('#chkUpw').val()) {
				$('#checkmsg03').css("color","red");
				$('#checkmsg03').text("비밀번호가 다릅니다.");
 			/* 	$('#upw').focus();  */
				return false;
			} else{
				$('#checkmsg03').text("");
			}
			
			
			
			
					
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