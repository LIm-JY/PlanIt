package com.aia.it.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aia.it.board.model.BoardRequest;
import com.aia.it.board.service.BoardWriteService;
import com.aia.it.daily.service.DailyListService;

@Controller
@RequestMapping("/board/boardWrite")
public class BoardWriteController {
	
	@Autowired
	BoardWriteService writeService;

	
	@Autowired
	private DailyListService listService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getBoardList(
				Model model, 
				HttpSession session, 
				HttpServletRequest request
				) {
		
		model.addAttribute("dailyList", listService.getDailyView(session, request));
		return "board/boardWriteForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String getBoard(
			BoardRequest bRequest, 
			HttpServletRequest request, 
			Model model) {
		
		System.out.println("controller: "+bRequest);
		
		model.addAttribute("result" , writeService.boardWrite(bRequest, request));
		
		return "board/boardWrite";
		
	}
	
	
}

