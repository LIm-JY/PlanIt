<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/sessionCheck.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플래너 리스트</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Montserrat+Alternates:wght@600&display=swap"
   rel="stylesheet">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
   
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   
<style>

   #card-title {
      color: #1ABC9C;
      margin-top: 5px;
      margin-bottom: -10px;
      height: 80px;
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
   
   #loginFormLogo {
   margin-top: 10px;
   margin-bottom: 0;
   font-family: 'Montserrat Alternates', sans-serif;
   float: left;
}

   #plannerListWrap{
   width : 500px;
   min-width: 360px;
   margin: auto;
   margin-top: 50px;
   }
   
   .planner{
   
   height: 50px;
   width : 500px;
   min-width: 360px;
   margin: auto;
   
   }   
   
   ul{
   list-style: none;
   }
   
   .listButton{
   float: right;
   font-size: 15px;
   cursor: pointer;
   padding-right: 6px;
   margin-top: 5px;
   }
   
   .w3-button.w3-black:hover{
   
   background-color: #1abc9c;
   }
   
   #plan-list-box{
   padding-right: 20px;
   padding-left: 20px;
   
   }
   
   #plannerList{
   margin-left: 0;
   padding-left: 0;
   margin-right: auto;
   
   }
   
   #plan-list-profile{
      border-radius: 100%;
      width: 35px;
      height: 35px;
   }
   
   #planner-list-box{
      margin-top: 20px;
   }
   
   #plan-num{
    width:20px;
    margin-left:6px; 
    margin-right:6px; 
    display: Inline-block; 
    font-size:16px;
    color: dimgrey;
    }
    
   #list-ptitle{
   width:200px; 
   border:0; 
   font-size:16px;
   }
   
   #list-pdays{
   width:115px; 
   border:0; 
   font-size:14px;
   }
   
   .listButton{
      border: none; 
      background-color: white;
      color: #1abc9c;
      font-size: x-large;
   }
</style>
</head>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<body>

<c:url value="${initParam['memberUploadPath']}" var="imagePath"/>
   
   <div id="plannerListWrap">
<div class="card-title" id="card-title" style="text-align: center;">
         <!--2번시작 : 검색과 제목창시작  -->
         
         <div id="boardListHeadTitle">
            <h3 id="loginFormLogo" class="card-title text-center">planner</h3>
            <br> <br>
            <p id="ptext" align="left">여행 플랜을 확인하세요.</p>
         </div>
         
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
      <br>
      <div id = "plan-list-box">
      <ul id="plannerList">
      </ul>
      </div>
   </div>


<script>
   $(document).ready(function(){
      
      plannerList();
      
   });

function deletePlanner(pidx){
   if(confirm('정말 삭제하시겠습니까?')){
      
      $.ajax({
         url : 'http://localhost:8080/it/planner/plannerRest/' + pidx,
         type : 'DELETE',
         success : function(data){
            
            plannerList();
            
         }
      });
      
   }
}



function plannerList() {
   $.ajax({
      url: 'http://localhost:8080/it/planner/plannerRest/'+${loginInfo.uidx},
      type: 'get',
   
      success: function(data){
         //alert(JSON.stringify(data));
         //$('#memberList').html(JSON.stringify(data));
         var html = '';
          
         for(var i=0; i<data.length; i++){
            
            var sdd=data[i].pstartdate;
            var edd=data[i].penddate;
             var ar1 = sdd.split('-');
             var ar2 = edd.split('-');
             var curr = new Date(ar1[0], ar1[1], ar1[2]);
             var end = new Date(ar2[0], ar2[1], ar2[2]);
             var betweenDay =( (end.getTime() - curr.getTime()) / 1000 / 60 / 60 / 24);
            var betweenDay2 = betweenDay+1;
            
            html += '   <li class="planlist">';
            html += '      <form action="/it/planner/plannerEdit" method="post">'
            html += '      <div class="planner" id ="planner-list-box">';
            html += '      <div class="num" id="plan-num"></div>'
            html += '       <img id = "plan-list-profile" src="${imagePath}/${loginInfo.photo}">'; 
            html += '       <input type="text" id="list-ptitle" name="ptitle" value="'+data[i].ptitle+'" readonly>';
            html += '      <input type="text" id="list-pdays" value="'+betweenDay+'박'+betweenDay2+'일" readonly>';
            html += '      <input type="hidden" name="pidx" value="'+data[i].pidx+'" readonly>';
            html += '      <input type="hidden" name="pstartdate" value="'+data[i].pstartdate+'" readonly>';
            html += '      <input type="hidden" name="penddate" value="'+data[i].penddate+'" readonly>';
            html += '      <input type="hidden" name="uidx" value="'+data[i].uidx+'" readonly>';
            html += '      <a class="listButton" onclick="deletePlanner('+data[i].pidx+')"><span class ="fa fa-trash"></span></a>';
            html += '      <a><button type="submit" id="editPlanner" class="listButton"><span class ="fa fa-plus-circle"></span></button></a>'; 
            html += '      </div>';
            html += '      </form>'
            html += '   </li>';
         }
         
         $('#plannerList').html(html);
         reorder();
         
      } 
      
      
   });
}


function reorder() {

$(".planlist").each(function(i, box) {
    $(box).find(".num").html(i + 1);

});


}



</script>

</body>
</html>