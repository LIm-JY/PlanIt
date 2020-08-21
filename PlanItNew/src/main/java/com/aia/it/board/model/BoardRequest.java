package com.aia.it.board.model;

import org.springframework.web.multipart.MultipartFile;

public class BoardRequest {
	
	private String btitle; //게시글 제목
	private String bmsg; //게시글 내용
	private MultipartFile bphoto1; //게시글 사진
	private MultipartFile bphoto2; //게시글 사진
	private int uidx;//회원 닉네임
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
	public MultipartFile getBphoto1() {
		return bphoto1;
	}
	public void setBphoto1(MultipartFile bphoto1) {
		this.bphoto1 = bphoto1;
	}
	public MultipartFile getBphoto2() {
		return bphoto2;
	}
	public void setBphoto2(MultipartFile bphoto2) {
		this.bphoto2 = bphoto2;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	@Override
	public String toString() {
		return "BoardRequest [btitle=" + btitle + ", bmsg=" + bmsg + ", bphoto1=" + bphoto1 + ", bphoto2=" + bphoto2
				+ ", uidx=" + uidx + "]";
	}
	
	
	public Board toBoard() {
		
		return new Board(btitle,bmsg,uidx);
	}
	

}
