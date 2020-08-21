package com.aia.it.planner.dao;

import java.util.List;

import com.aia.it.planner.model.Planner;
import com.aia.it.planner.model.PlannerJoinDaily;

public interface PlannerDaoInterface {

	//플래너가 생성되면 인트로 반환
	int insertPlanner(Planner planner);

	//플래너 리스트
	//플래너 전체 개수 구하기(데일리조인)
	int totalCnt();
	
	//플래너 한페이지에 노출할 개수와 인덱스(데일리조인)
	List<Planner> selectList();
	
	//플래너의 리스트 목록
	List<Planner> selectTotalList();
	
	List<PlannerJoinDaily> selectDailyList(int uidx);

	
	
	
	
	
	Planner plannerJoinDaily(int uidx);

	public int deletePlannerByIdx(Planner planner);

	public int editPlanner(Planner planner);

	//public int selectList();

	

	

}
