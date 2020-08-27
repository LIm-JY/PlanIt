package com.aia.it.admin.model;

import java.sql.Date;

public class Admin {
	
	
	
	private String adminId;
	private String adminPw;
	private String eMail;
	private Date regDate;
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminPw=" + adminPw + ", eMail=" + eMail + ", regDate=" + regDate + "]";
	}
	
	
	

}
