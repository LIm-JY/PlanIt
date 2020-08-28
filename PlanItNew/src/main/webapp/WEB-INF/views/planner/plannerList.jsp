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

</head>
<body>
	<h1>플래너 리스트</h1>
	<hr>
	<div id="plannerList"></div>

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
				html += '<div>';
				html += '	<ul>';
				html += '		<li>pidx : '+data[i].pidx+'</li>';
				html += '		<li>pstartdate : '+data[i].pstartdate+'</li>';
				html += '		<li>penddate : '+data[i].penddate+'</li>';
				html += '		<li>uidx :'+data[i].uidx+'</li>';
				/* html += '		<li><input type="button" value="수정" onclick="editForm('+data[i].pidx+')"> '; */
				html += '		<input type="button" value="삭제" onclick="deletePlanner('+data[i].pidx+')"></li>';
				html += '	</ul>';
				html += '</div>';
			}
			
			$('#plannerList').html(html);
			
		} 
	});
}
</script>










</body>
</html>