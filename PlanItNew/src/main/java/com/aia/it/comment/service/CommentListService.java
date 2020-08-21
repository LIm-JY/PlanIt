package com.aia.it.comment.service;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.board.dao.BoardDaoInterface;
import com.aia.it.board.model.Board;
import com.aia.it.comment.dao.CommentDaoInterface;
import com.aia.it.comment.model.Comment;
import com.aia.it.comment.model.CommentListView;

@Service
public class CommentListService {
	
	private CommentDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public CommentListView getView(
			int bidx,
			HttpServletRequest request, 
			HttpServletResponse response) {
		
		
		//view로 전달할 결과 데이터
		CommentListView commentistView = null;
		
		dao=sessionTemplate.getMapper(CommentDaoInterface.class);

		
		//전체 게시물 개수 구하기
		int totalCnt = dao.totalCnt(bidx);
		
		//한 페이지 당 노출할 게시물의 개수
		final int COMMENT_CNT_PER_PAGE = 10;
		
		//현재 페이지현재 번호 
		int currentPageNumber = 1;
		String page = request.getParameter("page");
		
		if(page != null) {
			
			currentPageNumber = Integer.parseInt(page);
		}
		
		
		//게시물의 첫번째 행의 index
		int startRow = 0;
		
		//한페이지에 누출할 리스트
		List<Comment> commentList = null;
		
		if(totalCnt>0) {
			
			startRow=(currentPageNumber-1)*COMMENT_CNT_PER_PAGE;
			
			System.out.println(startRow);
			commentList = dao.selectList(bidx, startRow,COMMENT_CNT_PER_PAGE);
		} else {
			currentPageNumber = 0;
			commentList = Collections.emptyList();
		}
		
		commentistView =new CommentListView(totalCnt, currentPageNumber, commentList, COMMENT_CNT_PER_PAGE, startRow);
		System.out.println("나는 댓글의 리스트뷰!"+commentistView);
		return commentistView;
	}
	
	


}
