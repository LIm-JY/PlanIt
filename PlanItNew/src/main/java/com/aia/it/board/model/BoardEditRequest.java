package com.aia.it.board.model;

import org.springframework.web.multipart.MultipartFile;


public class BoardEditRequest {
	
	private int bidx;
	private String btitle; //게시글 제목
	private String bmsg; //게시글 내용
	private MultipartFile bphoto1; //게시글 사진
	private MultipartFile bphoto2; //게시글 사진
	private String oldFile1;
	private String oldFile2;
	private int uidx;//회원 닉네임
	private String pidx;

		
	
	
	public BoardEditRequest() {
	}
	
	
	public BoardEditRequest(int bidx, String btitle, String bmsg, MultipartFile bphoto1, MultipartFile bphoto2,
			String oldFile1, String oldFile2, int uidx, String pidx) {
		this.bidx = bidx;
		this.btitle = btitle;
		this.bmsg = bmsg;
		this.bphoto1 = bphoto1;
		this.bphoto2 = bphoto2;
		this.oldFile1 = oldFile1;
		this.oldFile2 = oldFile2;
		this.uidx = uidx;
		this.pidx = pidx;
	}


	public String getPidx() {
		return pidx;
	}


	public void setPidx(String pidx) {
		this.pidx = pidx;
	}


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
	public String getOldFile1() {
		return oldFile1;
	}
	public void setOldFile1(String oldFile1) {
		this.oldFile1 = oldFile1;
	}
	public String getOldFile2() {
		return oldFile2;
	}
	public void setOldFile2(String oldFile2) {
		this.oldFile2 = oldFile2;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public Board toBoard() {
		int pidx = 0;
		try {
			pidx = Integer.parseInt(this.pidx);
		} catch (Exception e) {
			System.out.println("숫자 변경안됨");
		}
		return new Board(bidx,btitle, bmsg, oldFile1, oldFile2,null,pidx, uidx);
	}

	@Override
	public String toString() {
		return "BoardEditRequest [bidx=" + bidx + ", btitle=" + btitle + ", bmsg=" + bmsg + ", bphoto1=" + bphoto1
				+ ", bphoto2=" + bphoto2 + ", oldFile1=" + oldFile1 + ", oldFile2=" + oldFile2 + ", uidx=" + uidx
				+ ", pidx=" + pidx + "]";
	}

	
	
	
	
	
	
	
	
	
	

}
