<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>


<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<head>
<meta charset="UTF-8">
<title>뷰페이지</title>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/default.css">

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<c:url value="${initParam['boardUploadPatd']}" var="imagePatd" />
	<br>
	<br>
	<table class="table" border="1">
		<tr>
			<td>게시글 제목</td>
			<td colspan="3">${viewBoard.btitle}</td>
		</tr>

		<tr>
			<td>작성자</td>
			<td>${viewBoard.uname}</td>
			<td colspan="2">${viewBoard.bregdate}</</td>
		</tr>

		<tr>
			<td>내용</td>
			<td colspan="3">${viewBoard.bmsg}</td>
		</tr>


		<tr>
			<td>사진</td>
			<td colspan="3"><img alt="사진 "
				src="${imagePatd}/${viewBoard.bphoto1}"></td>
		</tr>

		<tr>
			<td>사진</td>
			<td colspan="3"><img alt="사진 "
				src="${imagePatd}/${viewBoard.bphoto2}"></td>

		</tr>

		<tr>
			<td colspan="3" id="boardplanner"></td>

		</tr>
	</table>


	<div id="editdel"></div>

	<c:if test="${not empty commentistView}">
		<table class="table" border="1">
			<tr>
				<td>작성자</td>
				<td>댓글 내용</td>
				<td>댓글 작성시간</td>

			</tr>

			<c:if test="${not empty commentistView.commentList }">
				<c:forEach items="${commentistView.commentList}" var="comment">
					<tr>

						<td>${comment.uname}</td>
						<td>${comment.cmsg}</td>
						<td>${comment.cregdate}</td>
						<td><a href="javascript:commentDel(${comment.cidx})">댓글삭제</a>|
							<a href="../comment/commentEdit?cidx=${comment.cidx}">댓글수정</a></td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${empty commentistView}">
				<tr>

					<td colspan="3">첫번째 댓글을 남겨주세요~♡</td>

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
	
	
	/* 게시글을 볼 때 내가쓴글이면 수정삭제가보임. 내가쓴글이 아니면 안보임.
	      플래너가 있으면 플래너 리스트를 보여줌. 플래너 리스트가 없으면 안보여줌.*/
$(document).ready(function(){
	
	var uidx = ${viewBoard.uidx};
		var loginuidx = ${loginInfo.uidx};
		console.log(uidx);  
		console.log(loginuidx);
		
		if(uidx == loginuidx){
			
			var html = '';
			
			html += '<h1>';
			html +='<a href="boardEdit?bidx=${viewBoard.bidx}">게시글 수정</a>| ';
			html +='<a href="javascript:boardDel(${viewBoard.bidx})">게시글 삭제</a>';
			html += '<h1>';
			
			$('#editdel').html(html);
		}
	
	
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
		$.ajax({
			url :  'http://localhost:8080/it/planner/dailyRest',
			type :  'GET',
			data : {uidx : '${viewBoard.uidx}',
					pidx : '${viewBoard.pidx}'	},
			success : function(data) {

				var html = '';
				
				if(data[0].pidx != 0){
				html += '		<div>제목 : ' + data[0].ptitle + '</div>';
				html += '		<div>기간 : ' + data[0].pstartdate + '~'+data[0].penddate+'</div>';
				 for (var i = 0; i < data.length; i++) {
						html += '<div class="card">';
						html += '		<div>장소 : ' + data[i].didx + '</div>';
						html += '		<div>장소 : ' + data[i].dloc + '</div>';
						html += '</div>';
						}
				
						$('#boardplanner').html(html);
						
				 }else {
					 $('#boardplanner').html(html);
				 }

				
			}//success끝
		});
	}
	


</script>