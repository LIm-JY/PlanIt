package com.aia.it.board.model;

public class Like {
	
	/* private int lidx; */
	private int uidx;
	private int bidx;
	
	
	
	/*
	 * public int getLidx() { return lidx; } public void setLidx(int lidx) {
	 * this.lidx = lidx; }
	 */
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
	
	
	public Like() {
	}
	
	
	public Like( int uidx, int bidx) {
		
		this.uidx = uidx;
		this.bidx = bidx;
	}
	
	
	@Override
	public String toString() {
		return "Like [ uidx=" + uidx + ", bidx=" + bidx + "]";
	}
	
	

}
