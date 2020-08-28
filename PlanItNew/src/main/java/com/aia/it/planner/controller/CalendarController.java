package com.aia.it.planner.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aia.it.planner.model.Planner;
import com.aia.it.planner.service.CalendarService;
import com.aia.it.planner.service.PlannerRegService;

@Controller
@RequestMapping("/planner/calendar")
public class CalendarController {
	
	@Autowired
	CalendarService calService;
	
	@Autowired
	private PlannerRegService regService;

	@RequestMapping(method = RequestMethod.GET)
	public String getCalendarForm() {
		return "planner/calendarRegForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String getDate(	
			Planner planner,
			HttpServletRequest request,
			@RequestParam("pstartdate") String pstartdate,
			@RequestParam("penddate") String penddate,
			@RequestParam("ptitle") String ptitle,
			Model model) {
		
		model.addAttribute("result", regService.plannerReg(planner, request));
		
		model.addAttribute("dateList", calService.getDateList(pstartdate, penddate));
		
		model.addAttribute("startdate",pstartdate);
		model.addAttribute("enddate",penddate);
		model.addAttribute("ptitle",ptitle);

		return "planner/plannerRegForm";
	}
}