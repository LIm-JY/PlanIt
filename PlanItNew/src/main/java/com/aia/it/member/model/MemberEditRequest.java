package com.aia.it.member.model;

import org.springframework.web.multipart.MultipartFile;

public class MemberEditRequest {
	
	private int uidx; 
	private String uid; 
	private String upw; 
	private String uname; 
	private String uphonenum;
	private MultipartFile photo; 
	private String oldFile;
	public int getUidx() {
		return uidx;
	}
	public String getUid() {
		return uid;
	}
	public String getUpw() {
		return upw;
	}
	public String getUname() {
		return uname;
	}
	public MultipartFile getPhoto() {
		return photo;
	}
	public String getOldFile() {
		return oldFile;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	public void setOldFile(String oldFile) {
		this.oldFile = oldFile;
	}
	
	public String getUphonenum() {
		return uphonenum;
	}
	public void setUphonenum(String uphonenum) {
		this.uphonenum = uphonenum;
	}
	public Member toMember() {
		return new Member(uidx, uid, upw, uname, uphonenum, oldFile.length()>0?oldFile:null, null, null);
	}
	@Override
	public String toString() {
		return "MemberEditRequest [uidx=" + uidx + ", uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", uphonenum="
				+ uphonenum + ", photo=" + photo + ", oldFile=" + oldFile + "]";
	}
	
	
	
	
	

}
