package com.aia.it.comment.model;

import java.sql.Date;

public class Comment {
	
	private int cidx; //댓글 식별번호
	private String cmsg; //댓글 내용
	private Date cregdate; //댓글 작성 시간
	private int bidx; //게시글 번호
	private String uname; //작성자
	
	
	public Comment(int cidx, String cmsg, int bidx, String uname) {
		
		this(cidx, cmsg, null, bidx, uname);
	}
	
	
	
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
	}
	public String getCmsg() {
		return cmsg;
	}
	public void setCmsg(String cmsg) {
		this.cmsg = cmsg;
	}
	public Date getCregdate() {
		return cregdate;
	}
	public void setCregdate(Date cregdate) {
		this.cregdate = cregdate;
	}
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Comment() {
	}
	
	
	
	public Comment(int cidx, String cmsg, Date cregdate, int bidx, String uname) {
		this.cidx = cidx;
		this.cmsg = cmsg;
		this.cregdate = cregdate;
		this.bidx = bidx;
		this.uname = uname;
	}
	@Override
	public String toString() {
		return "Comment [cidx=" + cidx + ", cmsg=" + cmsg + ", cregdate=" + cregdate + ", bidx=" + bidx + ", uname="
				+ uname + "]";
	}
	
	
	
	
	

}
