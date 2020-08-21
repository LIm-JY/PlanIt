package com.aia.it.board.model;

import java.sql.Date;

public class Board {
	
	private int bidx; //게시글 식별번호
	private String btitle; //게시글 제목
	private String bmsg; //게시글 내용
	private String bphoto1; //게시글 사진
	private String bphoto2; //게시글 사진
	private Date bregdate; //게시글 작성일
	private int pidx; // 플래너 식별번호
	private int uidx;//회원 닉네임
	
	
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBmsg() {
		return bmsg;
	}
	public void setBmsg(String bmsg) {
		this.bmsg = bmsg;
	}
	public String getBphoto1() {
		return bphoto1;
	}
	public void setBphoto1(String bphoto1) {
		this.bphoto1 = bphoto1;
	}
	public String getBphoto2() {
		return bphoto2;
	}
	public void setBphoto2(String bphoto2) {
		this.bphoto2 = bphoto2;
	}
	public Date getBregdate() {
		return bregdate;
	}
	public void setBregdate(Date bregdate) {
		this.bregdate = bregdate;
	}
	public int getPidx() {
		return pidx;
	}
	public void setPidx(int pidx) {
		this.pidx = pidx;
	}
	
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public Board(int bidx, String btitle, String bmsg, String bphoto1, String bphoto2, Date bregdate, int pidx,
			int uidx) {
		this.bidx = bidx;
		this.btitle = btitle;
		this.bmsg = bmsg;
		this.bphoto1 = bphoto1;
		this.bphoto2 = bphoto2;
		this.bregdate = bregdate;
		this.pidx = pidx;
		this.uidx = uidx;
	}
	
	
	public Board(String btitle, String bmsg, int uidx) 
		{
		this(0,btitle,bmsg,null,null,null,0,uidx);
	}
	
	
	
	public Board() {
	}
	
	
	@Override
	public String toString() {
		return "Board [bidx=" + bidx + ", btitle=" + btitle + ", bmsg=" + bmsg + ", bphoto1=" + bphoto1 + ", bphoto2="
				+ bphoto2 + ", bregdate=" + bregdate + ", pidx=" + pidx + ", uidx=" + uidx + "]";
	}
}
