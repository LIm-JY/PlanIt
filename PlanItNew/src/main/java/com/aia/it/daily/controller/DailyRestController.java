package com.aia.it.daily.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.aia.it.daily.model.Daily;
import com.aia.it.daily.model.DailyEditRequest;
import com.aia.it.daily.model.DailyRegRequest;
import com.aia.it.daily.service.DailyDeleteService;
import com.aia.it.daily.service.DailyEditService;
import com.aia.it.daily.service.DailyListService;
import com.aia.it.daily.service.DailyRegService;
import com.aia.it.daily.service.DailyViewService;
import com.aia.it.planner.model.PlannerJoinDaily;

@RestController
@RequestMapping("/planner/dailyRest")
public class DailyRestController {

		@Autowired
		private DailyListService listService;
		
		@Autowired
		private DailyRegService regService;
		
		@Autowired
		private DailyDeleteService deleteService;
		
		@Autowired
		private DailyEditService editService;
		
		@Autowired
		private DailyViewService viewService;
		
		
		@PostMapping
		public int getDailyReg (DailyRegRequest regRequest,
				HttpServletRequest request
									) {
			
			System.out.println("Daily REG controller : "+regRequest);
			
			return regService.dailyReg(regRequest, request);
		}
			
		
		@GetMapping
		public List<PlannerJoinDaily> getDailyList(
				@RequestParam("uidx") int uidx,
				@RequestParam("pidx") int pidx
			
					) {
			
			System.out.println("Restcontroller pidx : "+uidx+" pidx : "+pidx);
			
			return listService.getView(uidx, pidx);
			
		}
	
		@DeleteMapping("/{didx}")
		public int deleteDaily(
				@PathVariable("didx") int didx
				) {
			return deleteService.deleteDaily(didx);
		}
		
		//하나의 데일리 정보 보기
		@GetMapping("/{didx}")
		public Daily getDaily(
				@PathVariable("didx") int didx
				){
			return viewService.getDaily(didx);
		}
		
		
		//데일리 정보 수정
		@PostMapping("/{didx}")
		public int editDaily(
				@PathVariable("didx") int didx,
				 DailyEditRequest editRequest,
				HttpServletRequest request
				) {
			
			editRequest.setDidx(didx);

			
			
			return editService.editDaily(editRequest, request);

			
		}

		
		
		
	
}
