package com.aia.it.board.model;

public class LikeCountList {

	private int uidx;
	private int bidx;
	private int countAllLike;
	private int checkMyLike;
	
	public LikeCountList() {
	}

	public LikeCountList(int uidx, int bidx, int countAllLike, int checkMyLike) {
		super();
		this.uidx = uidx;
		this.bidx = bidx;
		this.countAllLike = countAllLike;
		this.checkMyLike = checkMyLike;
	}

	public int getUidx() {
		return uidx;
	}

	public void setUidx(int uidx) {
		this.uidx = uidx;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public int getCountAllLike() {
		return countAllLike;
	}

	public void setCountAllLike(int countAllLike) {
		this.countAllLike = countAllLike;
	}

	public int getCheckMyLike() {
		return checkMyLike;
	}

	public void setCheckMyLike(int checkMyLike) {
		this.checkMyLike = checkMyLike;
	}

	@Override
	public String toString() {
		return "LikeCountList [uidx=" + uidx + ", bidx=" + bidx + ", countAllLike=" + countAllLike + ", checkMyLike="
				+ checkMyLike + "]";
	}

	
	
	
	
}
