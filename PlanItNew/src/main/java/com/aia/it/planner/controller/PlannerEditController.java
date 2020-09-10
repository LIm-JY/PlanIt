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
import com.aia.it.planner.service.PlannerEditService;

@Controller
@RequestMapping("/planner/plannerEdit")
public class PlannerEditController {

	@Autowired
	PlannerEditService editService;
	
	@Autowired
	CalendarService calService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getPlannerRegForm() {
		return "planner/plannerEditForm";
	}
	@RequestMapping(method = RequestMethod.POST)
	public String getPlannerReg (HttpServletRequest request,
								Planner planner,
								@RequestParam("pidx") String pidx,
								@RequestParam("pstartdate") String pstartdate,
								@RequestParam("penddate") String penddate,
								@RequestParam("ptitle") String ptitle,
								Model model) {
		
		
		
		
		/*
		 * model.addAttribute("result", editService.plannerEdit(planner, request));
		 */		
		model.addAttribute("dateList", calService.getDateList(pstartdate, penddate));
		model.addAttribute("pidx", pidx);
		model.addAttribute("startdate",pstartdate);
		model.addAttribute("enddate",penddate);
		model.addAttribute("ptitle",ptitle);

		
		
		
		
		return "planner/plannerRegForm";
	}
	
}
