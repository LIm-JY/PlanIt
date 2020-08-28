package com.aia.it.planner.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.it.planner.model.Planner;
import com.aia.it.planner.service.PlannerListService;

@Controller
@RequestMapping("/planner/plannerList")
public class PlannerListController {

	@Autowired
	PlannerListService listService;
	
	@GetMapping
	public String getPlannerListView() {
		
		return "planner/plannerList";
	}
	

	
	
}
