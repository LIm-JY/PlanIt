package com.aia.it.board.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.board.dao.LikeDaoInterface;
import com.aia.it.board.model.Like;

@Service
public class LikeInsertService {
	
	private LikeDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public int likeInsert(Like like) {
		
		dao = sessionTemplate.getMapper(LikeDaoInterface.class);
		
		
		int result = 0;
		
		result = dao.insertLike(like);
		
		return result;
		
	}

}
