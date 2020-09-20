package com.aia.it.board.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.board.dao.LikeDaoInterface;
import com.aia.it.board.model.Like;
import com.aia.it.board.model.LikeInsert;

@Service
public class LikeInsertService {
	
	private LikeDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public int likeInsert(LikeInsert inLike) {
		
		dao = sessionTemplate.getMapper(LikeDaoInterface.class);
		
		
		int result = 0;
		System.out.println("입력전 들어옴");
		result = dao.insertLike(inLike.getLikeInsert().get(0));
		
		return result;
		
	}

	public int likeInsert1(Like like) {
		dao = sessionTemplate.getMapper(LikeDaoInterface.class);
		
		
		int result = 0;
		System.out.println("입력전"+like.getUidx());
		System.out.println("like"+like);
		result = dao.likeInsert1(like);
		
		
		return result;
	}

}
