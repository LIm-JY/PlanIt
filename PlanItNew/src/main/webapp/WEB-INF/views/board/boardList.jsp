<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/sessionCheck.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Montserrat+Alternates:wght@600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<title>메인페이지</title>
<head>

<style>

/*버튼 디자인 */
.button-wrapper {
	display: inline-block;
	margin: 20px 5px;
	padding: 40px;
}

.dark-button, .dark-button-2 {
	background: #333;
}

.button {
	background: #fff;
	border: none;
	padding: 2px;
	cursor: pointer;
	display: block;
	position: relative;
	overflow: hidden;
	transition: all .35s ease-in-out .35s;
	margin: 0 auto;
	width: 70px;
	text-align: center;
}

.span {
	display: block;
	padding: 5px 10px;
	background: #fff;
	z-index: 100;
	position: relative;
	transition: all .35s ease-in-out .35s;
}

.button:hover span {
	background: #36B4C7;
	color: #fff;
	transition: all .35s ease-in-out .35s;
}

.button:after {
	bottom: -100%;
	right: -100%;
	content: "";
	width: 100%;
	height: 100%;
	position: absolute;
	background: #36B4C7;
	transition: all .35s ease-in-out .5s;
}

.button:hover:after {
	right: 0;
	bottom: 0;
	transition: all ease-in-out .35s;
}

.button:before {
	top: -100%;
	left: -100%;
	content: "";
	width: 100%;
	height: 100%;
	position: absolute;
	background: #36B4C7;
	transition: all .35s ease-in-out .5s;
}

.button:hover:before {
	left: 0;
	top: 0;
	transition: all ease-in-out .35s;
}

/* 여기서 부터가 화면의 css시작 */
html {
	height: 100%;
}

/*전체를 감싸는 테그*/
.boardListcontainer {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
	width: 500px !important;
	height: 700px;
	background-color: #FFFFFF;
}

table {
	width: 100%;
}

tr {
	border-bottom: 1px solid #eee;
}

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
	width: 30px;
	height: 30px;
}

#loginFormLogo {
	margin-top: 10px;
	margin-bottom: 0;
	font-family: 'Montserrat Alternates', sans-serif;
	float: left;
}

#ptext {
	float: left;
}

#card-title {
	color: #1ABC9C;
	margin-top: 5px;
	margin-bottom: -10px;
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
	height: 70px;
}

.boardListDate {
	font-size: 9px;
}

#boardListTitle {
	font-size: 14px;
	color: grey;
	height: 70px;
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

#boardListProfileTd, .number {
	width: 50px;
}



/* 글쓰기 버튼 */
#writeButton {
	position: relative;
	left: 370px;
	bottom: 90px;
}
</style>
</head>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<body>

	<div class="boardListcontainer"
		style="width: 20rem; border-radius: 20px;">
		<!--1번  시작 : 전체 영역을 감싸는 태그 -->


		<div class="card-title" id="card-title" style="text-align: center;">
			<!--2번시작 : 검색과 제목창시작  -->

			<div id="boardListHeadTitle">
				<h3 id="loginFormLogo" class="card-title text-center">community</h3>
				<br> <br>
				<p id="ptext" align="left">다양한 여행 정보를 확인해 보세요.</p>
			</div>
			<br> <br>
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
		<br> <br>


		<div class="card-body" id="card-body" style="text-align: center;">
			<!--3번  시작 :테이블 시작 -->

			<c:if test="${not empty listView}">

				<c:if test="${empty listView.boardList }">
					<div id="searchResultMsgDiv">
						<span id="searchResultMsg">조회된 글이 없습니다.</span>
					</div>
				</c:if>


				<br>

				<table id="boardlistTable">
					<c:if test="${not empty listView.boardList }">
						

						<tr>
							<td colspan="3">제목</td>
							<td>작성일</td>
							<td>좋아요</td>
						</tr>



						<form id="likeList">

							<c:set var="i" value="0" />
							<c:set var="j" value="1" />
							<c:forEach items="${listView.boardList}" var="board">
