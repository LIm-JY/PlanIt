<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

   <div>
      <h1 class="subtitle">전체게시글</h1>
      <c:if test="${not empty listView}">
         ${listView.boardTotalCount}
      <table class="table">
            <tr>
               <th>게시글 번호</th>
               <th>멤버 번

</th>
               <th>게시글 제목</th>
               <th>게시글 시간</th>
            </tr>



            <c:if test="${not empty listView.boardList }">
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

            <c:if test="${empty listView.boardList }">
               <tr>
                  <th colspan="6">조회된 글이 없습니다.</th>
               </tr>
            </c:if>


         </table>

         <c:if test="${listView.pageTotalCount > 0}">

            <div class="paging">
               <c:forEach begin="1" end="${listView.pageTotalCount}" var="i">

                  <a
                     class="paging_num ${i == listView.currentPageNumber ? 'now_page' : ''}"
                     href="boardList?page=${i}">${i}</a>
               </c:forEach>
            </div>

         </c:if>




      </c:if>
   </div>
      <%@ include file="/WEB-INF/views/include/footer.jsp" %>
   
</body>

</html>

<script>
   function boardDel(bidx) {
      if (confirm('선택하신 회원 정보를 삭제하시겠습니까?')) {
         location.href = 'boardDelete?bidx=' + bidx;
      }

   }

   function boardList() {
      location.href = 'boardList';
   }
</script>