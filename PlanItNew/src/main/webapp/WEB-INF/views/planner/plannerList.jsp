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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssMain.css">
<style>
	.planner{
		border:0.5px solid black;
		width : 500px;
		position: inherit;
	}
	
	.card{
		overflow : scroll; 
		overflow-x: hidden; 
	    scroll-behavior: smooth;
		width: 500px; 
		border: 1px solid red; 
		height: 600px; 
		text-align: center;
		margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<div class ="card">
	<h4>나의 플랜</h4>
	<div id="plannerList"></div>
	</div>


<script>
	$(document).ready(
		function(){
		
		plannerList();
		
	});

	function deletePlanner(pidx){
		if(confirm('정말 삭제하시겠습니까?')){
			
			$.ajax({
				url : 'http://localhost:8080/it/planner/plannerRest/' + pidx,
				type : 'DELETE',
				success : function(data){
					
					alert(data);
					plannerList();
				}
			});
			
		}
	}



	function plannerList() {
			console.log('${loginInfo.uidx}');
		$.ajax({
			url: 'http://localhost:8080/it/planner/plannerRest/'+${loginInfo.uidx},
			type: 'get',
		
			success: function(data){
				//alert(JSON.stringify(data));
				console.log(data);
				//$('#memberList').html(JSON.stringify(data));
				
				var html = '';
					
				for(var i=0; i<data.length; i++){
					html += '<form action="http://localhost:8080/it/planner/plannerEdit" method="post">'
					html += '<div class="planner">';
					html += '	<ul>';
					html += '		<li>번호 : <input type="text" name="pidx" value="'+data[i].pidx+'" readonly></li>';
					html += '       <li>이름: <input type="text" name="ptitle" value="'+data[i].ptitle+'" readonly></li>';
					html += '		<li>시작일 : <input type="text" name="pstartdate" value="'+data[i].pstartdate+'" readonly></li>';
					html += '		<li>종료일 : <input type="text" name="penddate" value="'+data[i].penddate+'" readonly></li>';
					html += '		<input type="hidden" name="uidx" value="'+data[i].uidx+'" readonly>';
					html += '		<li><input type="submit" value="수정"> '; 
					html += '		<input type="button" value="삭제" onclick="deletePlanner('+data[i].pidx+')"></li>';
					html += '	</ul>';
					html += '</div>';
					html += '</form>'
	
				}
				
				$('#plannerList').html(html);
				
			} 
		});
	}

</script>

</body>
</html>