package com.aia.it.daily.model;

import java.util.Date;

public class Daily {
	
	private int didx;
	private String dloc;
	private String dloclon;
	private String dloclat;
	private String dmsg;
	private String dphoto;
	private String dtype;
	private String ddate;
	private int ddidx;
	private int pidx;

	
	
	
	public Daily() {

	}

	public Daily(String dloc, String dloclon, String dloclat, String dmsg, String dtype, String ddate, int ddidx, int pidx) {
		this(0,dloc,dloclon,dloclat,dmsg,null,dtype, ddate, ddidx ,pidx);
	}

	public Daily(int didx, String dloc, String dloclon, String dloclat, String dmsg, String dphoto, String dtype,
			String ddate, int ddidx, int pidx) {
		super();
		this.didx = didx;
		this.dloc = dloc;
		this.dloclon = dloclon;
		this.dloclat = dloclat;
		this.dmsg = dmsg;
		this.dphoto = dphoto;
		this.dtype = dtype;
		this.ddate = ddate;
		this.ddidx = ddidx;
		this.pidx = pidx;
	}

	public int getDidx() {
		return didx;
	}

	public void setDidx(int didx) {
		this.didx = didx;
	}

	public String getDloc() {
		return dloc;
	}

	public void setDloc(String dloc) {
		this.dloc = dloc;
	}

	public String getDloclon() {
		return dloclon;
	}

	public void setDloclon(String dloclon) {
		this.dloclon = dloclon;
	}

	public String getDloclat() {
		return dloclat;
	}

	public void setDloclat(String dloclat) {
		this.dloclat = dloclat;
	}

	public String getDmsg() {
		return dmsg;
	}

	public void setDmsg(String dmsg) {
		this.dmsg = dmsg;
	}

	public String getDphoto() {
		return dphoto;
	}

	public void setDphoto(String dphoto) {
		this.dphoto = dphoto;
	}

	public String getDtype() {
		return dtype;
	}

	public void setDtype(String dtype) {
		this.dtype = dtype;
	}

	public int getPidx() {
		return pidx;
	}

	public void setPidx(int pidx) {
		this.pidx = pidx;
	}
	
	public String getDdate() {
		return ddate;
	}

	public void setDdate(String ddate) {
		this.ddate = ddate;
	}

	public int getDdidx() {
		return ddidx;
	}

	public void setDdidx(int ddidx) {
		this.ddidx = ddidx;
	}


	@Override
	public String toString() {
		return "Daily [didx=" + didx + ", dloc=" + dloc + ", dloclon=" + dloclon + ", dloclat=" + dloclat + ", dmsg="
				+ dmsg + ", dphoto=" + dphoto + ", dtype=" + dtype + ", ddate=" + ddate + ", ddidx=" + ddidx + ", pidx="
				+ pidx + "]";
	}

	

}
