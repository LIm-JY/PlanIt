package com.aia.it.planner.model;

import java.util.List;

public class PlannerList {

	private int plannerTotalCount;
	private int currentPageNumber;
	private List<Planner> plannerList;
	private int pageTotalCount;
	private int plannerCountPerpage;
	private int startRow;

	public PlannerList() {
	}

	public PlannerList(int plannerTotalCount, int currentPageNumber, List<Planner> plannerList, int plannerCountPerpage,
			int startRow) {
		this.plannerTotalCount = plannerTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.plannerList = plannerList;
		this.plannerCountPerpage = plannerCountPerpage;
		this.startRow = startRow;
		calTotalCount();
	}

	private void calTotalCount() {

		if (plannerTotalCount == 0) {

			pageTotalCount = 0;

		} else {

			pageTotalCount = plannerTotalCount / plannerCountPerpage;
			System.out.println("보드/카운트페이지" + plannerTotalCount % plannerCountPerpage);

			if (plannerTotalCount % plannerCountPerpage > 0) {
				pageTotalCount++;
			}

			System.out.println("pageTotalCount" + pageTotalCount);
		}
	}

	public int getPlannerTotalCount() {
		return plannerTotalCount;
	}

	public void setPlannerTotalCount(int plannerTotalCount) {
		this.plannerTotalCount = plannerTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<Planner> getPlannerList() {
		return plannerList;
	}

	public void setPlannerList(List<Planner> plannerList) {
		this.plannerList = plannerList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getPlannerCountPerpage() {
		return plannerCountPerpage;
	}

	public void setPlannerCountPerpage(int plannerCountPerpage) {
		this.plannerCountPerpage = plannerCountPerpage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	@Override
	public String toString() {
		return "PlannerList [plannerTotalCount=" + plannerTotalCount + ", currentPageNumber=" + currentPageNumber
				+ ", plannerList=" + plannerList + ", pageTotalCount=" + pageTotalCount + ", plannerCountPerpage="
				+ plannerCountPerpage + ", startRow=" + startRow + "]";
	}
	
	
	
	

}
