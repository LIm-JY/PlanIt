<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Montserrat+Alternates:wght@600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

    <title>메인페이지</title>
<head>

   <style> 
       
     html {
  		 height: 100%;
    
    }  

	
	table{
		width: 100%;
	    border-collapse: collapse;	
	}
	
	th, td {
    border: 1px solid lightgrey;
  }
	
	hr {
		width: 85%;
	    border: 0;
	    border-top: 1px solid #eee;
	}
	
	a{
		text-decoration: none;
		color: #1abc9c;
	}
     
    #loginFormLogo{
    	margin-top:10px; 
    	margin-bottom: 0;
	    font-family: 'Montserrat Alternates', sans-serif;
`	    color: #1abc9c;
    }
    
    
    /*로그인 폼(카드) 위치*/
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	#card-title {
		color: #1abc9c;
		margin-top: 5px;
		margin-bottom: -10px;
	}
	
	#card-body{
	 padding-top: 5px;
	 height: 400px;
	
	}

	
	.planListBtn, .boardListBtn{
		text-align : center; 
		}	
	
	.form-control {
		
		border-radius: 0;
		font-size : 14px;
		BORDER-BOTTOM: 1px solid lightgrey;
		BORDER-LEFT: medium none;
		BORDER-RIGHT: medium none;
		BORDER-TOP: medium none;
		
	}
	
	/*홈 form height 고정  */
	.align-middle{
		height: 515px;
	}
	
    </style>



</head>
<body>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<%-- ${plannerListView}; --%>
<hr>
<hr><p>여기서 시작</p>
<c:url value="${initParam['memberUploadPath']}" var="imagePath" />

<c:forEach items="${boardListView.boardList}" var="board">

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
<hr>



<%-- ${boardListView} --%>


<c:if test="${!empty loginInfo}">	

	<!-- 헤더를 제외한 전체를 감싸는 div -->
	<div class = "card">
           
                
                <div class="mainPlanList" id ="mainPlanList"> <!-- style = "text-align : center;" -->
              
              		<c:if test="${not empty plannerListView}">
              			<h6 style = "text-align : center;"> 나의 플랜</h6> 
	              			<div>
	              				 				<table>             	
	               		<tr> 
	              			<td>1</td>
	              			<td>이거는 </td>
	              			<td>
	              				<i class="fa fa-plus-circle" aria-hidden="true"></i>
	              			</td>
	              			<td>
	              				<i class="fa fa-pencil" aria-hidden="true"></i>
	              			</td>
	              			
	              		</tr>
	       				<tr> 
	              			<td>2</td>
	              			<td>제주도 2박3일</td>
	              			<td>
	              				<i class="fa fa-plus-circle" aria-hidden="true"></i>
	              			</td>
	              			<td>
	              				<i class="fa fa-pencil" aria-hidden="true"></i>
	              			</td>
	              		</tr>
	              		<tr> 
	              			<td>3</td>
	              			<td>다음주 여행</td>
							<td>
	              				<i class="fa fa-plus-circle" aria-hidden="true"></i>
	              			</td>
	              			<td>
	              				<i class="fa fa-pencil" aria-hidden="true"></i>
	              			</td>
	              		</tr>
	              		<tr> 
	              			<td colspan = "4">
	              			<div class = "planListBtn">
	              			<a href = "<c:url value="/planner/plannerList"/>">
	              				<i class="fa fa-plus-circle" aria-hidden="true" style ="color: #F5DEB3;"></i></a>
	              			</div>
	              			</td>
	              		</tr>
              	</table>
	              			</div>
              		</c:if>
              		
              		<c:if test="${empty plannerListView }">
	              			<div>
	              			플랜 없음
	              			 플랜잇을 통해 당신의 
	              			 여행 첫 플랜을 만들어서 공유해 보세요!
	              			
	              			</div>
              		</c:if>

              	
    
              	 
                </div>
       
       			<hr> 
       			
               
       			
                <div class="mainBoardList" id ="mainBoardList" style = "text-align : center;">
                
                <h6 style = "text-align : left; font-size: 12px;"> 플랜 차트</h6> 
               
                <table>
              		<tr> 
              			<td>1</td>
              			<td>
             				<!-- 본인 프로필 사진으로 대체할 부분!  -->
              				<i class="fa fa-user" aria-hidden="true"></i>
              			</td>
              			<!--글쓴이 이름으로 대체할 부분!  -->
              			<td>창일</td>
              			<!--제목으로 대체할 부분!  -->
              			<td>안녕하세요~</td>
              			
              			<td>
              				<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
              			</td>
              		</tr>
       				<tr> 
       					<td>2</td>
       					<td>
              				<i class="fa fa-user" aria-hidden="true"></i>
              			</td>
              			<td>현정</td>
              			
              			<td>제주도로 오세요</td>
              			
              			<td>
              				<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
              			</td>
              		</tr>
              		<tr>
              			<td>3</td>
              			<td>
              				<i class="fa fa-user" aria-hidden="true"></i>
              			</td> 
              			<td>미선</td>
              			<td>즐거운 목포 여행</td>
              			
              			<td>
              				<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
              			</td>
              		</tr>
              		<tr> 
              			<td colspan = "5">
              			<div class = "boardListBtn">
              			<a href = "<c:url value="/board/boardList"/>" style ="color: #F5DEB3"> + 더보기 </a>
              			</div>
              			</td>
              		</tr>
              	</table>
   			
                </div>
               
      		
		</div>
	</div>
 	
</c:if>
	

<c:if test="${empty loginInfo}">
	<script>
		location.href = 'login'; 
	</script>
</c:if>
</body>



