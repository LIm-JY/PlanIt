package com.aia.it.planner.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.planner.dao.PlannerDaoInterface;
import com.aia.it.planner.model.Planner;
import com.aia.it.planner.model.PlannerList;

@Service
public class PlannerListService2 {

	private PlannerDaoInterface dao;

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	
	public PlannerList getPlannerList(int uidx,
			HttpServletRequest request, 
			HttpServletResponse response) {

		dao = sessionTemplate.getMapper(PlannerDaoInterface.class);
		
		//view로 결과 전달 데이터
		PlannerList plannerListview2 = null;
		
Map<String, Object> search = new HashMap<String, Object>(); 
		
		// 검색 데이터 : search type, keyword
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
				search.put("uidx", uidx);
				
		// 검색을 위한 데이터가 있을 때만 Map에 추가
		if(searchType != null && !searchType.isEmpty()) {
			search.put("searchType", searchType);
		}
		if(keyword != null && !keyword.isEmpty()) {
			search.put("keyword", keyword);
		}
		
		
		//전체 게시물 개수 구하기
		int totalCnt = dao.totalCnt2(search);
		
		//한 페이지 당 노출할 게시물의 개수
		final int PLANNER_CNT_PER_PAGE = 2;
		
		//현재 페이지현재 번호 
		int currentPageNumber = 1;
		String page = request.getParameter("page");
		
		if (page != null) {
			try {
				currentPageNumber = Integer.parseInt(page);
			} catch (NumberFormatException e) {
				System.out.println("숫자 타입의 문자열이 전달되지 않아 예외 발생");
			}
		}
		
		
		//게시물의 첫번째 행의 index
		int startRow = 0;
		
		//한페이지에 누출할 리스트
		List<Planner> plannerdList2 = null;
		System.out.println("totalCnt"+totalCnt);
		System.out.println("CNT_PER_PAGE"+PLANNER_CNT_PER_PAGE);
		if(totalCnt>0) {
			
			startRow=(currentPageNumber-1)*PLANNER_CNT_PER_PAGE;
			
			System.out.println("startRow"+startRow);
			// Map에 페이징 데이터 주가
			search.put("startRow", startRow);
			search.put("count", PLANNER_CNT_PER_PAGE);
			
			System.out.println("search"+search);
			plannerdList2 = dao.selectList2(search);
		} else {
			currentPageNumber = 0;
			plannerdList2 = Collections.emptyList();
		}
		
		plannerListview2 = new PlannerList(totalCnt, currentPageNumber, plannerdList2, PLANNER_CNT_PER_PAGE, startRow);
		System.out.println("나는 플래너의 리스트뷰2222222222!"+plannerListview2);
		
		return plannerListview2;
	}
		
		

}
