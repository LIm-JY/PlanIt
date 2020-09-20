package com.aia.it.board.model;

import java.util.List;

public class LikeList {
	
	private int likeTotalCount;
	private List<LikeJoinMB> likeList;
	public int getLikeTotalCount() {
		return likeTotalCount;
	}
	public void setLikeTotalCount(int likeTotalCount) {
		this.likeTotalCount = likeTotalCount;
	}
	public List<LikeJoinMB> getLikeList() {
		return likeList;
	}
	public void setLikeList(List<LikeJoinMB> likeList) {
		this.likeList = likeList;
	}
	@Override
	public String toString() {
		return "LikeList [likeTotalCount=" + likeTotalCount + ", likeList=" + likeList + "]";
	}
	public LikeList(int likeTotalCount, List<LikeJoinMB> likeList) {
		this.likeTotalCount = likeTotalCount;
		this.likeList = likeList;
	}
	public LikeList() {

	}

}
