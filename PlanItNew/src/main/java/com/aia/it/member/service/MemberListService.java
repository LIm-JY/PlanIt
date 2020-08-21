package com.aia.it.member.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.member.dao.MemberDaoInterface;
import com.aia.it.member.model.Member;
import com.aia.it.member.model.MemberListView;

@Service
public class MemberListService {

	private MemberDaoInterface dao;
	@Autowired
	private SqlSessionTemplate template;

	//제이슨 리스트
	public List<Member> getMemberList() {

		dao = template.getMapper(MemberDaoInterface.class);

		System.out.println(dao.selectTotalList());
		
		return dao.selectTotalList();
	}

	//그냥 리스트
	public MemberListView getView(HttpServletRequest request, HttpServletResponse response) {

		dao = template.getMapper(MemberDaoInterface.class);

		// view로 전달할 결과 데이터
		MemberListView listView = null;

		// 전체 가입인원 수 구하기
		int totalCnt = dao.totalCnt();

		// 한 페이지 당 노출할 가입자 수
		final int MEMBER_CNT_PER_PAGE = 5;

		// 현재 페이지 번호
		int currentPageNum = 1;
		String page = request.getParameter("page");

		if (page != null) {
			try {
				currentPageNum = Integer.parseInt(page);
			} catch (NumberFormatException e) {
				System.out.println("나는 멤버리스트의 예외: 숫자 타입의 문자열이 전달되지 않아 예외 발생");
			}
		}

		// 멤버리스트 첫번제 행의 인덱스
		int startRow = 0;

		// 한 페이지에 보여질 리스트
		List<Member> memberListPage = null;

		if (totalCnt > 0) {
			startRow = (currentPageNum - 1) * MEMBER_CNT_PER_PAGE;
			memberListPage = dao.selectList(startRow, MEMBER_CNT_PER_PAGE);
		} else {
			currentPageNum = 0;
			memberListPage = Collections.emptyList();
		}

		listView = new MemberListView(totalCnt, currentPageNum, memberListPage, MEMBER_CNT_PER_PAGE, startRow);
		System.out.println(listView);

		return listView;

//		System.out.println(listView);
//		//겁색 데이타 -> searchType, keyword
//		String searchType = request.getParameter("searchType"); 
//		String keyword = request.getParameter("keyword"); 
//		
//		//검색 데이터가 있을 떄만 Map에 추가
//		if(searchType != null && !searchType.isEmpty()) {
//			search.put("searchType", searchType); 
//			}
//		if(keyword != null && !keyword.isEmpty()) {
//			search.put("keyword", keyword);
//		}
//		
//		//View로 전달할 결과 데이터 
//		MemberListView listView = null;
//		
//		//전체 게시물 개수 구하기
//		int totalCnt = dao.totalCnt(search);  
//		//한 페이지당 노출할 멤버의 수
//		final int MEMBER_CNT_PER_PAGE = 10; 
//		//현재 페이지 번호
//		int currentPageNum = 1; 
//		String page = request.getParameter("page"); 
//		if(page != null) {
//			try {
//			currentPageNum = Integer.parseInt(page);
//			} catch(NumberFormatException e) {
//				System.out.println("MemberListService 숫자타입 문자열이 전달되지 않아서 예외 발생");
//				}
//			}
//		
//		//게시물 첫 행의 index
//		int startRow = 0; 
//		//한 페이지에 보여질 리스트
//		List<Member> memberList = null; 
//		
//		if (totalCnt > 0) {
//			startRow = (currentPageNum - 1) * MEMBER_CNT_PER_PAGE; 
//			System.out.println(startRow);
//			//Map에 페이징 데이터 추가
//			search.put("startRow", startRow); 
//			search.put("count", MEMBER_CNT_PER_PAGE); 
//			
//			memberList = dao.selectList(search); 
//			}else { 
//				currentPageNum = 0; 
//				memberList = Collections.EMPTY_LIST; 
//			}
//			
//			listView = new MemberListView(totalCnt, currentPageNum, memberList, MEMBER_CNT_PER_PAGE, startRow); 
//			System.out.println(listView);
//		
//			return listView; 
	}

}
