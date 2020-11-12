<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 글씨체  -->
<link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates:wght@600&family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Baloo+Tammudu+2:wght@600&display=swap" rel="stylesheet">

<!--아이콘  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<!--summer note  -->
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/summernote/summernote-lite.css'/>">

<style> 

/* navbar 인덱스 */
nav{
   z-index: 99999;
   }

*{
   font-family: 'Nanum Gothic', sans-serif;
}   
   
   
/* navbar 로고 */
#navbar-brand{
      color: #1ABC9C; 
      font-size: 4.5rem;
         font-family: 'Montserrat Alternates', sans-serif;
         margin-top: 5%;
}

#header-icon{
   font-size: 25px;
   color: #1abc9c;
}

#myNavbar{
   background-color: white;
   color: grey;
   font-weight : 100; 

}

a:link { 
} 

a:visited { 
   text-decoration: none;
   }

#ptext{
   color: dimgrey;
}

#myNavbar a:hover{
   background-color: #1ABC9C;
   font-weight: 700; 
   color: white; 
}

#header-icon:hover{
   color: white; 
}

#navIconbar{
   background-color: #1ABC9C;    
}
#header-menu{
   width: 120px;
   text-align: center;
   font-size:13px;
}

#mainFormLogo{
   font-family: 'Montserrat Alternates', sans-serif; `
}


</style>
<header> 

<%@ include file="/WEB-INF/views/include/sessionCheck.jsp" %>


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
        <li>
        <a id = "header-menu" href="/it">
        <span id = "header-icon" class="fa fa-home"></span><br>
        Home</a></li>
        <li class="dropdown">
          <a id = "header-menu" class="dropdown-toggle" data-toggle="dropdown" href="#">
        <span id = "header-icon" class="fa fa-calendar"></span><br>
          Plans <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/planner/calendar"/>">새로운 플랜 작성</a></li>
            <li><a href="<c:url value="/planner/plannerList"/>">나의 플랜 리스트</a></li>
          </ul>
        </li>
          
        <li class="dropdown">
          <a id = "header-menu" class="dropdown-toggle" data-toggle="dropdown" href="#">
          <span id = "header-icon" class="fa fa-comments"></span><br>
          Community <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/board/boardList"/>">커뮤니티 게시글 보기</a></li>
            <li><a href="<c:url value="/board/boardWrite"/>">커뮤니티 게시글 작성</a></li>
            <li><a href="<c:url value="/board/boardWrite"/>">내가 쓴 게시글 보기</a></li>
        </ul>
        </li>
          
        <li class="dropdown">
          <a id = "header-menu" class="dropdown-toggle" data-toggle="dropdown" href="#">
          <span id = "header-icon" class="fa fa-user"></span><br>
          My Page <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/myPage/${loginInfo.uidx}"/>">나의 정보 보기 ·수정 </a></li>
            <li><a href="<c:url value="/planner/plannerList"/>">나의 플래너</a></li>
            <li><a href="<c:url value="/myPage/${loginInfo.uidx}"/>">나의 커뮤니티 게시글 </a></li>
            <!--내가 저장한 글 (내가 좋아요 한 글)-->
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
        <li><a href="<c:url value="/login/logout"/>">
        <span class="glyphicon glyphicon-log-out"></span>
        <br> Log out </a></li>
        </c:if>
          
      </ul>
    </div>
  </div>
</nav>
</header>   
   
   
   
   
   