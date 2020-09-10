package com.aia.it.daily.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.it.daily.model.DailyOrderEdit;
import com.aia.it.daily.model.DailyOrderEditForm;
import com.aia.it.daily.service.DailyOrderEditService;

@RestController
@RequestMapping("/planner/dailyOrderEdit")
public class DailyOrderEditController {

	
	
	@Autowired
	DailyOrderEditService orderEditService;
	
	
	
	@PostMapping
	public int editDailyOrder(DailyOrderEdit daily){
		
		System.out.println("ccccc"+daily);

		
	System.out.println("컨트롤러까지 들어옴");


	
	/*
	 * daily.getDailyOrderEdit().set(0, daily.getDailyOrderEdit().get(0));
	 */
	
	
		
		return 	orderEditService.editOrder(daily);
	}
	
	
	
	
}
