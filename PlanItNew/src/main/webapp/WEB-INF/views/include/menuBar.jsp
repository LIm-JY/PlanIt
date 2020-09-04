<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css"> --%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
</style>

<div class="w3-bottom" id="headerNav">
	<div class="w3-row w3-large w3-light-grey">

		<!-- 로그인 세션 없을 시  -->
		<c:if test="${empty loginInfo}">
			<div class="w3-col s3">
				<a href="${pageContext.request.contextPath}/member/memberReg"
					class="w3-button w3-block">회원가입</a>
			</div>
			<div class="w3-col s3">
				<a href="<c:url value="/home"/>" class="w3-button w3-block"> 로그인
				</a>
			</div>
			<div class="w3-col s3">
				<a href="<c:url value="/board/boardList"/>"
					class="w3-button w3-block">커뮤니티</a>
			</div>
		</c:if>

		<!--로그인 되었는 상태 -->
		<c:if test="${!empty loginInfo}">
			<div class="w3-col s2">
				<a href="<c:url value="/home"/>" class="w3-button w3-block"><i class="glyphicon glyphicon-home"></i></a>
			</div>
			<div class="w3-col s2">
				<a href="<c:url value="/planner/calendar"/>"
					class="w3-button w3-block"><i class="glyphicon glyphicon-plane"></i></a>
			</div>
			<div class="w3-col s2">
				<a href="<c:url value="/board/boardList"/>"
					class="w3-button w3-block"><i class="glyphicon glyphicon-file"></i></a>
			</div>
			<div class="w3-col s2">
				<a href="<c:url value="/myPage/${loginInfo.uidx}"/>"
					class="w3-button w3-block"><i class="glyphicon glyphicon-user"></i></a>
			</div>
			<div class="w3-col s4">
				<a href="<c:url value="/login/logout"/>" class="w3-button w3-block">Log
					Out</a>
			</div>

		</c:if>
	</div>
</div>


<%-- 	<h3 id="header">Plan it</h3>
	<ul id="nav">
		<c:if test="${empty loginInfo}">
			<li><a href="${pageContext.request.contextPath}/member/memberReg">회원가입</a></li>
			<li><a href="<c:url value="/home"/>">로그인</a></li>
		</c:if>
		<c:if test="${!empty loginInfo}">
	
			<li><a href="<c:url value="/board/boardList"/>">커뮤니티</a></li>
			<li><a href="<c:url value="/board/boardWrite"/>">게시글 쓰기</a></li>
			<li><a href="<c:url value="/login/logout"/>">로그아웃</a></li>
			<li><a href="<c:url value="/member/memberList"/>">회원 리스트</a></li>
			<li><a href="<c:url value="/myPage/${loginInfo.uidx}"/>">회원
					리스트</a></li>
			<li><a href="<c:url value="/member/memberEdit"/>">My page -
					회원정보 수정</a></li>
			<li><a href="<c:url value="/planner/plannerReg"/>">플래너 만들기</a></li>
			<li><a href="<c:url value="/planner/calendar"/>">플래너 만들기 2</a></li>
		</c:if>
	
	</ul> --%>


