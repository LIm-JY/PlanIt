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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cssMainFooter.css">
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

tr {
	border-bottom: 1px solid #eee;
}

/* #boardListProfileTd{
 border-bottom: 0px;
}
 */
hr {
	width: 85%;
	border: 0;
	border-top: 1px solid #eee;
}

a {
	text-decoration: none;
	color: #1ABC9C;
}

img {
	border-radius: 70%;
}

#loginFormLogo {
	margin-top: 10px;
	margin-bottom: 0;
	font-family: 'Montserrat Alternates', sans-serif; `
	color: #1ABC9C;
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
	color: #1ABC9C;
	margin-top: 5px;
	margin-bottom: -10px;
}

#card-body {
	padding-top: 2px;
	height: 400px;
}

#mainBoardList {
	height: 350px;
}

form>span>p {
	font-size: 10px;
}

#boardlistTable>tbody>tr>td {
	border: 0px;
}

/* 게시글 검색 버튼  */
#boardListSearchBtn {
	margin-top: 5px;
	border: 1px solid lightgrey;
	border-radius: 20%;
	background-color: white;
	border: none;
	border-radius: 20%;
	background-color: white;
	color: grey;
}

/*게시글 검색 input  */
#boardListSearchInput {
	width: 80%;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 1px solid lightgrey;
}

/*게시글 작성자 이름 */
#boardListName {
	color: grey;
	font-size: 9px;
}

#boardListTitleTd {
	text-align: left;
}

#boardListTitle {
	font-size: 14px;
	color: grey;
}

#searchResultMsgDiv {
	margin-top: 80px;
	margin-bottom: 150px;
	font-weight: bolder;
}

.boardListPagingDiv {
	margin-top: 6px;
	paddig-top: 5px;
	margin-bottom: 6px;
}

.plus{

}
.ele2 {
	position: absolute;
	bottom : 50px;
	right: 0;
	width: 50px;
	height: 50px;
	border-radius : 70%;
	border: 3px solid #73AD21;
}
</style>
</head>
<body>

	<div class="card align-middle"
		style="width: 20rem; border-radius: 20px;">
		<!--1번  시작-->

		<div class="card-title" id="card-title" style="text-align: center;">
			<h2 id="loginFormLogo" class="card-title text-center">Plan It!</h2>
			<span style="color: grey;">Community</span>
			<div class="searchBox">
				<form>
					<select name="searchType" style="display: none">
						<option value="both">ID + NAME</option>
					</select> <input type="text" name="keyword" id="boardListSearchInput">
					<button type="submit" value="검색" id="boardListSearchBtn">
						<i class="fa fa-search" aria-hidden="true"></i>
					</button>
				</form>
			</div>
		</div>


		<div class="card-body" id="card-body" style="text-align: center;">
			<!--2번  시작-->

			<c:if test="${not empty listView}">

				<br>
				<table id="boardlistTable">
					<c:if test="${not empty listView.boardList }">
						<c:url value="${initParam['memberUploadPath']}" var="imagePath" />
						<c:forEach items="${listView.boardList}" var="board">

							<tr class="board">
								<td id="boardListProfileTd"><img alt="프로필"
									src="${imagePath}/${board.uphoto}" width="30px" height="30px">
								</td>

								<td rowspan="2" id="boardListTitleTd"><a
									href="${board.bidx}"> <span id="boardListTitle">
											${board.btitle}</span></a></td>
							</tr>

							<tr class="board" id="boardListName">
								<td>${board.uname}
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
				</table>

				<c:if test="${empty listView.boardList }">
					<div id="searchResultMsgDiv">
						<span id="searchResultMsg">조회된 글이 없습니다.</span>
					</div>
				</c:if>

			</c:if>



			<c:if test="${listView.pageTotalCount > 0}">

				<div class="w3-center">
					<div class="w3-bar">
						<c:forEach begin="1" end="${listView.pageTotalCount}" var="i">
							<a class="w3-button"
								${i == listView.currentPageNumber ? 'now_page' : ''}"
								href="boardList?page=${i}">${i}</a>

							<%-- 		<a class="paging_num ${i == listView.currentPageNumber ? 'now_page' : ''}"
								href="boardList?page=${i}">${i}</a> --%>
						</c:forEach>
					</div>
				</div>

			</c:if>

			<!-- 메인화면 Footer  -->
			<div class="plus">
				<a class="ele2" href="<c:url value="/board/boardWrite"/>">+</a>
			</div>

			<%@ include file="/WEB-INF/views/include/mainFooter.jsp"%>

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


