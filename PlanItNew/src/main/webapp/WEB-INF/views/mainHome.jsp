<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

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
   border-bottom: 1px solid lightgrey;
}

hr {
   width: 85%;
   border: 0;
   border-top: 1px solid #eee;
}

a {
   text-decoration: none;
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

.planListBtn, .more-info-btn {
   text-align: center;
   margin-top : 10px;
   margin-bottom: 10px;
   font-weight: bold;
}

.form-control {
   border-radius: 0;
   font-size: 14px;
   BORDER-BOTTOM: 1px solid lightgrey;
   BORDER-LEFT: medium none;
   BORDER-RIGHT: medium none;
   BORDER-TOP: medium none;
}

.main-home-container {
   width: 60%;
   margin-left: auto;
   margin-right: auto;
}

/*홈 form height 고정  */
.align-middle {
   height: 515px;
}

#table-board-profile {
   padding-top: 2px;
   pdding-bottom: 2px;
   width: 3.5em;
   height: 3.5em;
   border-radius: 100%;
   margin-top: 3px;
   margin-bottom: 3px;
}

#loginFormLogo {
   margin-top: 10px;
   margin-bottom: 0;
   font-family: 'Montserrat Alternates', sans-serif;
   float: left;
}

.indexNum-b, .indexNum-p {
   width: 50px;
   color: darkslategray;
   font-size: 12px;
   text-align: center;
}

#board-content-title{
   color: dimgrey;
 }

#main-h6-title{
    font-weight: bolder;
    text-align: left;
    font-size: 13px; 
    color: dimgrey;
    padding-left: 3px;
    font-family: 'Nanum Gothic', sans-serif;
    
}

.main-table-box{
   background-color: whitesmoke;
   padding : 20px;
   padding-bottom: 0px;
}

#main-ptitle-a, #board-content-title{
   color: dimgrey;
   font-weight: 500;
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 13.5px;
}

#start-end-date{
   margin-bottom: 0px;
   font-size: 11px;
   
}

#more-info-btn-td{
   border-bottom : 1px solid whitesmoke;
}

#plan-link-btn{
   width: 50px;
    border-radius: 6px;
    border: hidden;
    background-color: #1abc9c;
    color: white;
    font-weight: 400;
    height: 26px;
    font-size: 13px;
    font-family: 'Nanum Gothic', sans-serif;
}

#main-board-uname{
    font-size: 10px;
    color: dimgrey;
}

.num{
   text-align: left;
    font-size: 13PX;
    color: dimgrey;
}

#day-text{
   font-size: 13PX;
    color: dimgrey;
}

#main-empty-box{
   text-align: center;
   height: 110px;
   font-family: 'Nanum Gothic', sans-serif;
   font-size: 13px;
}

.fa-plus-circle{
   color: #1abc9c;
   width: 20px;
    font-size: xx-large;
}

.fa-plus-circle:before {
    font-size: xx-large;
}


</style>

</head>

