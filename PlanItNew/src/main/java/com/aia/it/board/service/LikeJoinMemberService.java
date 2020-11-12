package com.aia.it.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.board.dao.LikeDaoInterface;
import com.aia.it.board.model.LikeList;

@Service
public class LikeJoinMemberService {
	
	LikeDaoInterface dao;
	
	@Autowired
	SqlSessionTemplate sessionTemplate;

	public List<LikeList> bAndMSelect(int bidx) {

		List<LikeList> likeListView = null;
		
				
		dao=sessionTemplate.getMapper(LikeDaoInterface.class);
		
	//	result=dao.bAndMSelect(bidx);
		likeListView = dao.bAndMSelect(bidx);
		
		return likeListView;
	}

}