<c:url value="${initParam['memberUploadPath']}" var="imagePath" />

								<tr class="boardUser">
									<td id="boardListProfileTd">
									<img									src="${imagePath}/${board.uphoto}"></td>




									<td rowspan="2" class="number"></td>

									<td rowspan="2" id="boardListTitleTd"><a
										href="${board.bidx}"> <span id="boardListTitle">
												${board.btitle}</span></a></td>

									<td rowspan="2" class="boardListDate">${board.bregdate}</td>

									<td rowspan="2"><label for="btnLike${i}"> <span
											class="glyphicon glyphicon-heart" id="like-icon"
											style="font-size: 30px;"></span>
									</label> <input type="checkbox" id="btnLike${i}" value="${board.bidx }"
										onclick="checkLike(this);">
										<div class="joinlike"></div></td>

									<input type="hidden" name="likeInsert[${i}].bidx"
										value="${board.bidx }">
									<input type="hidden" name="likeInsert[${i}].uidx"
										value="${loginInfo.uidx }">
								</tr>

								<tr id="boardListName">
									<td>${board.uname}
								</tr>


								<c:set var="i" value="${i+j}" />

							</c:forEach>
						</form>






						<!-- 보드의 bidx가 아니라 그냥 화면에 보이는 게시글의 순서 1234 -->
						<script>
                     function reorder() {
                        //ddidx 재배치
                        $(".boardUser").each(function(i, box) {
                           $(box).find(".number").html(i + 1);

                        });
                     }

                     reorder();
                  </script>

					</c:if>
				</table>




				<br>
				<br>





			</c:if>


			<div class="paging">
				<c:if test="${listView.pageTotalCount > 0}">


					<c:forEach begin="1" end="${listView.pageTotalCount}" var="i">

						<a
							class="paging_num ${i == listView.currentPageNumber ? 'now_page' : ''}"
							href="boardList?page=${i}">${i}</a>
					</c:forEach>



				</c:if>
			</div>


		</div>
		<!--3번  끝-->
		<div class="light-button button-wrapper" id="writeButton">
			<div class="button">
				<a href="<c:url value="/board/boardWrite"/>" class="span" font-size="15px"> 글쓰기 </span>
			</div>
		</div>
	</div>
	<!--1번  끝-->



</body>

</html>
<script>


$(document).ready(function(){
   
   selcectLikeList();
   
});
 
   /* 보드의 인덱스를 리스트로 넘겨서 좋아요 정보 리스트로 얻어오기 */
   function selcectLikeList(){

      var params = $("#likeList").serialize();
      var param = $("#likeList").serializeArray();
      
      console.log(params);      
      console.log(param);

      $.ajax({
         url: '/it/board/like',
         type: "POST",
         data: param,
         success:
         function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
         for(var i=0;i<data.length;i++){
         /* $('.joinlike').eq(i).text(data[i].checkMyLike); */
         if(data[i].checkMyLike==0){
            
            $('#btnLike'+i).prop('checked',false);
            $('.glyphicon-heart').eq(i).css('color', 'lightgrey');   
            
            
         } else{
            
            $('#btnLike'+i).prop('checked',true);
            $('.glyphicon-heart').eq(i).css('color', '#1abc9c');   
            
       		  }
         
            }
         
         }
   
      });
   }

      /* 좋아요 체크 */
    function checkLike(e){
    	  
         var bidx =$(e).attr("value");
         
      if($(e).prop('checked')){
      $.ajax({
      url: '/it/board/boardView',
      type: "post",
      data: {uidx:'${loginInfo.uidx}', 
            bidx: bidx },
      success:
         
      function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
         selcectLikeList();
      }
      ,
      error:
      function (request, status, error){
      alert("저장실패"); 
      }
      });
      
      }else if(!$(e).prop('checked')){
         $.ajax({
            url: '/it/board/boardView/'+${ loginInfo.uidx}+'/'+$(e).val(),
            type: "delete",
            success:
            function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
               selcectLikeList();
            }
                  ,
            error:
            function (request, status, error){
            alert("삭제실패")
            }
            });
      }   
         
   } 

      
   /* 순서 조정 */

   function boardDel(bidx) {
      if (confirm('선택하신 게시물을 삭제하시겠습니까?')) {
         location.href = 'boardDelete?bidx=' + bidx;
      }

   }

   function boardList() {
      location.href = 'boardList';
   }
   
   
   $(window).on("scroll", function() {
      var scrollHeight = $(document).height();
      var scrollPosition = $(window).height() + $(window).scrollTop();      

      $("#scrollHeight").text(scrollHeight);
      $("#scrollPosition").text(scrollPosition);
      $("#bottom").text(scrollHeight - scrollPosition);

      if (scrollPosition > scrollHeight - 500) {         
         //todo
         $("body").append('<div id="content"></div>');
      }
   });
   
   
</script>

