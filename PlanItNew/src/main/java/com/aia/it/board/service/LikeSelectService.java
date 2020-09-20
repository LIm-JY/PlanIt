package com.aia.it.board.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.board.dao.LikeDaoInterface;

@Service
public class LikeSelectService {

	LikeDaoInterface dao;
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	public int selectLike(int uidx, int bidx) {
		
		dao=sessionTemplate.getMapper(LikeDaoInterface.class);
		
		
		int result =0;
		
		result=dao.selectLike(uidx,bidx);
		
		System.out.println("왜!"+result);
		
		
		return result;
	}

	public int selectAllLike(int bidx) {
		
dao=sessionTemplate.getMapper(LikeDaoInterface.class);
		
		
		int result =0;
		
		result=dao.selectAllLike(bidx);
		
		System.out.println("?????????????????????????!"+result);
		
		
		return result;
	}

	
	
	
	
}
