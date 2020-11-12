package com.aia.it.daily.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.daily.dao.DailyDaoInterface;

@Service
public class DailyDeleteService {

	private DailyDaoInterface dao;
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	public int deleteDaily(int didx) {
		
		int result=0;
		
		dao=sessionTemplate.getMapper(DailyDaoInterface.class);
		
		
		
		
		
		result=dao.deleteDailyByIdx(didx);
		
		
		
		
		
		
		
		return result;
	}
	
	
}
