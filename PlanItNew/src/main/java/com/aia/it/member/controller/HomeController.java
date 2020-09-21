package com.aia.it.member.controller;


import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aia.it.board.service.BoardListService;
import com.aia.it.planner.service.PlannerListService;


@Controller
public class HomeController {

	@Autowired
	private BoardListService boardListService;
	
	@Autowired
	private PlannerListService plannerListService;
	
	@RequestMapping("/mainHome")
	public String home(
			Model model, int uidx,
			HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		
		System.out.println("여기 거쳤다");
		model.addAttribute("plannerListView",plannerListService.plannerList(uidx));
		model.addAttribute("boardListView", boardListService.getView(request, response));

		
		return "mainHome"; 
	}
	
	@ExceptionHandler(NullPointerException.class)
	public String handleNullPointerException(NullPointerException e) {

		e.printStackTrace();

		return "error/nullPointer";

	}
}
