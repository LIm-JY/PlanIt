package com.aia.it.board.model;

import java.sql.Date;

public class BoardJoinMember {
	
	private String bidx;
   	private String btitle;
   	private String bmsg;
   	private String bphoto1;
	private String bphoto2;
	private String pidx;
	private String uidx;
	private String uphoto;
	private String uname;
	private Date bregdate;
	
	
	public Date getBregdate() {
		return bregdate;
	}
	public void setBregdate(Date bregdate) {
		this.bregdate = bregdate;
	}
	public String getBidx() {
		return bidx;
	}
	public void setBidx(String bidx) {
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
	public String getPidx() {
		return pidx;
	}
	public void setPidx(String pidx) {
		this.pidx = pidx;
	}
	public String getUidx() {
		return uidx;
	}
	public void setUidx(String uidx) {
		this.uidx = uidx;
	}
	public String getUphoto() {
		return uphoto;
	}
	public void setUphoto(String uphoto) {
		this.uphoto = uphoto;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	
	public BoardJoinMember() {
	}
	
	
	public BoardJoinMember(String bidx, String btitle, String bmsg, String bphoto1, String bphoto2, String pidx,
			String uidx, String uphoto, String uname, Date bregdate) {
		this.bidx = bidx;
		this.btitle = btitle;
		this.bmsg = bmsg;
		this.bphoto1 = bphoto1;
		this.bphoto2 = bphoto2;
		this.pidx = pidx;
		this.uidx = uidx;
		this.uphoto = uphoto;
		this.uname = uname;
		this.bregdate = bregdate;
	}
	
	
	@Override
	public String toString() {
		return "BoardJoinMember [bidx=" + bidx + ", btitle=" + btitle + ", bmsg=" + bmsg + ", bphoto1=" + bphoto1
				+ ", bphoto2=" + bphoto2 + ", pidx=" + pidx + ", uidx=" + uidx + ", uphoto=" + uphoto + ", uname="
				+ uname + ", bregdate=" + bregdate + "]";
	}
	
	

	
	

}
