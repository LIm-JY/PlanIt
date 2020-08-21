package com.aia.it.planner.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.aia.it.planner.model.Planner;

@Service
public class CalendarService {
	
	public List<LocalDate> getDateList(String startdate, String enddate) {

		List<LocalDate> dateList = new ArrayList<LocalDate>();

	    LocalDate sdd = LocalDate.parse(startdate);
	    LocalDate edd = LocalDate.parse(enddate);

		int betweenday = edd.getDayOfYear() - sdd.getDayOfYear();

		dateList.add(sdd);

		for (int i = 0; i < betweenday; i++) {

			sdd = sdd.plusDays(1);

			System.out.println(sdd);
			dateList.add(sdd);

		}
		
		System.out.println(dateList);
		return dateList;
	}

}
