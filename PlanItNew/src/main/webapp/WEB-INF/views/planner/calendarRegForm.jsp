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
/*전체를 감싸는 테그*/
.boardListcontainer {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
	width: 500px !important;
	height: 700px;
	background-color: #FFFFFF;
}

#loginFormLogo {
	margin-top: 10px;
	margin-bottom: 0;
	font-family: 'Montserrat Alternates', sans-serif;
	float: left;
}

#ptext {
	float: left;
}

#card-title {
	color: #1ABC9C;
	margin-top: 5px;
	margin-bottom: -10px;
}


input:focus {outline:none;}
input:focus::-webkit-input-placeholder {color:transparent; }










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
	width: 80%;
	height: 40px;
	top:0;
	padding-left: 10px;
	border-radius: 10px;
	text-align: center;
	background: whitesmoke;
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
	margin-left : auto;
	margin-right : auto;
	width : 300px;
	height: 40px;
	color: white;
	font-size: 12px;
	background-color: #BEBEBE;
	border-radius: 5px 5px 5px 5px;
}

#titleDiv{
width: 80%;
			margin-left : auto;
	margin-right : auto;
	    background: whitesmoke;
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
		<div class="boardListcontainer"
		style="width: 20rem; border-radius: 20px;">
		<!--1번  시작 : 전체 영역을 감싸는 태그 -->
	
	<div class="card-title" id="card-title" style="text-align: center;">
			<!--2번시작 : 검색과 제목창시작  -->

			<div id="boardListHeadTitle">
				<h3 id="loginFormLogo" class="card-title text-center">Planner</h3>
				<br> <br>
				<p id="ptext" align="left">${loginInfo.uname}님의 플랜을 등록해 보세요.</p>
			</div>
			<br> <br>
			<br> <br>
		</div>
<br> <br>
		<form method="post" id="regForm" >
		
		<div id="titleDiv">
		
		<input type="text" name="ptitle" placeholder="플래너의 제목을 입력해주세요."
				id="title" autocomplete="off">
				
				</div>
		
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
			
			
			<input type="checkbox" name="datechk" id="datechk"> 
			<input type="submit" id="submit" value="선택완료">
			
			</div>
			
			
		</form>
</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


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



