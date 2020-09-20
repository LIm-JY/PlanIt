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
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">
<style>

	#plannerListWrap{
	width : 500px;
	min-width: 360px;
	margin: auto;
	margin-top: 50px;
	}
	
	.planner{
	
	border-bottom:0.5px solid black;
	
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
	
	
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<c:url value="${initParam['memberUploadPath']}" var="imagePath"/>
	
	<div id="plannerListWrap">
	<h4 style="font-weight:bold;">내 플랜</h4>
	<ul id="plannerList"></ul>
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
				html += '	<li class="planlist">';
				html += '		<form action="http://localhost:8080/it/planner/plannerEdit" method="post">'
				html += '		<div class="planner">';
				html += '       <img src="${imagePath}/${loginInfo.uphoto}" width="30px" height="30px">'; 
				html += '		<div class="num"style="width:20px; margin-left:6px; margin-right:6px; display: Inline-block; font-size:18px;"></div>'
				html += '       <input type="text" name="ptitle" value="'+data[i].ptitle+'" style="width:200px; border:0; font-size:20px;" readonly>';
				html += '		<input type="text" value="'+betweenDay+'박'+betweenDay2+'일" style="width:115px; border:0; font-size:20px;" readonly>';
				html += '		<input type="hidden" name="pidx" value="'+data[i].pidx+'" readonly>';
				html += '		<input type="hidden" name="pstartdate" value="'+data[i].pstartdate+'" readonly>';
				html += '		<input type="hidden" name="penddate" value="'+data[i].penddate+'" readonly>';
				html += '		<input type="hidden" name="uidx" value="'+data[i].uidx+'" readonly>';
				html += '		<label class="listButton"><a onclick="deletePlanner('+data[i].pidx+')">삭제</a></label>';
				html += '		<label for="editPlanner" class="listButton" ><a>수정</a></label> '; 			
				html += '		<input type="submit" id="editPlanner" value="수정" style="display:none;"> '; 
				html += '		</div>';
				html += '		</form>'
				html += '	</li>';
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