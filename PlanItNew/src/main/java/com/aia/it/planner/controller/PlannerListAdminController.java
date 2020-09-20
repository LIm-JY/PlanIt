package com.aia.it.planner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aia.it.planner.service.PlannerListService;

@Controller
@RequestMapping("/planner/plannerListAdmin")
public class PlannerListAdminController {

		@GetMapping
		public String getPlannerListView() {
			
			return "planner/plannerListAdmin";
		}
		
	
	
	
}
