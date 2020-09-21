package com.aia.it.board.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.board.dao.LikeDaoInterface;
import com.aia.it.board.model.LikeCountList;
import com.aia.it.board.model.LikeInsert;
import com.aia.it.board.model.LikeList;

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

	public List<LikeCountList> boardLikeList(LikeInsert list){
	
	dao=sessionTemplate.getMapper(LikeDaoInterface.class);
	
	ArrayList<LikeCountList> result = new ArrayList<>();
	LikeCountList countList = null;
	int likeCount = 0;
	int likeCheck = 0;
	System.out.println("BOARDLIKELIST");

	
	for(int i=0;i<list.getLikeInsert().size();i++) {
		
		System.out.println(list.getLikeInsert().get(i).getBidx());
		System.out.println(list.getLikeInsert().get(i).getUidx());
		likeCount = dao.boardLikeCount(list.getLikeInsert().get(i).getBidx());
		likeCheck = dao.boardLikeCheck(list.getLikeInsert().get(i).getBidx(),list.getLikeInsert().get(i).getUidx());
		
		System.out.println(likeCount);
		System.out.println(likeCheck);

		countList= new LikeCountList(list.getLikeInsert().get(i).getUidx(),list.getLikeInsert().get(i).getBidx(), likeCount, likeCheck);
		
		System.out.println(countList);
		
		result.add(i, countList);
	}
	
	System.out.println("BOARDLIKELIST"+result);

	
	
	return result;
	
	}
}
