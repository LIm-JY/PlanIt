package com.aia.it.daily.service;



import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.daily.dao.DailyDaoInterface;
import com.aia.it.daily.model.DailyOrderEdit;
import com.aia.it.daily.model.DailyOrderEditForm;

@Service
public class DailyOrderEditService {

	private DailyDaoInterface dao;

	
	@Autowired
	private SqlSessionTemplate template;
	
	
	public int editOrder (DailyOrderEdit daily) {
		
		
		int result = 0;
		dao=template.getMapper(DailyDaoInterface.class);
	System.out.println("서비스까지 들어옴");
		
		System.out.println(daily);
		
		
		for(int i=0; i < daily.getDailyOrderEdit().size(); i++) {
			
		result=dao.editDailyOrder(daily.getDailyOrderEdit().get(i));
		
		System.out.println("DailyOrderEditService들어옴 : "+daily.getDailyOrderEdit().get(i).getDidx());
		
		}
		
		return result;
		
	}
	
	
	
	
	
	
	
	
}
