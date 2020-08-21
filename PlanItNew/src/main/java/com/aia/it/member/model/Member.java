package com.aia.it.member.model;

import java.sql.Date;
import java.util.Random;

public class Member {
	
	
	private int uidx;
	private String uid; //사용자 이메일
	private String upw;
	private String uname;
	private String uphonenum;
	private String uphoto;
	private String ucode; 	//사용자 이메일 인증 코드 
	private char uverify;	//사용자 이메일 인증 여부 
	private char ukakao; 	//카카오톡 인증 여부
	private char usignout; 	//회원 탈퇴(비활성화) 여부
	private Date uregdate;
	
	
	public Member() {
		getRandomString();
	}

	

	public Member(int uidx, String uid, String upw, String uname, String uphonenum, String uphoto, String ucode,
			 Date uregdate) {
		this.uidx = uidx;
		this.uid = uid;
		this.upw = upw;
		this.uname = uname;
		this.uphonenum = uphonenum;
		this.uphoto = uphoto;
		this.ucode = ucode;
		this.uregdate = uregdate;
	}

	//publicRegRequest -> Member
	public Member(String uid, String upw, String uname, String uphonenum) { 
		this(0, uid, upw, uname, uphonenum,  null, null, null); 
	} 
		
	
	@Override
	public String toString() {
		return "Member [uidx=" + uidx + ", uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", uphonenum="
				+ uphonenum + ", uphoto=" + uphoto + ", ucode=" + ucode + ", uverify=" + uverify + ", ukakao=" + ukakao
				+ ", usignout=" + usignout + ", uregdate=" + uregdate + "]";
	}

	public int getUidx() {
		return uidx;
	}

	public void setUidx(int uidx) {
		this.uidx = uidx;
	}

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

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUphonenum() {
		return uphonenum;
	}

	public void setUphonenum(String uphonenum) {
		this.uphonenum = uphonenum;
	}

	public String getUphoto() {
		return uphoto;
	}

	public void setUphoto(String uphoto) {
		this.uphoto = uphoto;
	}

	public String getUcode() {
		return ucode;
	}

	public void setUcode(String ucode) {
		this.ucode = ucode;
	}

	public char getUverify() {
		return uverify;
	}

	public void setUverify(char uverify) {
		this.uverify = uverify;
	}

	public char getUkakao() {
		return ukakao;
	}

	public void setUkakao(char ukakao) {
		this.ukakao = ukakao;
	}

	public char getUsignout() {
		return usignout;
	}

	public void setUsignout(char usignout) {
		this.usignout = usignout;
	}

	public Date getUregdate() {
		return uregdate;
	}

	public void setUregdate(Date uregdate) {
		this.uregdate = uregdate;
	}	
	
	private void getRandomString() {
		Random r = new Random(System.nanoTime()); 
		StringBuffer sb = new StringBuffer(); 
		
		for(int i = 0; i < 20; i++) {
			if(r.nextBoolean()) { 
				sb.append(r.nextInt(10)); 
			}else { 
				sb.append((char)(r.nextInt(26)+97)); 
			}
		}
	}

}
