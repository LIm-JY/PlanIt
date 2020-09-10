package com.aia.it.board.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.board.dao.BoardDaoInterface;

@Service
public class CheckPidxService {
	
	private BoardDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public String checkPidx(int pidx) {
		
		dao=sessionTemplate.getMapper(BoardDaoInterface.class);
		
		String result = "N";
		
		int resultCnt = dao.selectByPidx(pidx);
		
		if(resultCnt>0) {
			result = "Y";
		}
		
		return result;
	}

}
