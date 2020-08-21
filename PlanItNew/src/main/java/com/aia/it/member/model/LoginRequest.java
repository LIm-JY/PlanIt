package com.aia.it.member.model;

public class LoginRequest {

	private String uid;
	private String upw;
	private String redirectUri;
	private String remember;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public String getRedirectUri() {
		return redirectUri;
	}
	public void setRedirectUri(String redirectUri) {
		this.redirectUri = redirectUri;
	}
	public String getRemember() {
		return remember;
	}
	public void setRemember(String remember) {
		this.remember = remember;
	}
	
	@Override
	public String toString() {
		return "LoginRequest [uid=" + uid + ", upw=" + upw + ", redirectUri=" + redirectUri + ", remember=" + remember
				+ "]";
	}	
	
	
	
	
	
}
