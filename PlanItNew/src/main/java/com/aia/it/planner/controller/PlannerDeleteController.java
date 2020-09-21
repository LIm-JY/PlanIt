package com.aia.it.planner.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aia.it.planner.model.Planner;
import com.aia.it.planner.service.PlannerDeleteService;

@Controller
@RequestMapping("/planner/plannerDelete")
public class PlannerDeleteController {



		@Autowired
		PlannerDeleteService deleteService;
		
		@RequestMapping(method = RequestMethod.GET)
		public String getPlannerRegForm() {
			return "planner/plannerDeleteForm";
		}
		@RequestMapping(method = RequestMethod.POST)
		public String getPlannerReg (HttpServletRequest request,
									Planner planner,
									Model model) {
			System.out.println(planner);
			/*
			 * model.addAttribute("result", deleteService.deleteMember(pidx);
			 */			return "planner/plannerDelete";
		}
	
	
}
