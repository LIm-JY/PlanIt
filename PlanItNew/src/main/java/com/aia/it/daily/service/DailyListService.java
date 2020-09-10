package com.aia.it.daily.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.member.model.LoginInfo;
import com.aia.it.planner.dao.PlannerDaoInterface;
import com.aia.it.planner.model.Planner;
import com.aia.it.planner.model.PlannerJoinDaily;


@Service
public class DailyListService {
	
	private PlannerDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	
	List<PlannerJoinDaily> dailyList = null;

	
	public List<PlannerJoinDaily> getView(
			 
			int uidx,
			int pidx) {
		
		//view로 전달할 결과 데이터
		
		
		dao=sessionTemplate.getMapper(PlannerDaoInterface.class);
		
		
	System.out.println(dao.selectDailyList(uidx, pidx));

		
		return dao.selectDailyList(uidx, pidx);
	}

	
	//내꺼
	  public List<Planner> getDailyView( HttpSession session, HttpServletRequest
	  request) {
	  
	  dao=sessionTemplate.getMapper(PlannerDaoInterface.class);
	  List<Planner> dailyList = null;
	  // 세션을 가져온다. session = request.getSession(true);
	  
	  LoginInfo loginInfo=(LoginInfo) session.getAttribute("loginInfo");
	
		  dailyList = dao.selectPlannerByIdx(loginInfo.getUidx()); 
		  
	  
	  
	  //리스트에 uidx로 데려온 결과를 담아준다. listView = new DailyList(dailyList);
	  System.out.println("나는 데일리의 리스트뷰!??"+loginInfo.getUidx()); 
	  return dailyList; 
	  }
	 
}
