package com.aia.it.member.model;

public class LoginInfo {
	
	private int uidx;
	
	private String uid;
	private String uname; 
	private String photo;
	
	
	
	public LoginInfo() {
	}
	
	public LoginInfo(String uid, String uname, String photo) {
		this.uid = uid;
		this.uname = uname;
		this.photo = photo;
	}
	
	public LoginInfo(int uidx, String uid, String uname, String photo) {
		this.uidx= uidx;
		this.uid = uid;
		this.uname = uname;
		this.photo = photo;
	}
	
	public String getUid() {
		return uid;
	}

	public String getUname() {
		return uname;
	}

	public String getPhoto() {
		return photo;
	}
	

	@Override
	public String toString() {
		return "LoginInfo [uidx=" + uidx + ", uid=" + uid + ", uname=" + uname + ", photo=" + photo + "]";
	}

	public int getUidx() {
		return uidx;
	}

	public void setUidx(int uidx) {
		this.uidx = uidx;
	}

	
	
}
