package com.aia.it.board.model;

public class LikeJoinMB {
	
	int uidx;
	int bidx;
	int like;
	String uname;
	String uphoto;
	String btitle;
	public int getUidx() {
		return uidx;
	}
	public int getBidx() {
		return bidx;
	}
	public int getLike() {
		return like;
	}
	public String getUname() {
		return uname;
	}
	public String getUphoto() {
		return uphoto;
	}
	public String getBtitle() {
		return btitle;
	}
	public LikeJoinMB() {
	}
	public LikeJoinMB(int uidx, int bidx, int like, String uname, String uphoto, String btitle) {
		this.uidx = uidx;
		this.bidx = bidx;
		this.like = like;
		this.uname = uname;
		this.uphoto = uphoto;
		this.btitle = btitle;
	}
	@Override
	public String toString() {
		return "LikeJoinMB [uidx=" + uidx + ", bidx=" + bidx + ", like=" + like + ", uname=" + uname + ", uphoto="
				+ uphoto + ", btitle=" + btitle + "]";
	}
	
	
	
	

}
