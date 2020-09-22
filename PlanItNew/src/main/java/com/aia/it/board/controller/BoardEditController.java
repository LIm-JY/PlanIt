package com.aia.it.board.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aia.it.board.model.BoardEditRequest;
import com.aia.it.board.service.BoardEditService;
import com.aia.it.daily.service.DailyListService;

@Controller
@RequestMapping("/board/boardEdit")
public class BoardEditController {
	
	@Autowired
	private BoardEditService editService;
	
	@Autowired
	private DailyListService listDailyService;

	
	@RequestMapping(method = RequestMethod.GET)
	public String getBoardEditForm(
			@RequestParam("bidx") int bidx,
			Model model, HttpSession session, HttpServletRequest request) {
		model.addAttribute("board", editService.getBoard(bidx));
		model.addAttribute("dailyList", listDailyService.getDailyView(session, request));
		return"board/boardEditForm";
	}
	
	
	@RequestMapping(method = RequestMethod.POST)
	public String getBoardEdit(
			@RequestParam("bidx") int bidx, 
			BoardEditRequest editRequest,
			HttpServletRequest request,
			Model model
			)  {
		
		System.out.println("controller: "+editRequest);
		
		model.addAttribute("result", editService.boardEdit(bidx,editRequest,request));
				return "board/boardEdit";
		
	}
	

}
