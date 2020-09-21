package com.aia.it.board.dao;

import java.util.List;

import com.aia.it.board.model.Like;
import com.aia.it.board.model.LikeCountList;
import com.aia.it.board.model.LikeList;

public interface LikeDaoInterface {

	int insertLike(Like like);

	int likeInsert1(Like like);

	int deleteLike(int uidx, int bidx);

	int selectLike(int uidx, int bidx);

	int selectAllLike(int bidx);

	List<LikeList> bAndMSelect(int bidx);

	int boardLikeCount(int bidx);
	
	int boardLikeCheck(int bidx, int uidx);

}
