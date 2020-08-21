package com.aia.it.comment.dao;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.aia.it.board.model.Board;
import com.aia.it.comment.model.Comment;
import com.aia.it.comment.model.CommentRequest;

public interface CommentDaoInterface {
	
	//리스트 출력
	List<Comment> selectTotalList();
	
	//댓글 총 갯수
	int totalCnt(int bidx);
	
	//한페이지에 보일 갯수
	List<Comment> selectList(int bidx, int startRow, int count);
	
	//등록된 값을 int로 반환
	int insertComment(Comment comment);
	
	Comment selectByCidx(int cidx);

	Comment selectByCommentBidx(int bidx);

	int commentDelete(Comment comment);

	int editComment(Comment comment);
	

}
