<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Montserrat+Alternates:wght@600&display=swap" rel="stylesheet">
    <title>로그인</title>
    <style> 
      
    html {height: 100%;}  
    
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
	
	.btn-primary {
	    color: #fff;
	    background-color: #1abc9c; /* DarkTurquoise #1abc9c */
	    border-color: #1abc9c;
	    }
	    
	#btn-Yes{
		font-size: 14px;
		font-weight: bolder;
	}	
	
	.rememberChkBox{
		size: 12px; 
	 	color : grey;
	}
	
	.regFormBtnDiv{
		text-align : center; 
	}
	
	.form-control {
		
		border-radius: 0;
		font-size : 14px;
		BORDER-BOTTOM: 1px solid lightgrey;
		BORDER-LEFT: medium none;
		BORDER-RIGHT: medium none;
		BORDER-TOP: medium none;
		
	}
	

	.check_ok {color: blue;}
	.check_not {color: red;}
 /* 	#idpwchk{display: none;} */
	
	#signUpBtn{
		 color: #1abc9c;
		 font-size: 14px;
   		 font-weight: bolder;
   		 
	}
	
	#checkmsgDiv{ 
		text-align: center;
		font-size: 12px;
		height: 18px;		
	}
	
	.align-middle{
		height: 515px;
	}
	
	/* 로그인form 전용 title(logo) */
	.card-title{
		padding-top: 0.25rem;
	}
	
	
	
    </style>
    
    
    </head>
    
    


 <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
 
  	<c:if test="${!empty loginInfo}">	
	 	<script> location.href = "${pageContext.request.contextPath}/"</script>
	</c:if>
  
 
    <!--로그인 폼 전체 div-->
	<div class="card align-middle" style="width:20rem; border-radius:10px;">	
		<!--로그인 폼 타이틀 div-->
        <div class="card-title" style="margin-top:20px;">
        
        	<h6 id="loginFormLogoKr">여행을 <span id = "loginFormLogoSimple">쉽고 간편</span>하게</h6>
			<h1 id = "loginFormLogo" class="card-title text-center">Plan It!</h1>			
		
		</div>
        
        <!--로그인 폼 바디-->
		<%-- <c:if test="${empty loginInfo}"> --%>
		<div class="card-body">
            <form action="<c:url value='/login'/>" id = "loginForm" method="post">
                <input type="hidden" name="redirectUri" value="${header.referer}"
				style="width: 50%;">
                <h6 class="form-signin-heading" style = "text-align : center; font-size: 12px; color: grey;">로그인 정보를 입력하세요</h6>
                <br>
       
                <label for="uid" class="sr-only">이메일을 입력하세요.</label> 
                <input type="email" id="uid" name ="uid" class="form-control" value="${cookie.uid.value}" placeholder="이메일을 입력하세요." required autofocus><BR>
       
                <label for="upw" class="sr-only">비밀번호를 입력하세요.</label>
                <input type="password" id="upw" name ="upw" class="form-control" placeholder="비밀번호를 입력하세요." required><br>
       			
       			<span  id="checkmsg"></span>
       			
       			
                <div class="checkbox" style = "text-align: right;">
                <label for="remember" class="rememberChkBox" >
                <input type="checkbox" name = "remember" value="r" 
                ${cookie.uid != null ? 'checked' : '' }> <span style = "font-size: 12px;">ID 기억하기</span>
                </label>
                </div>
    
    			<!--공백을 넣어보기  -->
                <div id = "checkmsgDiv" style ="text-align: left;"></div>
                
                <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" style ="height : 41.7px; margin-bottom : 5px;">로그인</button>
               
                
                <a id="custom-login-btn" href="${kakao_url}"> 
                <img src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_wide.png"
								width="278"/></a><hr>
				
				<div class = "regFormBtnDiv">
                <a href = "<c:url value="/member/memberReg"/>">
                	<span  id ="signUpBtn">회원가입</span></a>
                </div>
                </form>
      
		</div>
	<%-- 	</c:if> --%>
	</div>

	<div class="modal">
	</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
  </body>
<!--   <script>
	  $(document).ready(function() {
		  
		  
		   $('#btn-Yes').click(function(){
			   
			  $.ajax({
				  type: "POST",
				  url: "login",
				  data: { "uid" : $('#uid').val(),
						  "upw" : $('#upw').val()},
				  success: function(data){
					switch (String(Data)){
					case "N" :
						alert 
					}
					}
			  });  
		   });
		});
/* 	  $('#checkmsg').text("아이디 혹은 패스워드가 잘못되었습니다.");
 */  </script> -->

  
  
</html>