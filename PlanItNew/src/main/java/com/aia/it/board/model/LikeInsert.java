package com.aia.it.board.model;

import java.util.List;

public class LikeInsert {
	
	private List<Like> likeInsert;

	public LikeInsert() {
	}

	public LikeInsert(List<Like> likeInsert) {
		this.likeInsert = likeInsert;
	}

	@Override
	public String toString() {
		return "LikeInsert [likeInsert=" + likeInsert + "]";
	}

	public List<Like> getLikeInsert() {
		return likeInsert;
	}

	public void setLikeInsert(List<Like> likeInsert) {
		this.likeInsert = likeInsert;
	}


	
	

}
