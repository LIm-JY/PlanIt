package com.aia.it.board.dao;

import java.util.List;
import java.util.Map;

import com.aia.it.board.model.BoardJoinMember;
import com.aia.it.board.model.Board;

public interface BoardDaoInterface {
	
	//게시판 리스트 출력
	List<Board> selectTotalList();

	// 전체 게시물의 개수 : 검색 포함
	int totalCnt(Map search);

	// 전체 게시물의  List<Board> 로 반환
	List<BoardJoinMember> selectList(Map search);

	//게시판 글쓰기 입력
	int insertBoard(Board board);
	
	//게시판 수정
	int editBoard(Board board);

	//게시글 한개보여주기
	BoardJoinMember selectByBidxJoin(int bidx);
	
	Board selectByBidx(int bidx);
	
	//게시글 지우기
	int boardDelete(Board board);
	
	int selectByPidx(int pidx);

	int insertBoardNull(Board board);


}
