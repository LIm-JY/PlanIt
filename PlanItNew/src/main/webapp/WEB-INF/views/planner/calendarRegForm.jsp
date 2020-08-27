<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/sessionCheck.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">

    <title>text Limit</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

    <script>
                  $(function() {
                
            
                //오늘 날짜를 출력
                $("#today").text(new Date().toLocaleDateString());
                //datepicker 한국어로 사용하기 위한 언어설정
                $.datepicker.setDefaults($.datepicker.regional['ko']); 
                
                // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
                // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가
                //시작일.
                $('#datepicker').datepicker({
                    showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
                    buttonImage: "images/calendar.gif", // 버튼 이미지
                    buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
                    buttonText: "날짜선택",             // 버튼의 대체 텍스트
                    dateFormat: "yy-mm-dd",             // 날짜의 형식
                    changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                    //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                    onClose: function( selectedDate ) {    
                        // 시작일(fromDate) datepicker가 닫힐때
                        // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                        $("#toDate").datepicker( "option", "minDate", selectedDate );
                    }                
                });
                //종료일
                $('#datepicker2').datepicker({
                    showOn: "both", 
                    buttonImage: "images/calendar.gif", 
                    buttonImageOnly : true,
                    buttonText: "날짜선택",
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    //minDate: 0, // 오늘 이전 날짜 선택 불가
                    onClose: function( selectedDate ) {
                        // 종료일(toDate) datepicker가 닫힐때
                        // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                        $("#fromDate").datepicker( "option", "maxDate", selectedDate );
                    }                
                });
            });
// if (Date.prototype.yyyymmdd === undefined) {
//     Date.prototype.yyyymmdd = function() {
//     var mm = this.getMonth() + 1; // getMonth() is zero-based
//     var dd = this.getDate();
//     return [this.getFullYear(),
//             (mm>9 ? '' : '0') + mm,
//             (dd>9 ? '' : '0') + dd
//             ].join('');
//     };
// }
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
    $('body').append(plan);
}
call( );
</script>
</head>

    
<body>
<form method="post">
	<p>uidx <input type="text" name="uidx" value="${loginInfo.uidx}"></p><br>
		제목<input type="text" name="ptitle">
	
    <p>StartDate : <input type="text" id="datepicker" name="pstartdate" onchange="call()" autocomplete="off"></p>
    <p>EndDate : <input type="text" id="datepicker2" name ="penddate" onchange="call()" autocomplete="off"></p>
    <div></div>
    <input type="submit" value="완료">
    </form>
</body>
</html>
















