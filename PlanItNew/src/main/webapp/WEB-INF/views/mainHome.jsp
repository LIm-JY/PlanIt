<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
html {
   height: 100%;
}

table {
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

a {
   text-decoration: none;
   color: #1abc9c;
}

#loginFormLogo {
   margin-top: 10px;
   margin-bottom: 0;
   font-family: 'Montserrat Alternates', sans-serif; `
   color: #1abc9c;
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
   color: #1abc9c;
   margin-top: 5px;
   margin-bottom: -10px;
}

#card-body {
   padding-top: 5px;
   height: 400px;
}

.planListBtn, .boardListBtn {
   text-align: center;
}

.form-control {
   border-radius: 0;
   font-size: 14px;
   BORDER-BOTTOM: 1px solid lightgrey;
   BORDER-LEFT: medium none;
   BORDER-RIGHT: medium none;
   BORDER-TOP: medium none;
}

/*홈 form height 고정  */
.align-middle {
   height: 515px;
}
</style>

</head>
<body>

   <%@ include file="/WEB-INF/views/include/header.jsp"%>

   <%-- ${plannerListView}; --%>
   <hr>
   <hr>
   <p>여기서 시작</p>
   <c:url value="${initParam['memberUploadPath']}" var="imagePath" />
   <c:url value="${initParam['boardUploadPath']}" var="bimagePath" />


   <hr>



   <%-- ${boardListView} --%>


   <c:if test="${!empty loginInfo}">


         
                  <div class="mainBoardList" id="mainBoardList"
            style="text-align: center;">

            <h6 style="text-align: left; font-size: 12px;">플랜 차트</h6>
            <table>
            <c:set var="i" value="0"/>
            <c:set var="j" value="1"/>            
               <c:forEach items="${plannerListView.plannerList}" var="planner">

                  <tr>
                     <td>1</td>
                     <td><img src="${imagePath}/${loginInfo.photo}" width="30px"
                        height="30px"></td>
                     <!--글쓴이 이름으로 대체할 부분!  -->
                     <td>${planner.ptitle}</td>
                     <!--제목으로 대체할 부분!  -->

                     <td>
          		<form action="http://localhost:8080/it/planner/plannerEdit" method="post">
					<div class="planner">
					<img src="${imagePath}/${loginInfo.photo}" width="30px" height="30px">
					<div class="num"style="width:20px; margin-left:6px; margin-right:6px; display: Inline-block; font-size:18px;"></div>				
					<input type="text" name="ptitle" value="${planner.ptitle}" style="width:200px; border:0; font-size:20px;" readonly>
					
					<input type="text" class="dayText"value="" style="width:115px; border:0; font-size:20px;" readonly>박
					<input type="text" class="dayText2"value="" style="width:115px; border:0; font-size:20px;" readonly>일
					
					<input type="hidden" name="pidx" value="${planner.pidx}" readonly>
					<input type="hidden" name="pstartdate" value="${planner.pstartdate}" readonly>
					<input type="hidden" name="penddate" value="${planner.penddate}" readonly>
					<input type="hidden" name="uidx" value="${planner.uidx}" readonly>
					<label for="editPlanner" class="listButton" ><a>${planner.ptitle}</a></label> '; 			
					<input type="submit" id="editPlanner" value="수정" style="display:none;"> 
	                </div>
				</form> 
                     
                     
                     
                     </td>

                     <td><i class="fa fa-thumbs-o-up" aria-hidden="true"></i></td>
                  </tr>
                  <c:set var="i" value="${i+j}"/> 
               </c:forEach>
                                   <tr> 
                       <td colspan = "5">
                       <div class = "boardListBtn">
                       <a href = "<c:url value="/planner/plannerList"/>" style ="color: #F5DEB3"> + 더보기 </a>
                       </div>
                       </td>
                    </tr>
            </table>

         </div>
         
         
         
         
         
         
         
         
         
         
         

         <hr>

         <div class="mainBoardList" id="mainBoardList"
            style="text-align: center;">

            <h6 style="text-align: left; font-size: 12px;">커뮤니티차트</h6>
            <table>
               <c:forEach items="${boardListView.boardList}" var="board">

                  <tr>
                     <td>1</td>
                     <td><img src="${imagePath}/${board.uphoto}" width="30px"
                        height="30px"></td>
                     <!--글쓴이 이름으로 대체할 부분!  -->
                     <td>${board.uname}</td>
                     <!--제목으로 대체할 부분!  -->
                     <td><a href="<c:url value="/board/${board.bidx}"/>">${board.btitle}~</a></td>

                     <td><i class="fa fa-thumbs-o-up" aria-hidden="true"></i></td>
                  </tr>
               </c:forEach>
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

   </c:if>


   <c:if test="${empty loginInfo}">
      <script>
         location.href = 'login';
      </script>
   </c:if>
</body>

</html>
<script>


$(document).ready(function(){
	dateText();
})

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
$('.dayText').eq(i).val(betweenDay);
	$('.dayText2').eq(i).val(betweenDay2);
	}
}


</script>