<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Montserrat+Alternates:wght@600&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Baloo+Tammudu+2:wght@600&display=swap" rel="stylesheet">

<style> 


nav{
	z-index: 99999;
	}
/* navbar 로고 */
#navbar-brand{
		color: #1ABC9C; 
		font-size: 3.5rem;
      	font-family: 'Montserrat Alternates', sans-serif;
}

#myNavbar{
	background-color: white;
	color: grey;
	font-weight : 100; 

}

#myNavbar a:hover{
	background-color: #1ABC9C;
	font-weight: 700; 
	color: white; 
}

#navIconbar{
	background-color: #1ABC9C; 
		
}
</style>
<header> 
<nav class="navbar navbar-default">
  <div class="container-fluid" style ="background-color: white;" >
    <div class="navbar-header" style = "background-color: white;">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar" id="navIconbar"></span>
        <span class="icon-bar" id="navIconbar"></span>
        <span class="icon-bar" id="navIconbar"></span>                        
      </button>
      
      
      <a class="navbar-brand" id ="navbar-brand" href ="/it">
      
      	plan it</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="/it">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Plans <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/planner/calendar"/>">새로운 플랜 작성</a></li>
            <li><a href="<c:url value="/planner/calendar"/>">나의 플랜 리스트</a></li>
          </ul>
        </li>
          
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Community <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/board/boardList"/>">커뮤니티 게시글 보기</a></li>
            <li><a href="<c:url value="/board/boardWrite"/>">커뮤니티 게시글 작성</a></li>
            <li><a href="<c:url value="/board/boardWrite"/>">내가 쓴 게시글 보기</a></li>
        </ul>
        </li>
          
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">My Page <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/myPage/${loginInfo.uidx}"/>">나의 정보 보기/수정 </a></li>
            <li><a href="<c:url value="/myPage/${loginInfo.uidx}"/>">나의 플래너</a></li>
            <li><a href="<c:url value="/myPage/${loginInfo.uidx}"/>">나의 커뮤니티 게시글 </a></li>
            <li><a href="<c:url value="/myPage/${loginInfo.uidx}"/>"></a></li>
          </ul>
        </li>
      </ul>
    
      <ul class="nav navbar-nav navbar-right">
        <c:if test="${empty loginInfo}"> 
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </c:if>
          
        <c:if test="${!empty loginInfo}">
        <li><a href="<c:url value="/myPage/${loginInfo.uidx}"/>"><span class="glyphicon glyphicon-user"></span> My Info</a></li>
        <li><a href="<c:url value="/login/logout"/>"><span class="glyphicon glyphicon-log-in"></span> Log out </a></li>
        </c:if>
          
      </ul>
    </div>
  </div>
</nav>
</header>   
	
	
	
	
	