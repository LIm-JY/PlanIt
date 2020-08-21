package com.aia.it.comment.model;


public class CommentRequest {
	
	private int cidx;
	private String cmsg;
	private int bidx;
	private String uname;
	
	public Comment toComment() {
		
		return new Comment(cidx,cmsg, bidx, uname);
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
	public CommentRequest() {
	}
	public CommentRequest(int cidx, String cmsg, int bidx, String uname) {
		this.cidx = cidx;
		this.cmsg = cmsg;
		this.bidx = bidx;
		this.uname = uname;
	}


	@Override
	public String toString() {
		return "CommentRequest [cidx=" + cidx + ", cmsg=" + cmsg + ", bidx=" + bidx + ", uname=" + uname + "]";
	}
	
	
	
}
