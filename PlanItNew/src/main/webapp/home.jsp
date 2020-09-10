<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Montserrat+Alternates:wght@600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <title>메인페이지</title>
<head>

    <style> 
       
    html {
    height: 100%;
    scroll-behavior: smooth;
    
    
    }  
    
    body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 80px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
  		/* 선형 그래디언트 + 두가지색상 이어줌 */
  		/* background:linear-gradient(to bottom right, #F5F5F5, #DCDCDC); */
	}
	
	table{
		width: 100%;
	    border-collapse: collapse;	
	}
	
	th, td {
    border: 1px solid lightgrey;
  }
	
	hr {
		width: 80%;
	    border: 0;
	    border-top: 1px solid #eee;
	}
	
	a{
		text-decoration: none;
		color: #00CED1;
	}
     
    #loginFormLogo{
    	margin-top:10px; 
    	margin-bottom: 0;
	    font-family: 'Montserrat Alternates', sans-serif;
`	    color: #00CED1;
    }
    
    
    /*로그인 폼(카드) 위치*/
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	#card-title{
		color: #00CED1;
		margin-top: 10px;
	 	margin-bottom: 5px;
	 	
	}
	
	#card-body{
	 padding-top: 5px;
	
	}
	
	.btn-primary {
	    color: #fff;
	    background-color: #00CED1; /* DarkTurquoise #00CED1 */
	    border-color: #00CED1;
	    }
	    
	
	.planListBtn, .boardListBtn{
		text-align : center; 
		}

	
	#mainPlanList, #mainBoardList{
/* 	border: 1px solid lightgrey;  */
	
	}
	
	
	.form-control {
		
		border-radius: 0;
		font-size : 14px;
		BORDER-BOTTOM: 1px solid lightgrey;
		BORDER-LEFT: medium none;
		BORDER-RIGHT: medium none;
		BORDER-TOP: medium none;
		
	}
	
	.mainNav{
		list-style-type: none;
		margin: 0;
		padding: 0;
	}
	
	.mainNav li { 
		display: inline; 
		color: grey;
		padding-left: 15px; 
		padding-right: 15px; 
		text-align: center;
		 }
	
	
    .mainNav li a:hover  {
		color: #E9967A;
	}

	.mainPlanList a, .mainBoardList a{
		color: #E9967A;
	}
    
    #mainNavSpan{
    	color: grey;
    	font-size: 9px; 
    }    
   
    </style>



</head>
<body>

<c:if test="${!empty loginInfo}">	
	<div class="card align-middle" style="width:20rem; border-radius:20px;">	
        <div class="card-title" id  ="card-title">
			<h2 id = "loginFormLogo" class="card-title text-center">Plan It!</h2>
			<hr>
		</div>
       

		<div class="card-body" id = "card-body" style = "text-align : center;">
                <input type="hidden" name="redirectUri" value="${header.referer}"
				style="width: 50%;">
                <!-- <h6 class="form-signin-heading" style = "text-align : center; font-size: 12px; color: grey;">오늘의 픽</h6> -->
                
                
                <div class="mainPlanList" id ="mainPlanList"> <!-- style = "text-align : center;" -->
              
              	<h6 style = "text-align : left;"> 나의 플랜</h6> 
              	
              	<table>
              		<tr> 
              			<td>1</td>
              			<td>0824 제주 여행</td>
              			<td>
              				<i class="fa fa-plus-circle" aria-hidden="true"></i>
              			</td>
              			<td>
              				<i class="fa fa-pencil" aria-hidden="true"></i>
              			</td>
              			
              		</tr>
       				<tr> 
              			<td>2</td>
              			<td>제주도 2박3일</td>
              			<td>
              				<i class="fa fa-plus-circle" aria-hidden="true"></i>
              			</td>
              			<td>
              				<i class="fa fa-pencil" aria-hidden="true"></i>
              			</td>
              		</tr>
              		<tr> 
              			<td>3</td>
              			<td>다음주 여행</td>
						<td>
              				<i class="fa fa-plus-circle" aria-hidden="true"></i>
              			</td>
              			<td>
              				<i class="fa fa-pencil" aria-hidden="true"></i>
              			</td>
              		</tr>
              		<tr> 
              			<td colspan = "4">
              			<div class = "planListBtn">
              			<a href = "<c:url value="/member/memberReg"/>"><i class="fa fa-plus-circle" aria-hidden="true"></i></a>
              			</div>
              			</td>
              		</tr>
              	</table>
              	
    
              	 
                </div>
       
       			<hr> 
       			
               
       			
                <div class="mainBoardList" id ="mainBoardList" style = "text-align : center;">
                
                <h6 style = "text-align : left;"> 커뮤니티 차트</h6> 
               
                <table>
              		<tr> 
              			<td>1</td>
              			<td>
              				<i class="fa fa-user" aria-hidden="true"></i>
              			</td>
              			<td>창일</td>
              			<td>안녕하세요~</td>
              			
              			<td>
              				<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
              			</td>
              		</tr>
       				<tr> 
       					<td>2</td>
       					<td>
              				<i class="fa fa-user" aria-hidden="true"></i>
              			</td>
              			<td>현정</td>
              			
              			<td>제주도로 오세요</td>
              			
              			<td>
              				<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
              			</td>
              		</tr>
              		<tr>
              			<td>3</td>
              			<td>
              				<i class="fa fa-user" aria-hidden="true"></i>
              			</td> 
              			<td>미선</td>
              			<td>즐거운 목포 여행</td>
              			
              			<td>
              				<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
              			</td>
              		</tr>
              		<tr> 
              			<td colspan = "5">
              			<div class = "boardListBtn">
              			<a href = "<c:url value="/board/boardList"/>"> + 더보기 </a>
              			</div>
              			</td>
              		</tr>
              	</table>
   			
                </div>
                
                <hr> 
                
                
                <!--메인화면 네비  -->
                <div class = "mainNavDiv">
               	<ul class = "mainNav"> 
               		<li>
               			<a href = "<c:url value="/"/>"><i class="fa fa-home fa-2x" aria-hidden="true">
               			<br><span id = "mainNavSpan">메인</span></i></a>
               		</li>
               		<li>
               			<a href="<c:url value="/planner/calendar"/>"><i class="fa fa-book fa-2x" aria-hidden="true">
               			<br><span id = "mainNavSpan">플래너</span></i></a>
               		</li>
               		<li>
               			<a href="<c:url value="/board/boardList"/>"><i class="fa fa-pencil fa-2x" aria-hidden="true">
               			<br><span id = "mainNavSpan">커뮤니티</span></i></a>
               		</li>
               		<li>
               			<a href = "<c:url value="/myPage/${loginInfo.uidx}"/>"><i class ="fa fa-user fa-2x" aria-hidden="true">
               			<br><span id = "mainNavSpan">마이페이지</span></i></a>
               		</li>
               	</ul>
                </div>
                
				
				 
      		
		</div>
	</div>
	 	
</c:if>


<c:if test="${empty loginInfo}">
	<script>
		location.href = 'login'; 
	</script>
</c:if>
</body>



