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
<style>
	
	body{
	width: 100%;
	}
	#atag{
	 text-decoration:none;
	 
	 font-size: 30px;
	}
	
	.boardViewTable{
	right: 300px;
	border-top: 1px solid red;
	border-left: 1px solid red;
	}
	
	.article1{
	border: 1px solid blue;
	}
	
	.article1Container{
	border: 1px solid red;
	}
	
	#btitle{
	font-size: 25px;
	
	}
	
	#uphoto{
	float: left;
	margin-top: 5px;
	}
	
	#uname{
	margin-left:40px;
	left:50px;
	bottom : 35px;
	
	}
	#edeitdel{
	float: left;
	}

	
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	

	
	<div class="article1">
	
		<div id="editdel">
				        
		
		</div>
		<div id="listTag">
			<a id="atag" href="<c:url value="/board/boardList"/>"> 게시글 목록 </a> 
		</div>
		
		
	<div class="article1Container">
	
		<div id="btitle">
			${viewBoard.btitle}
		</div>
		
		<div id="uphoto">
		<c:url value="${initParam['memberUploadPath']}" var="imagePath" />
		<img src="${imagePath}/${viewBoard.uphoto}" width="30px" height="30px">
		</div>
		
		<div id="uname">
			${viewBoard.uname}<br>
			${viewBoard.bregdate}
		</div>
		
		<div>
			<form id="like_form" method="post" enctype = "multipart/form-data" onsubmit="return false;">
				<table id="list">
				<%@ include file="/WEB-INF/views/include/sessionCheck.jsp"%>
				
				
				<tr>
				<td><input type="hidden" name="bidx" value="${viewBoard.bidx}" readonly>
				<input type="hidden" name="uidx" value="${loginInfo.uidx}" readonly>
<!-- 				style="display:none;"
 -->				<label for="btnLike" onclick="checkLike();">
				<img id="like_img"alt="식당" class="dtypeIcon" src="/it/resources/images/unlike.png" width="30px" height="30px"></label>
				<input type="checkbox" id="btnLike" >
					<div id="like_result" style="display:inline-block;">좋아요갯수넣을자리</div> </td>
					
				</tr>
				</table>
			</form>

		</div>
		
		<hr>
		
		<div id="bmsg">
			${viewBoard.bmsg}
		</div>
		
		<div id="bphoto1">
			${viewBoard.bphoto1}
		</div>
		
		<div id="bphoto2">
			${viewBoard.bphoto2}
		</div>
		
		<div id="boardplanner">
			
		</div>
		
		
		
		</div>
	</div>

	
	<br>
	<br>
	
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
						<td><a id="atag" href="javascript:commentDel(${comment.cidx})">댓글삭제</a>|
							<a id="atag" href="../comment/commentEdit?cidx=${comment.cidx}">댓글수정</a></td>
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

function likeAllSelect() {
	$.ajax({
		
		url: 'http://localhost:8080/it/board/boardView/'+${viewBoard.bidx},
		type: "get",
		/* data: {uidx:'${loginInfo.uidx}', 
			   bidx: '${viewBoard.bidx}'}, */
		success:
		function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data

			
			$("#like_result").text(data);
			
		}
		});
		

}




function likeSelect() {
	$.ajax({
		url: 'http://localhost:8080/it/board/boardView/'+${loginInfo.uidx}+'/'+${viewBoard.bidx},
		type: "get",
		/* data: {uidx:'${loginInfo.uidx}', 
			   bidx: '${viewBoard.bidx}'}, */
		success:
		function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
			console.log(data);
			if(data == 1){
				 $('img#like_img').attr('src', '/it/resources/images/like.png');
					$('#btnLike').prop('checked', true);

			}else if(data == 0){
				 $('img#like_img').attr('src', '/it/resources/images/unlike.png');		
					$('#btnLike').prop('checked', false);

			}
		// data중 put한 것의 이름 like
		}
		});

}







function checkLike(){

if(!$('#btnLike').prop('checked')){
	
	$.ajax({
	url: 'http://localhost:8080/it/board/boardView',
	type: "POST",
	data: {uidx:'${loginInfo.uidx}', 
		   bidx: '${viewBoard.bidx}'},
	success:
		
	function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
		likeAllSelect();
		likeSelect();
	}
		   ,
	error:
	function (request, status, error){
	alert("ajax실패")
	}
	});
	
	}else if($('#btnLike').prop('checked')){
		
		console.log("delete");
		$.ajax({
			url: 'http://localhost:8080/it/board/boardView/'+${loginInfo.uidx}+'/'+${viewBoard.bidx},
			type: "delete",
			/* data: {uidx:'${loginInfo.uidx}', 
				   bidx: '${viewBoard.bidx}'}, */
			success:
			function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
			// $('img#like_img').attr('src', '/it/resources/images/unlike.png');// data중 put한 것의 이름 like
				likeAllSelect();
				likeSelect();
			}
				   ,
			error:
			function (request, status, error){
			alert("ajax실패")
			}
			});
	}	
		
	
	
}
	

 
 


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
	
	likeAllSelect();
	likeSelect();
	
	var uidx = ${viewBoard.uidx};
		var loginuidx = ${loginInfo.uidx};
	
		var likebidx=${viewBoard.bidx};

		
		if(uidx == loginuidx){
			
			var html = '';
			
			html += '<h1>';
			html +='<a id="atag" href="boardEdit?bidx=${viewBoard.bidx}">게시글 수정</a>| ';
			html +='<a id="atag" href="javascript:boardDel(${viewBoard.bidx})">게시글 삭제</a>';
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
				if(typeof(data[0]) != 'undefined'){
				html +='<hr>';	
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
					// $('#boardplanner').html(html);
				 }

				
			}//success끝
		});
	}
	


</script>