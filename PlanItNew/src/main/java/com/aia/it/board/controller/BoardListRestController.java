package com.aia.it.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.aia.it.daily.service.DailyListService;
import com.aia.it.planner.model.PlannerJoinDaily;

@RestController
@RequestMapping("/board/boardWriteForm")
public class BoardListRestController {
	
	@Autowired
	private DailyListService listDailyService;
	
	@GetMapping
	public List<PlannerJoinDaily> getBoardForm(
			@RequestParam("uidx") int uidx,
			@RequestParam("pidx") int pidx
			) {
		
		return listDailyService.getView(uidx, pidx);
	}

}
