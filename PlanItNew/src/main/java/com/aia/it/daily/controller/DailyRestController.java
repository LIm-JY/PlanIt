package com.aia.it.daily.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.it.daily.model.DailyRegRequest;
import com.aia.it.daily.service.DailyListService;
import com.aia.it.daily.service.DailyRegService;
import com.aia.it.planner.model.PlannerJoinDaily;

@RestController
@RequestMapping("/planner/dailyRest")
public class DailyRestController {

		@Autowired
		private DailyListService listService;
		
		@Autowired
		DailyRegService regService;
		
		
		
		@PostMapping
		public int getDailyReg (DailyRegRequest regRequest,
				HttpServletRequest request
									) {
			
			System.out.println("Daily REG controller : "+regRequest);
			
			return regService.dailyReg(regRequest, request);
		}
			
		
		@GetMapping
		public List<PlannerJoinDaily> getDailyList(
				int uidx,
				int pidx
			
					) {
			
			System.out.println("uidx : "+uidx+" pidx : "+pidx);
			
			return listService.getView( uidx, pidx);
			
		}
	
	
		
		
	
}
