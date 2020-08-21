<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "/WEB-INF/views/include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버리스트 입니다.</title>
<link rel="stylesheet" href="<c:url value="/css/default.css" />">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">

<style>
	td>img{
		width :50px;
		height : 50px;
	}
	
	div.searchBox {
		border : 1px solid #DDD;
		padding : 15px;
		width : 80%;
		margin : 10px 0;
	}
	div.searchBox>form>select {
		height: 40px;
		padding : 5px;
		font-size: 24px;
		vertical-align: middle;
	}
	div.searchBox>form>input {
		vertical-align: middle;
	}
	div.searchBox>form>input[type=submit], div.searchBox>form>input[type=button]  {
		height: 40px;
		padding : 5px;
		font-size: 24px;
		vertical-align: middle;
	}
</style>
</head>
<body>
	
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div>
		<h1 class="subtitle">회원 리스트</h1>

		<c:if test="${not empty listView }">

		<div>전체회원 ${listView.memberTotalCnt} 명</div>
		<hr>
		
		<div class="searchBox">
			<form>
				<select name="searchType">
					<option value="id">ID</option>
					<option value="name">NAME</option>
					<option value="both">ID + NAME</option>
				</select>
				<input type="text" name="keyword">
				<input type="submit" value="검색">
				<input type="button" value="전체리스트 보기" onclick="memberList();">
			</form>		
		</div>

		<table class="table">
			<tr>
				<th>no</th>
				<th>아이디</th>
				<th>이름</th>
				<th>비밀번호</th>
				<th>사진</th>
				<th>관리</th>
			</tr>
			
		<c:if test="${not empty listView.memberList }">
		<c:url value="${initParam['memberUploadPath']}" var="imagePath"/>
		<c:forEach items="${listView.memberList}" var="member">
			<tr>
				<td>${member.uidx}</td>
				<td>${member.uid}</td>
				<td>${member.uname}</td>
				<td>${member.upw}</td>
				<td><img alt="프사 " src="${imagePath}/${member.uphoto}">  </td>
				<td>
				<a href="memberEdit?uidx=${member.uidx}">수정</a> 
				| 
				<a href="javascript:memberDel(${member.uidx})">삭제</a>
				|
				<a href="view/${member.uidx}">정보보기</a>
				
				</td>
			</tr>
		</c:forEach>
		</c:if>
		
		<c:if test="${empty listView.memberList }">
			<tr>
				<th colspan="6">조회된 회원이 없습니다.</th>
			</tr>
		</c:if>


		</table>
		
		<div class="paging">
			<c:forEach begin="1" end="${listView.pageTotalCnt}" var="i">
			
			<a class="paging_num ${i == listView.currentPageNum ? 'now_page' : ''}" 
			href="memberList?page=${i}" >${i}</a>
			
			</c:forEach>
		</div>



		</c:if>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>


<script>
	function memberDel(uidx){
		if(confirm('선택하신 회원 정보를 삭제하시겠습니까?')){
			location.href = 'memberDelete?uidx='+uidx;
		}
		
	}
	
	function memberList(){
		location.href='memberList';
	}
</script>



