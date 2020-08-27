<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<head>
<meta charset="UTF-8">
<title>뷰페이지</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<br><br>
	<table class="table" border="1">
		<tr>
			<th>게시글 제목</th>
			<th colspan="3">${viewBoard.btitle}</th>
		</tr>
		
		<tr>
			<th>작성자</th>
			<th>${viewBoard.uidx}</th>
			<th colspan="2">${viewBoard.bregdate}</</th>
		</tr>
		
		<tr>
			<th>내용</th>
			<th colspan="3">${viewBoard.bmsg}</th>
		</tr>
<c:url value="${initParam['boardUploadPath']}" var="imagePath" />
		<tr>	
			<th>사진</th>
			<th colspan="3"><img alt="사진 " src="${imagePath}/${viewBoard.bphoto1}"></th>
		</tr>
		
		<tr>	
			<th>사진</th>
			<th colspan="3"><img alt="사진 " src="${imagePath}/${viewBoard.bphoto2}"></th>

		</tr>
	</table>
	

		<div>
			<h1><a href="boardEdit?bidx=${viewBoard.bidx}">게시글 수정|</a>
			<a href="javascript:boardDel(${viewBoard.bidx})">게시글 삭제</a></h1>

		</div>
		
		<div>
		<%@ include file="/WEB-INF/views/comment/commentForm.jsp"%>
		</div>
		
		
		
	<%-- <div>
		<h1 class="subtitle">댓글 작성</h1>
		<form id="commentRegForm" onsubmit="return false;" >
			<table class="table" border="1">
				<tr>
				<th>보드인덱스<br>히든으로 감춰야함</th>
				<th>작성자 닉네임</th>
				<th>내용입력</th>
				</tr>
			
				<tr>
					<th><input type="text" id="bidx" name="bidx" value ="${viewBoard.bidx}" readonly></th>
					<th><input type="text" name="uname" id="uname" value="${loginInfo.uname}"></th>
					<th><input type="text" name="cmsg" id="cmsg"	required placeholder="댓글을 입력해주세요"></th>
				</tr>
				<tr>
					<th colspan="3"><input type="submit" value="댓글등록" onclick="regComment();"></th>
				</tr>
			</table>
		</form>
	</div> --%>
	
		
<c:if test="${not empty commentistView}">
	<table class="table" border="1">	
		<tr>
			<th>작성자</th>
			<th>댓글 내용</th>
			<th>댓글 작성시간</th>
			
		</tr>
		
		   <c:if test="${not empty commentistView.commentList }">
               <c:forEach items="${commentistView.commentList}" var="comment">
                  <tr>
					
                     <th>${comment.uname}</th>
                     <th>${comment.cmsg}</th>
                     <th>${comment.cregdate}</th>
                     
                     <th><a href="javascript:commentDel(${comment.cidx})">댓글삭제</a>|
						 <a href="../comment/commentEdit?cidx=${comment.cidx}">댓글수정</a></th>
                  </tr>
               </c:forEach>
            </c:if>
           
            <c:if test="${empty commentistView}">
                  <tr>
					
                     <th colspan="3">첫번째 댓글을 남겨주세요~♡</th>
                     
                  </tr></c:if> 
	</table>	
</c:if>

	




</body>
</html>
<script>


 /* function regComment(){
    
    var regFormData = new FormData();
    regFormData.append('bidx', $('#bidx').val());
    regFormData.append('uname', $('#uname').val());
    regFormData.append('cmsg', $('#cmsg').val());
  
    console.log(FormData);
    $.ajax({
       url : 'http://localhost:8080/it/board/{bidx}/',
       type : 'post',
     
       data : regFormData,
       
       success : function(data){
    	  console.log(data);
          alert(data); 
          
          dailyList();
          document.getElementById('commentRegForm').reset();
          
          

       }
    });
    
 }
 */








/* function commentDel(cidx){
	   if(confirm('정말 삭제하시겠습니까?')){
	      
	      $.ajax({
	         url : 'http://localhost:8080/it/comment/comment/' + cidx,
	         type : 'DELETE',
	         success : function(data){
	            
	            alert(data);
				 commentList(); 
	         }
	      });
	      
	   }
	} */
	
	
	function commentDel(cidx) {
		if (confirm('선택하신 댓글을 삭제하시겠습니까?')) {
			location.href = '../comment/commentDelete?cidx=' + cidx;
			
		}
	
	}



	function boardDel(bidx) {
		if (confirm('선택하신 회원 정보를 삭제하시겠습니까?')) {
			location.href = 'boardDelete?bidx=' + bidx;
		}

	}
	

	function boardList() {
		location.href = 'boardList';
	}
</script>