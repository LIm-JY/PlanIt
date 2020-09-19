<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/sessionCheck.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<%-- <link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css"> 
 --%><!-- <link rel="stylesheet" media="screen and (max-width: 768px)" href="mystyle.css" />
 -->

<style>
#datechk {
	 display: none; 
}

#checkmsg {
	color: red;
	padding-left: 15px;
}

body, html {
	height: 100%;
	background-repeat: no-repeat;
	background-color: white;
	overflow: hidden;
	min-width: 360px;
	width: 100%;
}

#main-center {
	height: 100%;
	margin: auto;
	margin-top:0px;	
	border-radius: 5px 5px 5px 5px;
	min-width: 360px;
	width: 360px;
}

#title {
	font-size: 20px;
	border: white;
	min-width: 360px;
	width: 100%;
	height: 40px;
	font-style: Arial;
	top:0;
	padding-left: 10px;
}

#datepicker, #datepicker2 {
	height: 40px;
	width: 150px;
	border-radius: 5px 5px 5px 5px;
}

#startMark, #endMark {
	height: 40px;
	width: 150px;
	background-color: #21CAA9;
	border-radius: 5px 5px 5px 5px;
	font-size: 20px;
	font-weight: bold;
	line-height: 40px;
	color: white;
}

table {
	margin-top: 100px;
	margin-left: auto;
	margin-right: auto;
}


table>tbody>tr>td {
	padding: 10px;
	padding-top: 6px;
	padding-bottom: 6px;
}

#submit {
	min-width: 358px;
	width: 100%;
	height: 40px;
	color: white;
	font-size: 12px;
	background-color: #BEBEBE;
	border-radius: 5px 5px 5px 5px;
	position: fixed; 
	bottom: 0;
}


</style>

<title>플래너 등록</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


</head>



<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

		<form method="post" id="regForm" >
		<input type="text" name="ptitle" placeholder="제목을 입력해주세요."
				id="title" autocomplete="off">
		<div id="main-center">
			<input type="hidden" name="uidx" value="${loginInfo.uidx}">
			  <br> <br>
			<table>
				<tr style="text-align: center;">
					<td><div id="startMark">출발일</div></td>
					<td><div id="endMark">도착일</div></td>

				</tr>

				<tr>
					<td style="background-color: white;"><input type="date"
						id="datepicker" name="pstartdate" onchange="call()"
						placeholder="날짜를 선택하세요"></td>
					<td style="background-color: white;"><input type="date"
						id="datepicker2" name="penddate" onchange="call()"
						autocomplete="off" placeholder="날짜를 선택하세요"></td>
				</tr>

			</table>

			<div id="checkmsg"></div>
			
			
			</div>
			
			<input type="checkbox" name="datechk" id="datechk"> 
			<input type="submit" id="submit" value="선택완료">
		</form>


</body>
</html>

<script>
    
    /* 날짜의 형식 정리  */
function call(){
    var sdd = document.getElementById("datepicker").value;
    var edd = document.getElementById("datepicker2").value;
    console.log(sdd);
    console.log(edd);
    var ar1 = sdd.split('-');
    var ar2 = edd.split('-');
    console.log(ar1);
    console.log(ar2);
    var curr = new Date(ar1[0], ar1[1], ar1[2]);
    var end = new Date(ar2[0], ar2[1], ar2[2]);
    console.log(curr);
    console.log(end);
    var betweenDay =( (end.getTime() - curr.getTime()) / 1000 / 60 / 60 / 24);
    console.log(curr.getTime());
    console.log(end.getTime());
    console.log(betweenDay+1);
    console.log(curr.getFullYear()+'-'+curr.getMonth()+'-'+curr.getDate());
    
    var plan = '';
    while (betweenDay > 0) {
    betweenDay--;
    curr.setDate(curr.getDate() + 1);
    console.log(curr.getFullYear()+'-'+curr.getMonth()+'-'+curr.getDate());
   	plan += '<div>'+curr.getFullYear()+'-'+curr.getMonth()+'-'+curr.getDate()+'</div>';
	}   
    /* $('body').append(plan); */
}
	call( );
    
	
	/* 동작 ui */
    
    $(document).ready(function() {
    	
    $('#datepicker2, #datepicker').mouseout(function(){
    	if($('#datepicker2').val()!=""&&$('#datepicker').val()!=""){
    		
    	if($('#datepicker').val()>$('#datepicker2').val()){
    		$('#datechk').prop('checked',false);
    		$('#checkmsg').text("시작일 이후로 설정해주세요.");
    		$('#submit').css('background-color','#BEBEBE');

    	} else{
    		$('#checkmsg').text("");
    		$('#submit').css('background-color','#21CAA9');
    		$('#datechk').prop('checked',true);
    		}
    	}
    });
    
    
    $('#regForm').submit(function() {
    	
    	if($('#title').val()==""){
    		
    		$('#title').focus();
    		
 			return false;

    	}
    	
    	 if($('#datepicker2').val()==""||$('#datepicker').val()==""){
 			
     		$('#checkmsg').text("날짜를 선택해주세요.");

 			return false;

 			 }
    	 
    
 		
		if (!$('#datechk').prop('checked')) {
			$('#datepicker2').focus();
			return false;
		}
		
			
		
		
	});
    
    
    
    });
    </script>



