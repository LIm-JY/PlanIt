<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/sessionCheck.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 글 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<style>
/* 파일업로드 css */
.file_box {
	position: relative;
	margin-top: 30px;
	font-size: 0;
}

.file_box input[type="file"] {
	position: absolute;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

/* 업로드글자 */
.file_box label {
	/* line-height: 0; */
	cursor: pointer;
	font-size: 14px;
	color: #0fb5bf;
}

/* 파일 이름 */
.file_box .bphoto1 {
	position: absolute;
	height: 40px;
	line-height: 40px;
	text-align: center;
	/* 네이티브 외형 감추기 */
	/* 	-webkit-appearance: none; 
	-moz-appearance: none;
	appearance: none; */
	font-size: 14px;
	color: #a8a8a8;
	left: 160px;
	width: 339px;
	bottom: -0.7px;
border-bottom: 1px solid lightgrey;
}

/* 파일 이름 */
.file_box .bphoto2 {
	position: absolute;
	height: 40px;
	line-height: 40px;
	text-align: center;
	/* 네이티브 외형 감추기 */
	/* 	-webkit-appearance: none; 
	-moz-appearance: none;
	appearance: none; */
	font-size: 14px;
	color: #a8a8a8;
	left: 160px;
	width: 339px;
	bottom: -0.7px;
	border-bottom: 1px solid lightgrey;
}

/* 버튼 css시작 */

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
/* white */
#submitTableTd {
	border-bottom: 1px solid white;
	height: 70px;
}

td {
	width: 30px;
	height: 40px;
	border-bottom: 1px solid lightgrey;
}

#file_box_td{
 border-bottom: 1px solid lightgrey;
}

/*작성자 입력란  */
input, textarea {
	border: 1px solid white;
	width: 100%;
	resize: none;
}

textarea {
	width: 335px;
	height: 350px;
}

input:focus, textarea {
	outline: white;
}

#inputTdHidden {
	border-bottom: 1px solid white;
}

#card-title {
	color: #1ABC9C;
	margin-top: 5px;
	margin-bottom: -10px;
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

#inputTd {
	width: 70px;
}

#modalTileTd {
	text-align: left;
}

#card-body {
	padding-top: 5px;
	height: 400px;
}

#modalTilelabelTd {
	padding-top: 7px;
}

.indexNum-p {
	width: 50px;
	color: darkslategray;
	font-size: 12px;
	text-align: center;
}

#main-h6-title {
	font-weight: bolder;
	text-align: left;
	font-size: 13px;
	color: dimgrey;
	padding-left: 3px;
	font-family: 'Nanum Gothic', sans-serif;
}

#main-ptitle-a {
	color: dimgrey;
	font-weight: 500;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 13.5px;
}

#main-ptitle-a, #board-content-title {
	color: dimgrey;
	font-weight: 500;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 13.5px;
}

#start-end-date {
	margin-bottom: 0px;
	font-size: 11px;
}

#main-board-uname {
	font-size: 10px;
	color: dimgrey;
}

/* 버튼 설정 */
#writeButton {
	margin-left: 2px;
	text-decoration: none;
	font-size: 12px;
	color: grey;
		text-align: center;
		padding: 5px 14px;
}

#writeButton:hover {
	color: white;
	background-color: #1abc9c;
}

.pager {
	display: inline-block;
	
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 15px;

	margin: 20px 0;

}

.span{
text-align: center;
}

/* 모달 설정 시작 */
/* 모달 백그라운드*/
.modal {
	position: relative;
	width: 600px; /* Full width */
	height: 200px; /* Full height */
	/*background-color: rgb(0,0,0);  Fallback color */
	background-color: white; /*Black w/ opacity,0.4 */
	margin: auto;
	border: 1px solid darkslategray;
	border-radius: 10px;
}
/* Modal Content/Box */
.modal-content {
	background-color: whitesmoke;
	margin: 5% auto; /* 15% from the top and centered */
	/*border: 1px solid lightsteelblue;*/
	width: 100%; /* Could be more or less, depending on screen size */
}

.modalInTable {
	border-collapse: collapse;
}

