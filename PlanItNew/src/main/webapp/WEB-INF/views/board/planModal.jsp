<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ include file="/WEB-INF/views/include/sessionCheck.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: absolute; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 614px; /* Full width */
    height: 500px; /* Full heigh
    
    t */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	margin: auto;
}
/* Modal Content/Box */
.modal-content {
    background-color: white;
    margin: 10% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid lightsteelblue;
    width: 70%; /* Could be more or less, depending on screen size */                          
	height: 60%;
}
/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

</style>
</head>
<body>
	<table class="table">
				  <tr>
                     <td>데일리식별번호</td>
                     <td>작성자아이디엑스</td>
                     <td>플래너 번호</td>
                     <td>플래너 제목</td> 
                     <td>여행시작날짜</td> 
                     <td>여행끝날짜</td>   
                     <td>데일리장소</td>                   
                  </tr>
			<c:if test="${not empty listView.dailyList }">
               <c:forEach items="${listView.dailyList}" var="daily">
                  <tr>
                     <td>${daily.didx}</td>
                     <td>${daily.uidx}</td>
                     <td>${daily.pidx}</td> 
                     <td>${daily.ptitle}</td> 
                     <td>${daily.pstartdate}</td> 
                     <td>${daily.penddate}</td>  
                     <td>${daily.dloc}</td>                    
                  </tr>
               </c:forEach>
            </c:if>
   </table>	 
</body>
</html>