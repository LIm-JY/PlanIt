package com.aia.it.planner.model;

import java.util.List;


public class PlannerList {
	
	private int plannerTotalCount;
	private List<Planner> plannerList;
	
	
	public PlannerList() {
	}
	
	
	
	public PlannerList(int plannerTotalCount, List<Planner> plannerList) {
		this.plannerTotalCount = plannerTotalCount;
		this.plannerList = plannerList;
	}


	
	public int getPlannerTotalCount() {
		return plannerTotalCount;
	}
	public void setPlannerTotalCount(int plannerTotalCount) {
		this.plannerTotalCount = plannerTotalCount;
	}
	
	public List<Planner> getPlannerList() {
		return plannerList;
	}
	public void setPlannerList(List<Planner> plannerList) {
		this.plannerList = plannerList;
	}

	
	
	@Override
	public String toString() {
		return "PlannerList [plannerTotalCount=" + plannerTotalCount + ", plannerList=" + plannerList+ "]";
	}
	
	

}
