package com.aia.it.daily.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.daily.dao.DailyDaoInterface;
import com.aia.it.daily.model.Daily;

@Service
public class DailyViewService {

	private DailyDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public Daily getDaily (int didx) {
	
		dao = template.getMapper(DailyDaoInterface.class);

	
		return dao.selectByIdx(didx);

	
	}

}