<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style> 
.navbar-header{
background-color : #1ABC9C;
color: red;}

.navbar-brand{
	color: red;
}

</style>
<header> 
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<c:url value="/mainHome?uidx=${loginInfo.uidx}"/>" style="color: white;">plan it</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="<c:url value="/home"/>">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Plans <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/planner/calendar"/>">새로운 플랜</a></li>
            <li><a href="<c:url value="/planner/calendar"/>">내가 짠 플랜</a></li>
            <li><a href="<c:url value="/planner/calendar"/>">집가고 싶다.</a></li>
          </ul>
        </li>
          
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Board <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/board/boardList"/>">게시글 리스트</a></li>
            <li><a href="<c:url value="/board/boardWrite"/>">게시글 작성</a></li>
        </ul>
        </li>
          
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">My Page <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/myPage/${loginInfo.uidx}"/>">나의 정보</a></li>
            <li><a href="<c:url value="/myPage/${loginInfo.uidx}"/>">내가 작성한 플랜</a></li>
            <li><a href="<c:url value="/myPage/${loginInfo.uidx}"/>">내가 작성한 글 </a></li>
            <li><a href="<c:url value="/myPage/${loginInfo.uidx}"/>">내가 좋아요 한 글</a></li>
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
	
	
	
	
	