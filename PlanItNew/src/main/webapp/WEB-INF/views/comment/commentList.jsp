<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <c:if test="${not empty commentListView.boardList }">
               <c:url value="${initParam['boardUploadPath']}" var="imagePath" />
               <c:forEach items="${listView.boardList}" var="board">
                  <tr>
                     <td>${board.bidx}</td>
                     <td>${board.uidx}</td>
                     <td><a href="${board.bidx}">${board.btitle}</a></td>
                     <td>${board.bregdate}</td>
                     
                  </tr>
               </c:forEach>
            </c:if>

</body>
</html>