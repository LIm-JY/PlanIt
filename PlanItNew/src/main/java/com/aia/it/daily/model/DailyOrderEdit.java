package com.aia.it.daily.model;

import java.util.List;

public class DailyOrderEdit {

	private List<DailyOrderEditForm> DailyOrderEdit;

	public DailyOrderEdit() {
	}

	public DailyOrderEdit(List<DailyOrderEditForm> DailyOrderEdit) {
		this.DailyOrderEdit = DailyOrderEdit;
	}

	public List<DailyOrderEditForm> getOrderEdit() {
		return DailyOrderEdit;
	}

	public void setOrderEdit(List<DailyOrderEditForm> DailyOrderEdit) {
		this.DailyOrderEdit = DailyOrderEdit;
	}

	@Override
	public String toString() {
		return "DailyOrderEdit [DailyOrderEdit=" + DailyOrderEdit + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
