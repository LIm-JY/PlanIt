/*
 * package com.aia.it.board.service;
 * 
 * import java.util.Collections; import java.util.List;
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import org.mybatis.spring.SqlSessionTemplate; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Service;
 * 
 * import com.aia.it.member.model.LoginRequest; import
 * com.aia.it.planner.dao.PlannerDaoInterface; import
 * com.aia.it.planner.model.Planner; import
 * com.aia.it.planner.model.PlannerList;
 * 
 * @Service public class BoardPlanListService {
 * 
 * private PlannerDaoInterface pdao;
 * 
 * @Autowired private SqlSessionTemplate sessionTemplate;
 * 
 * public PlannerList getBoardPlanList( HttpServletRequest request,
 * HttpServletResponse response) {
 * 
 * 
 * PlannerList plannerListView = null;
 * pdao=sessionTemplate.getMapper(PlannerDaoInterface.class);
 * 
 * 
 * 
 * //전체 게시물 개수 구하기 //int totalCnt = pdao.totalCnt();
 * 
 * //한 페이지 당 노출할 게시물의 개수 final int PlANNER_CNT_PER_PAGE = 5;
 * 
 * //현재 페이지 번호 int currentPageNumber = 1; String page =
 * request.getParameter("page");
 * 
 * if(page != null) { try { currentPageNumber = Integer.parseInt(page);
 * System.out.println("페이지1111"+page); } catch (NumberFormatException e) {
 * System.out.println("숫자 타입의 문자열이 전달되지 않아 예외 발생"); } }
 * 
 * //게시물의 첫번째 행의 index int startRow = 0;
 * 
 * //한페이지에 누출할 리스트 List<Planner> plannerList = null;
 * 
 * //if(totalCnt>0) {
 * 
 * startRow=(currentPageNumber-1)*PlANNER_CNT_PER_PAGE;
 * 
 * //plannerList=pdao.selectJoinList(startRow,PlANNER_CNT_PER_PAGE); //}else {
 * //currentPageNumber = 0; //plannerList=Collections.emptyList(); //}
 * 
 * //plannerListView = new PlannerList(totalCnt,
 * currentPageNumber,plannerList,PlANNER_CNT_PER_PAGE,startRow);
 * System.out.println("나는 플래너 리스트뷰!"+plannerListView);
 * 
 * //planner = pdao.plannerJoinDaily(loginRequest.getUidx());
 * 
 * //return plannerListView; }
 * 
 * }
 */