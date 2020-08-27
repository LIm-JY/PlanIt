package com.aia.it.planner.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.it.planner.model.Planner;
import com.aia.it.planner.service.PlannerDeleteService;
import com.aia.it.planner.service.PlannerListService;

@RestController
@RequestMapping("/planner/plannerRest")
public class PlannerRestController {

	@Autowired
	PlannerListService listService;
	
	@Autowired
	PlannerDeleteService deleteService;
	
	@GetMapping("/{uidx}")
	public List<Planner> getPlannerList (
			@PathVariable("uidx") int uidx
								) {
		
		System.out.println("uidx : "+uidx );
		
		
		return listService.plannerList(uidx);
	}
	
	@DeleteMapping("/{pidx}")
	public int delete(
			@PathVariable("pidx") int pidx
			) {
		return deleteService.deleteMember(pidx);
	}
	
	
	
	
}
