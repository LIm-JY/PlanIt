<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!--아이콘  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
<style>
body{
	text-align: center;

}

#myAccountInfo {
	font-weight : bolder; 
}

#editSubmitTd {
	text-align: center;
	font-weight: bolder;
}

.editBtn {
	  text-decoration: none;
      font-size:1rem;
      color:blue;
      display:inline-block;
      border-radius: 10px;
}

#icon {
	background-image: url(../images/icons/dollar.png);
	background-repeat: no-repeat;
	background-position: 2px 3px;
}

#tableProfileImg{ 
	text-align: center;
}

#profileImage{ 
	width: 10rem;
	height: 10rem; 
	margin-top : 20px;
	border-radius: 100%;
}



#myPageContainer{
	border: 0.3px solid lightgrey;
	border-radius: 10px; 
	margin-top: 5%;
	margin-bottom: 20%;
    padding-bottom: 40px; 
	width:60%;
	text-align: center;
}

#my-page-edit-btn {
	margin-top : 10px;
	border: none;
	width: 20rem;
	background-color: #1abc9c;
	font-size: 12px; 
	font-weight: bolder;
}

#modal-edit-reset{
	margin-top : 10px;
	border: none;
	width: 20rem;
	background-color: #1abc9c;
	font-size: 12px; 
	font-weight: bolder;
}

#modal-submit{
	margin-top : 10px;
	border: none;
	width: 20rem;
	background-color: #1abc9c;
	font-size: 12px; 
	font-weight: bolder;

}




</style>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<%@ include file="/WEB-INF/views/include/sessionCheck.jsp" %>

