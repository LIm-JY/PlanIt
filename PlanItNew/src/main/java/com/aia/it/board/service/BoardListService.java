package com.aia.it.board.service;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.board.dao.BoardDaoInterface;
import com.aia.it.board.model.Board;
import com.aia.it.board.model.BoardList;

@Service
public class BoardListService {
	
	private BoardDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public BoardList getView(
			HttpServletRequest request, 
			HttpServletResponse response) {
		
		
		//view로 전달할 결과 데이터
		BoardList listView = null;
		
		dao=sessionTemplate.getMapper(BoardDaoInterface.class);

		
		//전체 게시물 개수 구하기
		int totalCnt = dao.totalCnt();
		
		//한 페이지 당 노출할 게시물의 개수
		final int BOARD_CNT_PER_PAGE = 2;
		
		//현재 페이지현재 번호 
		int currentPageNumber = 1;
		String page = request.getParameter("page");
		
		if (page != null) {
			try {
				currentPageNumber = Integer.parseInt(page);
				System.out.println("페이지1111"+page);
			} catch (NumberFormatException e) {
				System.out.println("숫자 타입의 문자열이 전달되지 않아 예외 발생");
			}
		}
		
		
		//게시물의 첫번째 행의 index
		int startRow = 0;
		
		//한페이지에 누출할 리스트
		List<Board> boardList = null;
		
		if(totalCnt>0) {
			
			startRow=(currentPageNumber-1)*BOARD_CNT_PER_PAGE;
			
			System.out.println("startRow"+startRow);
		
			boardList = dao.selectList(startRow,BOARD_CNT_PER_PAGE);
		} else {
			currentPageNumber = 0;
			boardList = Collections.emptyList();
		}
		
		listView = new BoardList(totalCnt, currentPageNumber, boardList, BOARD_CNT_PER_PAGE, startRow);
		System.out.println("나는 보드의 리스트뷰!"+listView);
		System.out.println("페이지"+page);
		return listView;
	}

}