/* The Close Button */
.close {
	position: absolute;
	top: 15px;
	right: 10px;
	z-index: 999;
	text-align: right;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* 썸머노트 에디터 설정 */
.note-editor .note-editing-area .note-editable {
	outline: none;
	height: 500px;
}

.jumbotron {
	padding-top: 0px !important;
	padding-bottom: 0px !important;
	background-color: white !important;
}

.note-toolbar {
	background-color: #1ABC9C !important;
}

.note-btn {
	color: #1ABC9C !important;
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
			<h3 id="loginFormLogo" class="card-title text-center">community
				Write</h3>
			<br> <br>
			<p id="ptext" align="left">${loginInfo.uname}님이작성중인글입니다.</p>
			<br>
			<hr>
		</div>

		<div class="card-body" id="card-body" style="text-align: center;">
			<!--3번  시작 :테이블 시작 -->
			<br>
			<form method="post" enctype="multipart/form-data">
				<table id="boardlistTable">

					<tr>
						<td><input type="hidden" id="uidx" name="uidx"
							value="${loginInfo.uidx }" readonly> <input type="hidden"
							id="uname" name="uname" value="${loginInfo.uname }" readonly>

							<label for="btitle">제목</label></td>

						<td id="inputTd"><input type="text" id="btitle" name="btitle"
							minlength="4" maxlength="10" placeholder="10글자 이내로 입력해주세요"
							required></td>
					</tr>

					<tr id="myBtn">
						<td id="modalTilelabelTd"><label for="pidx">일정 </label></td>
						<td id="modalTileTd"><input type="hidden" name="pidx"
							id="pidx" class="pidx"> <span class="mptitle"></span></td>

					</tr>
					<tr>
						<td colspan="2" id="inputTd" class="jumbotron p-1"><label
							id="insertText" onclick="insertText()" type="button"
							data-toggle="collapse" data-target="#view-comments">여행
								정보를 입력해 주세요</label>



							<div id="view-comments" class="collapse">
								<textarea id="bmsg" class="summernote" name="bmsg"
									placeholder="내용을 입력해 주세요"></textarea>
							</div></td>
					</tr>

					<tr>
						<td id="file_box_td">
							<div class="file_box">
								<label for="input_file">사진첨부</label> <input type="file"
									id="input_file" class="file_hidden1"> <input
									class="bphoto1" value="선택파일 없음" name="bphoto1"
									disabled="disabled" id="bphoto1">
							</div>
						</td>
					</tr>

					<tr >
						<td id="file_box_td">
							<div class="file_box">
								<label for="input_file1">사진첨부</label> <input type="file"
									id="input_file1" class="file_hidden2"> <input
									class="bphoto2" value="선택파일 없음" name="bphoto2"
									disabled="disabled" id="bphoto2">
							</div>
						</td>
					</tr>








				</table>
				
				
				<br><br>
				<table id="submitTable">
					<tr>
					<td id="submitTableTd"></td>
						<td id="submitTableTd">
							<button type="submit" class="pager" id="writeButton"
								name="submit" value="Submit">
								<span class="span" style="font-size: 14px;">작성완료 </span>
							</button>
						</td>
						<td id="submitTableTd">

							<button type="reset" class="pager" id="writeButton">
								<span class="span" style="font-size: 14px;">내용지우기 </span>
							</button>
						</td>

						<td id="submitTableTd">

							<button type="reset" class="pager" id="writeButton">
								<a href="<c:url value="/board/boardList"/>" class="span"
									style="font-size: 14px;">작성취소 </a>
							</button>
						</td>
						<td id="submitTableTd"></td>
					</tr>

				</table>
			</form>

			<br> <br>
		</div>
		<!--3번  끝-->

		<div id="myModal" class="modal">

			<!-- 맨위에 플래너 제목과 확인버튼 하기. -->
			<h6 id="main-h6-title">나의 플랜</h6>
			<span class="close">확인</span>


			<!-- Modal content -->
			<div class="modal-content" id="modal-content">

				<c:if test="${not empty dailyList }">
					<c:forEach items="${dailyList}" var="daily">

						<table>

							<tr class="userIndex-p">
								<td class="indexNum-p"></td>

								<!--글쓴이 이름으로 대체할 부분!  -->
								<td><label for="editPlanner" class="listButton">
										<button class="ptitle" id="${daily.pidx}">${daily.ptitle}
										</button>
								</label></td>

								<td><p id="start-end-date">${daily.pstartdate}~
										${daily.penddate}</p></td>

								<!--제목으로 대체할 부분!  -->
								<td>
									<div class="planner">
										<div class="num"
											style="width: 20px; margin-left: 6px; margin-right: 6px; display: Inline-block; font-size: 18px;"></div>


										<span class="dayText"></span>박 <span class="dayText2"></span>일
										<input type="hidden" name="pidx" value="${daily.pidx}"
											readonly> <input type="hidden" name="pstartdate"
											value="${daily.pstartdate}" readonly> <input
											type="hidden" name="penddate" value="${daily.penddate}"
											readonly> <input type="hidden" name="uidx"
											value="${daily.uidx}" readonly>

									</div> <!-- 보드의 bidx가 아니라 그냥 화면에 보이는 게시글의 순서 1234 --> <script>
										function reorder() {
											//ddidx 재배치
											$(".userIndex-p").each(
													function(i, box) {
														$(box).find(
																".indexNum-p")
																.html(i + 1);

													});
										}

										reorder();
									</script>
								</td>

							</tr>

						</table>
					</c:forEach>
				</c:if>
			</div>
		</div>





	</div>
	<!--1번  끝-->










	<script>

        $(document).ready(function () {
     

            // 실행시 언어 설정을 한글로 설정 

            $.summernote.options.lang = 'ko-KR';

            $.summernote.options.airMode = false;

        });

 

        var a = $('.summernote');

 

        
        var insertText = function () {

            // 현재 커서 위치에 'hello world'라는 텍스트 생성 

            a.summernote('editor.insertText', '');

        };

 

 

        var empty = function () {

            // summer note empty 여부 확인 

            if (!a.summernote('isEmpty')) {

                alert('에디터 안에 글 존재함');

            }

        };

    



    </script>




</body>
</html>
<script>
/* 썸머노트 사용 */
$(document).ready(function() {
	//여기 아래 부분
	
	
	

 	$('.summernote').summernote({
		height: 900,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: 900,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
		  
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	  }); 
});
 

	  
	  
	  
	//Get the modal
	var modal = document.getElementById("myModal");

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	//var aaa = document.getElementsByClassName("aaa")
	// When the user clicks on the button, open the modal
	btn.onclick = function() {
		modal.style.display = "block";

	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {

		modal.style.display = "none";

	}

	//모달에서 받아오는 정보. 
	$(".ptitle").on("click", function() {

		//모달에서 플래너제목을 선택하면 바디의 스판에 들어간다.
		var text = $(this).text();
		$(".mptitle").text(text);

		//모달에서 플래너 제목을 선택하면 바디에 히든으로 감춰둔 input에 들어간다.
		var title = $(this).attr("id");
		$(".pidx").val(title);

		modal.style.display = "none";

	});

	/* 파일명 가져오기 start */
	var fileTarget1 = $('.file_box .file_hidden1');

	fileTarget1.on('change', function() {
		if (window.FileReader) {
			// 파일명 추출
			var filename = $(this)[0].files[0].name;
			console.log(filename);
		} else {
			// Old IE 파일명 추출
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		;

		$(this).siblings('.bphoto1').val(filename);
	});
	/* 파일명 가져오기 end */

	/* 파일명 가져오기 start */
	var fileTarget2 = $('.file_box .file_hidden2');
	console.log(fileTarget2);
	fileTarget2.on('change', function() {
		if (window.FileReader) {
			// 파일명 추출
			var filename = $(this)[0].files[0].name;
		} else {
			// Old IE 파일명 추출
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		;

		$(this).siblings('.bphoto2').val(filename);
	});
	/* 파일명 가져오기 end */
	
	
	
	
	
	
	
	/* *박*일로 표시하게하는거 */
	$(document).ready(function(){
   dateText();
});

function dateText(){
   
   for(var i=0;i<$('input[name=pstartdate]').length;i++){
   
var sdd=$('input[name=pstartdate]').eq(i).val();
var edd=$('input[name=penddate]').eq(i).val();
var ar1 = sdd.split('-');
var ar2 = edd.split('-');
var curr = new Date(ar1[0], ar1[1], ar1[2]);
var end = new Date(ar2[0], ar2[1], ar2[2]);
var betweenDay =( (end.getTime() - curr.getTime()) / 1000 / 60 / 60 / 24);
var betweenDay2 = betweenDay+1;

console.log(betweenDay);
$('.dayText').eq(i).text(betweenDay);
   $('.dayText2').eq(i).text(betweenDay2);
   }
}

</script>