<body>

   <%@ include file="/WEB-INF/views/include/header.jsp"%>

   <%-- ${plannerListView}; --%>

   <div class="main-home-container" id="main-home-container">

      <div id="MainHeadTitle">
         <h3 id="loginFormLogo" class="card-title text-center"
            style="color: #1abc9c;">
            <span id="mainFormLogo">Home</span>
         </h3>
         <br><br>
         <p id="ptext" align="left">다양한 여행 정보를 확인해 보세요.</p>
      </div>
      <br>


      <c:url value="${initParam['memberUploadPath']}" var="imagePath" />
      <c:url value="${initParam['boardUploadPath']}" var="bimagePath" />




      <!-- 메인화면 '나의 플랜' 리스트  -->

      <div class="mainPlanList" id="mainPlanList">

         <h6 id = "main-h6-title">나의 플랜</h6>
         
         <div class = "main-table-box">
         
         <c:if test="${empty plannerListView.plannerList }">
            
            <div class = "main-empty-box" id = "main-empty-box">
               
               <a href="<c:url value="/board/boardWrite"/>"><span class="fa fa-plus-circle"></span></a>
               <p style ="margin-top: 10px;"> 플랜잇을 통해 당신의 <br> 여행 첫 플랜을 만들어서공유해 보세요! </p>
            
            
            </div>
            
   
         
         </c:if>
         
         <!--플래너가 있을때  -->
         <c:if test="${not empty plannerListView.plannerList }">
         <table>
            <c:set var="i" value="0" />
            <c:set var="j" value="1" />
            <c:forEach items="${plannerListView.plannerList}" var="planner">

                <tr class ="userIndex-p">
                  <td class = "indexNum-p"></td>
                  <td><img id="table-board-profile" src="${imagePath}/${loginInfo.photo}" width="30px"
                     height="30px"></td>
                  <!--글쓴이 이름으로 대체할 부분!  -->
                  <td><label for="editPlanner" class="listButton">
                     <a id = "main-ptitle-a">${planner.ptitle}</a></label>
                     <p style ="margin-bottom: 0px; font-size: 11px;color: grey; padding-left: 2px;">${planner.pstartdate} ~ ${planner.penddate}</p>
                     
                     <input type="submit" id="editPlanner" value="수정"
                     style="display: none;">
                  </td>
                     
                     
                  <!--제목으로 대체할 부분!  -->
                  <td>
                     <form action="http://localhost:8080/it/planner/plannerEdit"
                        method="post">
                        <div class="planner">
                           <div class="num"
                              style="width: 20px; margin-left: 6px; margin-right: 6px; display: Inline-block;"></div>


                           <%--    <p>${planner.pstartdate} ~ ${planner.penddate}</p> --%>
                              
                              
                              <span class ="dayText" id="day-text"></span><span id ="day-text">박</span>
                              <span class ="dayText2" id="day-text"></span><span id ="day-text">일</span>
                           <input type="hidden" name="pidx" value="${planner.pidx}" readonly> 
                           <input type="hidden" name="pstartdate" value="${planner.pstartdate}" readonly> 
                           <input type="hidden" name="penddate" value="${planner.penddate}" readonly> 
                           <input type="hidden" name="uidx" value="${planner.uidx}" readonly>

                        </div>
                        <!-- 보드의 bidx가 아니라 그냥 화면에 보이는 게시글의 순서 1234 -->
                              <script>
                                 function reorder() {
                                    //ddidx 재배치
                                    $(".userIndex-p").each(function(i, box) {
                                       $(box).find(".indexNum-p").html(i + 1);
            
                                    });
                                 }
            
                                 reorder();
                              </script>
                                    
                        
                        
                        
                     </form>
                  </td>
                  <td> 
                     <!-- 보기 버튼 연결하기 -->
                     <button type ="button" onclick  = "location.href='#'" id = "plan-link-btn" > 보기</button>
                  </td>
               </tr>
               <c:set var="i" value="${i+j}" />
            </c:forEach>

            <tr>
               <td colspan="5" id = "more-info-btn-td">
                  <div class="more-info-btn">
                     <a href="<c:url value="/planner/plannerList"/>" style="color: salmon;"> + 더보기 </a>
                  </div>
               </td>
            </tr>
         </table>
         </c:if>
         
         </div>
      </div>

      <br>
      <div class ="btn-box" style = "text-align: center;">
         
         <button id = "plan-link-btn" style = "width: auto; border-radius:15px;">최신 순</button>
       
      </div>
      
      <!-- 메인화면 '최신 게시물' 리스트  -->
      <form id="likeList">
         <c:set var="i" value="0" />
         <c:set var="j" value="1" />
         <div class="mainBoardList" id="mainBoardList">
            <h6 id = "main-h6-title">커뮤니티 차트</h6>
            <table style = "margin-top : 20px;">
               <c:forEach items="${boardListView.boardList}" var="board">

                  <tr class ="userIndex-b">
                     <td class ="indexNum-b" style  = "text-align: center;"></td>                     
                     <td>
                     <div style = "text-align: center;">
                     <img id = "table-board-profile" src="${imagePath}/${board.uphoto}" width="30px"
                        height="30px">
                     <br>
                     <span id ="main-board-uname" style = "padding">${board.uname}</span>   
                     </div>
                     </td>
                     
                     
                     <!--제목으로 대체할 부분!  -->
                     <td><a id = "board-content-title" style = "color: dimgray;"
                        href="<c:url value="/board/${board.bidx}"/>">${board.btitle}~</a></td>
                     <td><span class="glyphicon glyphicon-heart" id="like-icon"
                        style="font-size: 25px;"></span>
                        <div class="joinlike" style="display: none;"></div>
                     </td>
                  </tr>
                  <input type="hidden" name="likeInsert[${i}].bidx"
                     value="${board.bidx }">
                  <input type="hidden" name="likeInsert[${i}].uidx"
                     value="${loginInfo.uidx }">
                  <c:set var="i" value="${i+j}" />
               </c:forEach>
               <tr>
                  <td colspan="5" id = "more-info-btn-td" style = "border-bottom: 1px solid white;">
                     <div class="more-info-btn">
                        <a href="<c:url value="/board/boardList"/>"
                           style="color: salmon;"> + 더보기 </a>
                     </div>
                  </td>
               </tr>
            </table>
         </div>
         
             <!-- 보드의 bidx가 아니라 그냥 화면에 보이는 게시글의 순서 1234 -->
                  <script>
                     function reorder() {
                        //ddidx 재배치
                        $(".userIndex-b").each(function(i, box) {
                           $(box).find(".indexNum-b").html(i + 1);

                        });
                     }

                     reorder();
                  </script>
         
      </form>
   </div>


   <%@ include file="/WEB-INF/views/include/footer.jsp"%>


</body>

</html>

<script>

$(document).ready(function(){
   dateText();
   selcectLikeList();
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

/* 보드의 인덱스를 리스트로 넘겨서 좋아요 정보 리스트로 얻어오기 */
function selcectLikeList(){

   var params = $("#likeList").serialize();
   var param = $("#likeList").serializeArray();
   
   console.log(params);      
   console.log(param);

   $.ajax({
      url: 'http://localhost:8080/it/board/like',
      type: "POST",
      data: param,
      success:
      function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
      for(var i=0;i<data.length;i++){
       $('.joinlike').eq(i).text(data[i].countAllLike);

       
       if(data[i].checkMyLike==0){
           $('.glyphicon-heart').eq(i).css('color', 'lightgrey');   
        } else{
           $('.glyphicon-heart').eq(i).css('color', '#1abc9c');   
         }
         
            }
         }
   });
}








</script>
