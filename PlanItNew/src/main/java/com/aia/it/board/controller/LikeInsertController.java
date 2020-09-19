package com.aia.it.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aia.it.board.model.Like;
import com.aia.it.board.service.LikeInsertService;

@Controller
@RequestMapping("/board/boardView")
public class LikeInsertController {
	
	@Autowired
	private LikeInsertService insertService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getInsertLike(
			
			) {
		
		return "board/boardView";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String getInsert(
			Like like, 
			Model model,
			HttpServletRequest request
			) {
		
		model.addAttribute("result", insertService.likeInsert(like));
		
		return "board/boardView";
	}
	
	

}
