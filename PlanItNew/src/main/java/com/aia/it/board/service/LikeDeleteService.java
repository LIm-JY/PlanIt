package com.aia.it.board.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.board.dao.LikeDaoInterface;

@Service
public class LikeDeleteService {

	LikeDaoInterface dao;

	@Autowired
	SqlSessionTemplate sessionTemplate;

	public int deleteLike(int uidx, int bidx) {
System.out.println("uidx"+uidx);
		int result = 0;
		dao = sessionTemplate.getMapper(LikeDaoInterface.class);
		result = dao.deleteLike(uidx, bidx);

		return result;
	}

}
