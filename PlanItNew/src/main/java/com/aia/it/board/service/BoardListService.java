package com.aia.it.board.service;

import java.sql.SQLException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.board.dao.BoardDaoInterface;
import com.aia.it.board.model.BoardJoinMember;
import com.aia.it.board.model.BoardList;

@Service
public class BoardListService {
	
	private BoardDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public BoardList getView(
			HttpServletRequest request, 
			HttpServletResponse response) throws SQLException{
		
		
		//view로 전달할 결과 데이터
		BoardList listView = null;
		
		dao=sessionTemplate.getMapper(BoardDaoInterface.class);

		Map<String, Object> search = new HashMap<String, Object>(); 
		
		// 검색 데이터 : search type, keyword
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
				
				
		// 검색을 위한 데이터가 있을 때만 Map에 추가
		if(searchType != null && !searchType.isEmpty()) {
			search.put("searchType", searchType);
		}
		if(keyword != null && !keyword.isEmpty()) {
			search.put("keyword", keyword);
		}
		
		
		//전체 게시물 개수 구하기
		int totalCnt = dao.totalCnt(search);
		
		//한 페이지 당 노출할 게시물의 개수
		final int BOARD_CNT_PER_PAGE = 6;
		
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
		List<BoardJoinMember> boardList = null;
		System.out.println("totalCnt"+totalCnt);
		System.out.println("BOARD_CNT_PER_PAGE"+BOARD_CNT_PER_PAGE);
		if(totalCnt>0) {
			
			startRow=(currentPageNumber-1)*BOARD_CNT_PER_PAGE;
			
			System.out.println("startRow"+startRow);
			// Map에 페이징 데이터 주가
			search.put("startRow", startRow);
			search.put("count", BOARD_CNT_PER_PAGE);
			
			System.out.println("search"+search);
			boardList = dao.selectList(search);
		} else {
			currentPageNumber = 0;
			boardList = Collections.emptyList();
		}
		
		listView = new BoardList(totalCnt, currentPageNumber, boardList, BOARD_CNT_PER_PAGE, startRow);
		System.out.println("나는 보드의 리스트뷰!"+listView);
		
		return listView;
	}

}









