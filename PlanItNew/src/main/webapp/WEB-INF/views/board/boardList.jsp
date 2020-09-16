<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/sessionCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Montserrat+Alternates:wght@600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<style>
html {
	height: 100%;
	scroll-behavior: smooth;
}

body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding-top: 80px;
	padding-bottom: 40px;
	font-family: "Nanum Gothic", arial, helvetica, sans-serif;
	background-repeat: no-repeat;
	/* 선형 그래디언트 + 두가지색상 이어줌 */
	/* background:linear-gradient(to bottom right, #F5F5F5, #DCDCDC); */
}

table {
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

a {
	text-decoration: none;
	color: #00CED1;
}

img{
	border-radius: 70%;
}

#loginFormLogo {
	margin-top: 10px;
	margin-bottom: 0;
	font-family: 'Montserrat Alternates', sans-serif; `
	color: #00CED1;
}

/*로그인 폼(카드) 위치*/
.card {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

#card-title {
	color: #00CED1;
	margin-top: 10px;
	margin-bottom: 5px;
}

#card-body {
	padding-top: 5px;
	border: 1px solid red;
	height: 400px;
}

.btn-primary {
	color: #fff;
	background-color: #00CED1; /* DarkTurquoise #00CED1 */
	border-color: #00CED1;
}

.planListBtn, .boardListBtn {
	text-align: center;
}

#mainBoardList {
	height : 250px;
	border: 1px solid blue;
	
}

.form-control {
	border-radius: 0;
	font-size: 14px;
	BORDER-BOTTOM: 1px solid lightgrey;
	BORDER-LEFT: medium none;
	BORDER-RIGHT: medium none;
	BORDER-TOP: medium none;
}

.mainNav {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.mainNav li {
	display: inline;
	color: grey;
	padding-left: 13px;
	padding-right: 15px;
	text-align: center;
	
	
}

.mainNav span {
	
}

.mainNav li a:hover {
	color: #E9967A;
}

.mainPlanList a, .mainBoardList a {
	color: #E9967A;
}

#mainNavSpan {
	color: grey;
	font-size: 9px;
}
</style>
</head>
<body>

	<div class="card align-middle"
		style="width: 20rem; border-radius: 20px;">
		<!--1번  시작-->


		<div class="card-title" id="card-title">
			<h2 id="loginFormLogo" class="card-title text-center">Plan It!</h2>
			<hr>
		</div>


		<div class="card-body" id="card-body" style="text-align: center;"><!--2번  시작-->
			


			<div class="mainBoardList" id="mainBoardList" style="text-align: center;"><!--3번  시작-->
				<h6 style="text-align: left;">커뮤니티 차트</h6>

				<c:if test="${not empty listView}">
					<div class="searchBox">
						<form>
							<select name="searchType" style="display:none">
								<option value="both">ID + NAME</option>
							</select> <input type="text" name="keyword"> <input type="submit"
								value="검색"> 
						</form>
					</div>

					<br>
					<table>
					
						<c:if test="${not empty listView.boardList }">
							<c:url value="${initParam['memberUploadPath']}" var="imagePath" />
							<c:forEach items="${listView.boardList}" var="board">
								<tr class="board">
								
									<td class="number"></td>
									<td><img alt="프사 " src="${imagePath}/${board.uphoto}"width="30px"
										height="30px" > </td>
									<td>${board.uname}</td>
									<td><a href="${board.bidx}">${board.btitle}</a></td>
									

								</tr>
							</c:forEach>
							
					<script>
					function reorder() {
						//ddidx 재배치
					   $(".board").each(function(i, box) {
					        $(box).find(".number").html(i + 1);

					    });
					}
						
					reorder();
					</script>
							
							
						</c:if>

						<c:if test="${empty listView.boardList }">
							<tr>
								<th colspan="6">조회된 글이 없습니다.</th>
							</tr>
						</c:if>

					</table>
					
					</c:if>
			</div><!--3번  끝-->


		<c:if test="${listView.pageTotalCount > 0}">

			<div class=""boardListBtn"">
				<c:forEach begin="1" end="${listView.pageTotalCount}" var="i">

					<a
						class="paging_num ${i == listView.currentPageNumber ? 'now_page' : ''}"
						href="boardList?page=${i}">${i}</a>
				</c:forEach>
			</div>

		</c:if>







		<!--메인화면 네비  -->
		<div class="mainNavDiv">
			<ul class="mainNav">
				<li><a href="<c:url value="/"/>"><i
						class="fa fa-home fa-2x" aria-hidden="true"> <br> <span
							id="mainNavSpan">메인</span></i></a></li>
				<li><a href="<c:url value="/planner/calendar"/>"><i
						class="fa fa-book fa-2x" aria-hidden="true"> <br> <span
							id="mainNavSpan">플래너</span></i></a></li>
				<li><a href="<c:url value="/board/boardList"/>"><i
						class="fa fa-pencil fa-2x" aria-hidden="true"> <br> <span
							id="mainNavSpan">커뮤니티</span></i></a></li>
				<li><a href="<c:url value="/myPage/${loginInfo.uidx}"/>"><i
						class="fa fa-user fa-2x" aria-hidden="true"> <br> <span
							id="mainNavSpan">마이페이지</span></i></a></li>
			</ul>
		</div>

	</div>
	<!--2번  끝-->
	</div>
	<!--1번  끝-->




</body>

</html>

<script>

/* 순서 조정 */

	
	function boardDel(bidx) {
		if (confirm('선택하신 회원 정보를 삭제하시겠습니까?')) {
			location.href = 'boardDelete?bidx=' + bidx;
		}

	}

	function boardList() {
		location.href = 'boardList';
	}
</script>