<body>
	<!--img 경로 선언 태그  -->
	<c:url value="${initParam['memberUploadPath']}" var="imagePath"/>
	
					
			<div class="w3-container w3-display-middle" id = "myPageContainer">
				<br>
			    <img id = "profileImage" src="${imagePath}/${myInfo.uphoto}" alt="일단">
			   
			    <div class="w3-container">
			      <br>
			      <h4><b>${myInfo.uname}</b></h4>
			      
			      <hr>
			      <input type="hidden" name="uidx" value="${myInfo.uidx}" readonly>
				  <p><span><i class="glyphicon glyphicon-envelope   ///"></i></span> <br>  ${myInfo.uid}</p>			  
				   <p><span><i class="glyphicon glyphicon-phone-alt"></i></span> <br>   ${myInfo.uphonenum}</p>		   
			     
			      <hr>
			    	  <%--   <a class="editBtn"
						href="../member/memberEdit?uidx=${myInfo.uidx}">
						<button type ="button" class = "btn btn-default">
						수정하기
						</button>
						</a> --%>
				
						
						<!--수정 ver02 : 수정창 모달  -->  
						
						<!-- 모달 오픈 -->
							<button class = "btn btn-primary" 
							onclick="document.getElementById('id01').style.display='block'" 
							id ="my-page-edit-btn">수정하기</button>
						
						  	<div class="btn-group">
						      <button type="button" class="btn btn-primary dropdown-toggle" 
						      	id ="my-page-edit-btn"
						      data-toggle="dropdown">
						      	내가 작성한 글 <span class="caret"></span></button>
						      <ul class="dropdown-menu" role="menu">
						        <li><a href="#">나의 플래너 보기</a></li>
						        <li><a href="#">내가 쓴 게시글 보기</a></li>
						      </ul>
						    </div>
						   
 					
					
					<br>
						
						<p> 　</p> <!-- 공백을 위함  -->
				 </div>
				 
				 <!-- 회원정보 수정 모달창 -->
			    </div>
			    
			   		 <div id="id01" class="w3-modal">
						<div class="w3-modal-content" id = "modal-content">
						   <div class="w3-container">
						   		
						   		<!--모달 닫기 창  -->
						      <span onclick="document.getElementById('id01').style.display='none'" 
						      		id = "close"
						        	class="w3-button w3-display-topright">&times;</span>
						        <br>
						        <p>회원정보수정 </p> 
						        <br>
						        <div class ="w3-container">
						        
						        	<form action="http://localhost:8080/it/member/myPage" class="form-horizontal" 
						        		id="editForm" method="post" style = "margin: auto; width: 400px;" 
											enctype="multipart/form-data">
								
											<input type="hidden" name="uidx" value="${myInfo.uidx}" readonly>
								
											<div class="form-group">
												<div class="col-sm-8">
													<input type="email" class="form-control" id="uid" name="uid"
														value="${myInfo.uid}" readonly>
												</div>
											</div>
								
											<div class="form-group">
												<div class="col-sm-8">
													<input type="text" class="form-control" id="uname" name="uname"
														value="${myInfo.uname}" required>
												</div>
											</div>
								
											<div class="form-group">
												<div class="col-sm-8">
													<input type="password" maxlength ="12" class="form-control" id="upw"
														placeholder="새로운 비밀번호를 입력하세요." name="upw" minlength="6" required>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-8">
													<input type="password" maxlength ="12" class="form-control" id="chkUpw"
														placeholder="비밀번호를 한번 더 입력하세요." name="chkUpw" required>
												</div>
												<div id = "checkmsgDiv">
								       			<span  id="checkmsg03"></span>
								       			</div>
											</div>
								
											<div class="form-group">
												<div class="col-sm-8">
													<input type="text" class="form-control" id="uphonenum"
														name="uphonenum" value="${myInfo.uphonenum}" required>
												</div>
											</div>
								
											<div class="form-group">
												<div class="col-sm-8">
													<input type="file" id="uphoto" name="photo">
													
													<br> <%-- 현재
													프로필 사진 : ${member.uphoto} --%> 
													<input type="hidden" name="oldFile" value="${myInfo.uphoto}">
												</div>
									
												<label class="control-label col-sm-4" for="submit"></label>
												<div class="col-sm-6">
													<button class = "btn btn-primary" id ="modal-submit" type="submit">수정완료</button>
													<button class = "btn btn-primary" id = "modal-edit-reset" type ="reset">취소</button>
												</div>
											</div> 
								
								<!-- 		 	<div class="form-group" style = "margin :auto;">
												<div class="col-sm-offset-2 col-sm-10">
													<button type="submit" class="btn btn-default">진짜수정하기</button>
												</div>
											</div>  -->
								</form>
						        
						        
						        </div>
						    </div>
						  </div>		
					</div>

			
	
<!-- 카카오 확인 -->			
<%-- 			<table class="table table-c">

				<c:set var="ukakao" value="${myInfo.ukakao}" />
				<c:if test="${ukakao eq N}">
					<tr>
						<th>아이디(이메일)</th>
						<td class="w3-right-align">${myInfo.uid}</td>
					</tr>
				</c:if>
	

			</table> --%>



</body>
</html>

<script>
	console.log(typeof ('${myInfo.ukakao}'));
	
	$(document).ready(function() { 
		
			/*모달 리셋 적용 시 창 꺼지게 하기 */
			$('#modal-edit-reset').click(function(){
				
				/* 셋중에 하나는 먹겠지.. 8ㅅ8 */
				$('#id01').css("display","none");
				/* $('#id01').style.display="none"; */
				/* $('#id01').modal("hide") */; 
				
			});
		
		
			/*비밀번호 다를 시  */
			$('#chkUpw').focusout(function() {
				if ($('#upw').val() != $('#chkUpw').val()) {
					$('#checkmsg03').css("color","red");
					$('#checkmsg03').css("font-size","12px");
					$('#checkmsg03').text("비밀번호가 다릅니다.");
					return false;
			} else{
				$('#checkmsg03').text("");
			}			
		});
			
			$('#editForm').submit(function() {
				if ($('#upw').val() != $('#chkUpw').val()) {
					$('#upw').focus();
					return false;
				}
			});
	});
</script>