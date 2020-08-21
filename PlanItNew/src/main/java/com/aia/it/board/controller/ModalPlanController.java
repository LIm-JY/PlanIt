package com.aia.it.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aia.it.daily.service.DailyListService;

@Controller
public class ModalPlanController {
	
	@Autowired
	private DailyListService listDailyService;
	
	@RequestMapping("/board/planModal")
	public String getModalPaln(Model model, 
			HttpSession session, 
			HttpServletRequest request) {
		
		model.addAttribute("listView", listDailyService.getDailyView(session, request));

		return "board/planModal";
	}

}
