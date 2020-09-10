package com.aia.it.daily.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.daily.model.DailyList;
import com.aia.it.member.model.LoginInfo;
import com.aia.it.planner.dao.PlannerDaoInterface;
import com.aia.it.planner.model.PlannerJoinDaily;


@Service
public class DailyListService {
	
	private PlannerDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	
	List<PlannerJoinDaily> dailyList = null;
	DailyList listView = null;
	
	public List<PlannerJoinDaily> getView(
			 
			int uidx,
			int pidx) {
		
		//view로 전달할 결과 데이터
		
		
		dao=sessionTemplate.getMapper(PlannerDaoInterface.class);
		
		
	System.out.println(dao.selectDailyList(uidx, pidx));

		
		return dao.selectDailyList(uidx, pidx);
	}

	
	  public DailyList getDailyView( HttpSession session, HttpServletRequest
	  request) {
	  
	  dao=sessionTemplate.getMapper(PlannerDaoInterface.class);
	  
	  // 세션을 가져온다. session = request.getSession(true);
	  
	  //Member member = (Member) HttpSession.getAttribute("loginInfo"); 
	  LoginInfo loginInfo=(LoginInfo) session.getAttribute("loginInfo");
	  
	  if(loginInfo != null) {
	  
	  // 세션이 있으면 세션에 있는 loginInfo의 uidx를 데려온다. 
		  loginInfo.getUidx(); 
		  //데려온 uidx를이용하여 플래너의 리스트를 출력해준다. 
		  dailyList = dao.selectDailyListQ(loginInfo.getUidx()); }
	  
	  
	  //리스트에 uidx로 데려온 결과를 담아준다. listView = new DailyList(dailyList);
	  System.out.println("나는 데일리의 리스트뷰!"+listView); 
	  return listView; 
	  }
	 
}
