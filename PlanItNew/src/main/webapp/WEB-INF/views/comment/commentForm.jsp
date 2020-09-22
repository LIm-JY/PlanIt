<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#comment-box{
    margin-left: auto;
    margin-right: auto;
    margin-top: 80px;
    background-color: whitesmoke;
}

/*댓글 타이틀 */
.comment-title{
   padding-top: 20px;
   padding-bottom: 20px;
   padding-left:10px;
   font-family: 'Nanum Gothic', sans-serif;
}

#comment-write-div{
   padding-left: 20px;
   padding-bottom: 30px;
   font-family: 'Nanum Gothic', sans-serif;
}

.commentUname{
   border: none;
   font-size: 18px;
    bottom: 35px;
    margin-bottom: 12px;
    background-color: whitesmoke;
    font-family: 'Nanum Gothic', sans-serif;
}

.insertComment{
    background-color: white;
   width: 80%;
   border-top: none;
   border-left: none;
   border-right: none;
   border-bottom: 1px solid lightgrey;
   font-family: 'Nanum Gothic', sans-serif;
   height: 30px;
}

#comment-submit-btn{
   width: 50px;
    border-radius: 6px;
    border: hidden;
    background-color: #1abc9c;
    color: white;
    margin-left: 20px;
    font-weight: bold;
    height: 30px;
    font-size: 13px;
    font-family: 'Nanum Gothic', sans-serif;
}

#comment-submit-btn:hover{
   color: #1abc9c;
   background-color: white;
   border:1px solid #1abc9c;
}


</style>

</head>

<body>
   <div id = "comment-box">
      <h3 class="comment-title">댓글</h3>
      
      <form action="<c:url value='/comment/comment'/>" method="post" enctype="multipart/form-data">
         
         <div class="comment-write-div" id ="comment-write-div">
            <input type="hidden" id="bidx" name="bidx" value ="${viewBoard.bidx}" readonly>
            <input type="text" name="uname" class="commentUname" id="uname"
               style ="margin-left: 0"
             value="${loginInfo.uname}" readonly>
            <br>
            <input type="text" name="cmsg" class="insertComment" id="cmsg" maxlength="35" required placeholder="댓글을 남겨보세요 ">
      
            <button type ="submit" id = "comment-submit-btn"> 등록 </button>
         </div>
         
      </form>
   </div>   

</body>


</html>