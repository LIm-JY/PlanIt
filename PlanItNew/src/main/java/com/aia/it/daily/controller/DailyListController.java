package com.aia.it.daily.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.it.daily.service.DailyListService;
import com.aia.it.planner.model.PlannerJoinDaily;

@RestController
@RequestMapping("/planner/dailyList")
public class DailyListController {

		@Autowired
		private DailyListService listService;
		
		/* @RequestMapping(method = RequestMethod.POST) */
		@GetMapping
		public List<PlannerJoinDaily> getBoardList(
				int uidx,
					Model model,
					HttpServletRequest request
					) {
			
//			int idx = Integer.parseInt(uidx);
			System.out.println(uidx);
			/* model.addAttribute("listView", listService.getView(request, uidx)); */
			
			return listService.getView(request, uidx);
			
		}
			
	
	
	
	
	
	
}
