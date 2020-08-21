package com.aia.it.planner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aia.it.planner.model.Planner;
import com.aia.it.planner.service.PlannerEditService;
import com.aia.it.planner.service.PlannerListService;

@Controller
@RequestMapping("/planner/plannerList")
public class PlannerListController {

	@Autowired
	PlannerListService listService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getPlannerRegForm() {
		return "planner/plannerEditForm";
	}
	@RequestMapping(method = RequestMethod.POST)
	public String getPlannerReg (HttpServletRequest request,
							HttpServletResponse response,
								Model model) {
		model.addAttribute("result", listService.plannerList(response, request));
		return "planner/plannerEdit";
	}
	
	
}
