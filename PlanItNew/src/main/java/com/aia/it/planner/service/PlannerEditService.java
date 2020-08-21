package com.aia.it.planner.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.planner.dao.PlannerDaoInterface;
import com.aia.it.planner.model.Planner;

@Service
public class PlannerEditService {

private PlannerDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
public int plannerEdit(Planner planner, HttpServletRequest request) {
		
		dao = sessionTemplate.getMapper(PlannerDaoInterface.class);
		
		int result = 0;
		
//		result = dao.editPlanner(planner);
		
		return result;
	}
	
	
}
