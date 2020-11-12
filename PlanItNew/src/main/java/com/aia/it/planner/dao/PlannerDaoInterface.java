package com.aia.it.planner.dao;

import java.util.List;
import java.util.Map;

import com.aia.it.planner.model.Planner;
import com.aia.it.planner.model.PlannerJoinDaily;

public interface PlannerDaoInterface {

	//플래너가 생성되면 인트로 반환
	int insertPlanner(Planner planner);

	//플래너 리스트
	//플래너 전체 개수 구하기(데일리조인)
	int totalCnt();
	
	//플래너 한페이지에 노출할 개수와 인덱스(데일리조인)
	List<Planner> selectPlannerByIdx(int uidx);
	
	//플래너의 리스트 목록
	List<Planner> selectTotalList();
	
	
	
	List<PlannerJoinDaily> selectDailyList(int uidx, int pidx);

	List<PlannerJoinDaily> selectDailyListQ(int pidx);
	
	
	
	
	Planner plannerJoinDaily(int uidx);

	public int deletePlannerByIdx(int pidx);

	public int editPlanner(Planner planner);

	
	
	
	//////////////////////////////////////////////
	
	//////////////////////////////////////////////
	
	////////여기서부터 리스트에 필요한것들//////////////////
	
	///////////////////////////////////////////////
	
	////////////////////////////////////////////
	
	//전체 게시물의 개수 : 검색포함
	int totalCnt2(Map<String, Object> search);

	// 전체 게시물의  List<Planner> 로 반환
	List<Planner> selectList2(Map<String, Object> search);


	

	

}
