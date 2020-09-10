package com.aia.it.daily.model;

public class DailyOrderEditForm {

	private int didx;
	private String ddate;
	private int ddidx;

	public DailyOrderEditForm() {
	}

	public int getDidx() {
		return didx;
	}

	public void setDidx(int didx) {
		this.didx = didx;
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
		return "DailyEditOrder [didx=" + didx + ", ddate=" + ddate + ", ddidx=" + ddidx + "]";
	}

}
