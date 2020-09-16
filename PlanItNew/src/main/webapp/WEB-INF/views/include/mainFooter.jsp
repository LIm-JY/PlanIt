ㅊ<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    		<footer>
                <div class = "mainNavDiv">
               	<ul class = "mainNav"> 
               		<li>
               			<a href = "<c:url value="/"/>"><i class="fa fa-home fa-2x">
               			<br><span id = "mainNavSpan">　메인　</span></i></a>
               		</li>
               		<li>
               			<a href="<c:url value="/planner/calendar"/>"><i class="fa fa-book fa-2x">
               			<br><span id = "mainNavSpan">　플래너　</span></i></a>
               		</li>
               		<li>
               			<a href="<c:url value="/board/boardList"/>"><i class="fa fa-pencil fa-2x">
               			<br><span id = "mainNavSpan">커뮤니티</span></i></a>
               		</li>
               		<li>
               			<a href = "<c:url value="/myPage/${loginInfo.uidx}"/>"><i class ="fa fa-user fa-2x">
               			<br><span id = "mainNavSpan">마이페이지</span></i></a>
               		</li>
               	</ul>
                </div>
             </footer>