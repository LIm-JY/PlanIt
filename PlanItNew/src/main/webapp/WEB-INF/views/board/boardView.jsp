<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>


<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<head>
<meta charset="UTF-8">
<title>뷰페이지</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<c:url value="${initParam['boardUploadPath']}" var="imagePath"/>
	<br>
	<br>
	<table class="table" border="1">
		<tr>
			<th>게시글 제목</th>
			<th colspan="3">${viewBoard.btitle}</th>
		</tr>

		<tr>
			<th>작성자</th>
			<th>${viewBoard.uidx}</th>
			<th colspan="2">${viewBoard.bregdate}</</th>
		</tr>

		<tr>
			<th>내용</th>
			<th colspan="3">${viewBoard.bmsg}</th>
		</tr>

		<tr>
			<th>내일정공유</th>
			<th colspan="3" id="boardplanner">${viewBoard.pidx}</th>

		</tr>
		<tr>
			<th>사진</th>
			<th colspan="3"><img alt="사진 "
				src="${imagePath}/${viewBoard.bphoto1}"></th>
		</tr>

		<tr>
			<th>사진</th>
			<th colspan="3"><img alt="사진 "
				src="${imagePath}/${viewBoard.bphoto2}"></th>

		</tr>
	</table>


	<div>
		<h1>
			<a href="boardEdit?bidx=${viewBoard.bidx}">게시글 수정| <a
				href="javascript:boardDel(${viewBoard.bidx})">게시글 삭제</a></a>
			<h1>
	</div>

	<c:if test="${not empty commentistView}">
		<table class="table" border="1">
			<tr>
				<th>작성자</th>
				<th>댓글 내용</th>
				<th>댓글 작성시간</th>

			</tr>

			<c:if test="${not empty commentistView.commentList }">
				<c:forEach items="${commentistView.commentList}" var="comment">
					<tr>

						<th>${comment.uname}</th>
						<th>${comment.cmsg}</th>
						<th>${comment.cregdate}</th>
						<th><a href="javascript:commentDel(${comment.cidx})">댓글삭제</a>|
							<a href="../comment/commentEdit?cidx=${comment.cidx}">댓글수정</a></th>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${empty commentistView}">
				<tr>

					<th colspan="3">첫번째 댓글을 남겨주세요~♡</th>

				</tr>
			</c:if>
		</table>
	</c:if>

	<div>
		<%@ include file="/WEB-INF/views/comment/commentForm.jsp"%>

	</div>






</body>
</html>
<script>


	function boardDel(bidx) {
		if (confirm('선택하신 회원 정보를 삭제하시겠습니까?')) {
			location.href = 'boardDelete?bidx=' + bidx;
		}

	}
	function commentDel(cidx) {
		if (confirm('선택하신 댓글을 삭제하시겠습니까?')) {
			location.href = '../comment/commentDelete?cidx=' + cidx;

		}

	}

	function boardList() {
		location.href = 'boardList';
	}
	
	
	
$(document).ready(function(){
	
	
	$.ajax({
		url : 'checkPidx',
		data : {pidx:('${viewBoard.pidx}')},
		
		success : function(data) {
			if (data == 'Y') {
				plannerJoinDailyList();
			}
		}
	});//pidx를 체크하는 ajax시작의 마감
	
	});

	function plannerJoinDailyList() {
		var pidx=${viewBoard.pidx};
		$.ajax({
			url :  'http://localhost:8080/it/planner/dailyRest',
			type :  'GET',
			data : {uidx : '${viewBoard.uidx}',
					pidx : '${viewBoard.pidx}'	},
			success : function(data) {

				var html = '';
				html += '		<div>제목 : ' + data[0].ptitle + '</div>';
				html += '		<div>기간 : ' + data[0].pstartdate + '~'+data[0].penddate+'</div>';
				 for (var i = 0; i < data.length; i++) {
						html += '<div class="card">';
						html += '		<div>장소 : ' + data[i].didx + '</div>';
						html += '		<div>장소 : ' + data[i].dloc + '</div>';
						html += '</div>';
						
				
						$('#boardplanner').html(html);
				/* for (var i = 0; i < data.length; i++) {
					if(data[i].didx != 0){
					html += '<div class="card">';
					html += '		<div>장소 : ' + data[i].didx + '</div>';
					html += '		<div>장소 : ' + data[i].dloc + '</div>';
					html += '</div>';
					
			
					$('#boardplanner').html(html);
					}else{
						

						$('#boardplanner').html(html);
					} */
			}//for 문 끝
				
			}//success끝
		});
	}
</script>