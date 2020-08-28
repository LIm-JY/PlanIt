package com.aia.it.planner.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.planner.dao.PlannerDaoInterface;
import com.aia.it.planner.model.Planner;

@Service
public class PlannerListService {


private PlannerDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	List<Planner> plannerList = null;
	
public List<Planner> plannerList(int uidx) {
		
		dao = sessionTemplate.getMapper(PlannerDaoInterface.class);
		
	
		return dao.selectPlannerByIdx(uidx);
	}
	
	
	
	
	
}
