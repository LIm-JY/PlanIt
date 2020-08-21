package com.aia.it.daily.model;

import java.util.List;

import com.aia.it.planner.model.Planner;
import com.aia.it.planner.model.PlannerJoinDaily;

public class DailyList {

		//private int dailyTotalCount;		
		private List<PlannerJoinDaily> DailyList;

		@Override
		public String toString() {
			return "DailyList [DailyList=" + DailyList + "]";
		}

		public DailyList(List<PlannerJoinDaily> dailyList) {
			DailyList = dailyList;
		}

		public DailyList() {
		}

		public List<PlannerJoinDaily> getDailyList() {
			return DailyList;
		}

		public void setDailyList(List<PlannerJoinDaily> dailyList) {
			DailyList = dailyList;
		}
		
		
	
	
}
