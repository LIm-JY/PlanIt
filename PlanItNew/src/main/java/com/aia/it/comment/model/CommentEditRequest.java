package com.aia.it.comment.model;


public class CommentEditRequest {
	
	private int cidx; //댓글 식별번호
	private String cmsg;
	private int bidx;
	private String uname;
	
	public Comment toComment() {
		
		return new Comment(cidx,cmsg, null, bidx, uname);
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
	public CommentEditRequest() {
	}
	public CommentEditRequest(int cidx, String cmsg, int bidx, String uname) {
		this.cidx = cidx;
		this.cmsg = cmsg;
		this.bidx = bidx;
		this.uname = uname;
	}


	@Override
	public String toString() {
		return "CommentEditRequest [cidx=" + cidx + ", cmsg=" + cmsg + ", bidx=" + bidx + ", uname=" + uname + "]";
	}
	
	
	
}
