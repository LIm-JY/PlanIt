<%@ page import="com.aia.it.planner.model.PlannerJoinDaily"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/sessionCheck.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" /> -->
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">
	
<style>
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	/** 아이템을 등록한다. */
	function submitItem() {
		if (!validateItem()) {
			return;
		}
		alert("등록");
	}
	/** 아이템 체크 */ 
	function validateItem() {
		var items = $("input[type='text'][name='item']");
		if (items.length == 0) {
			alert("작성된 아이템이 없습니다.");
			return false;
		}
		var flag = true;
		for (var i = 0; i < items.length; i++) {
			if ($(items.get(i)).val().trim() == "") {
				flag = false;
				alert("내용을 입력하지 않은 항목이 있습니다.");
				break;
			}
		}
		return flag;
	}
	/** UI 설정 */"#sortable-5, #sortable-6"  
	$(function() {
		$(".sortable").sortable({
			placeholder : "itemBoxHighlight",
			connectWith : ".ddateList, .sortableBox, .sortable.ui-sortable",
			
			start : function(event, ui) {
				ui.item.data('start_pos', ui.item.index());
			},
			stop : function(event, ui) {
				var spos = ui.item.data('start_pos');
				var epos = ui.item.index();
				/* reorder(); */
			}
		});
		$("#sortable").sortable();
		$("#sortable").disableSelection();
	});

	/** 아이템 박스 작성 */
	// function createBox() {
	//     var contents = "<div class='date'> 날짜"
	//     contents +=         
	//                   "<div class='itemBox'>"
	//                  + "<div style='float:left;'>"
	//                  + "<span class='itemNum'></span> "
	//                  + "<input type='text' name='item' style='width:300px;'/>"
	//                  + "</div>"
	//                  + "</div>";
	//                  contents     += "</div>"
	//     return contents;
	// }
	/** 아이템 박스 작성 */
/* 	function createBox() {
		var contents = "<li class='itemBox'>" 
				+ "<div style='float:left;'>"
				+ "<span class='itemNum'></span> "
				+ "<input type='text' name='item' style='width:300px;'/>"
				+ "</div>" + "</li>";
		return contents;
	} */
	
	
	//]]>
</script>
<title>플래너 작성</title>
</head>
<script>
	
</script>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
		pidx <input type="text" name="pidx" value="${pidx}"><br>
	uidx <input type="text" name="uidx" value="${loginInfo.uidx}"><br>
	<input type="text" name="pstartdate" value="${startdate}">/<input type="text" name="penddate" value="${enddate}"><br>
	제목<input type="text" name="ptitle" value="${ptitle}">
		<div id="sortable">
			<c:forEach items="${dateList}" var="list">
				<div class="sortable" name="dailytable">
				
					<div class="ddateList" class="sortable">${list}</div>
					<div class="sortable"></div>
					<div class="addDailyButton" ><a href="../daily/dailyReg">+</a></div>
						
				</div>
			</c:forEach>
		</div>
		
		<span id="dailyList"></span>
	
	
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
</body>
</html>

<script type="text/javascript">


console.log($('.itembox').length);
		
		
		$('.addDaily').click(function () {
			
			
			var z = $(this).next();
			
			var t=	$('.addDaily').next();
		
			var html='';
			html+='dloc		<input type="text" name="dloc">	<br>';
			html+='	dloclon		<input type="text" name="dloclon"><br>';
			html+='	dloclat		<input type="text" name="dloclat"><br>';
			html+='dmsg		<input type="text" name="dmsg"><br>';
			html+='	dphoto		<input type="file" name="dphoto"><br>';
			
			t.empty();
			
			z.html(html);
							
			});
		
		
		
		 $(document).ready(function(){
			
			dailyList();
			
		}); 
		 
		
		 	function dailyList() {
			
			$.ajax({
				url: 'http://localhost:8080/PlanIt_y2/planner/dailyList',
				type: 'GET',
				
				data: {
				uidx : '${loginInfo.uidx}'
				},
				success: function(data){
			var html = '';
			
		console.log(data);
		console.log(data[1].ptitle);
		console.log("${listView.dailyList.ptitle}");

		
		
		
		
		var sortable = document.getElementsByClassName("sortable");
		
		
		
		console.log($(document.getElementsByClassName("ddateList")).html());
		
		var ddate = $(document.getElementsByClassName("ddateList"));
		
		
		console.log(ddate);

		
		

		for(var i=0; i<data.length; i++){
						
			
						
					 	html += '<div class="sortableBox" class="sortable">';
						html += '	<ul class="sortable">';
						html += '		<li class="sortable">ptitle : '+data[i].ptitle+'</li>';
						html += '		<li>ddate : '+data[i].ddate+'</li>';

			
						html += '	</ul>';
						html += '</div>'; 
						/* html += '<c:if test="${'+data[i].ddate+' eq '+ddate+' }">';
						html += '맞습니다';"'+data[i].ddate+'")'
						html += '</c:if>';  */
						$( '.ddateList:contains("'+data[i].ddate+'")').next().append(html);
						
						$('#dailyList').append(html);
						html='';
					}
						
		
			
		
		
		
		
		
/* 			$( '.ddateList:contains("'+data[3].ddate+'")').css( 'color', 'blue' );
 */
					alert(html);
							
					/*  $( document ).ready( function() {
					        $( '.ddateList:contains("'+ddate+'")').css( 'color', 'red' );
					      } ); */
					
					 /* if (.value=ddate) */ 
					
				} 
			

		
		});
		}
		


</script>