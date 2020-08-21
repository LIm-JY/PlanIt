package com.aia.it.board.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aia.it.board.model.BoardEditRequest;
import com.aia.it.board.service.BoardEditService;

@Controller
@RequestMapping("/board/boardEdit")
public class BoardEditController {
	
	@Autowired
	private BoardEditService editService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getBoardEditForm(
			@RequestParam("bidx") int bidx,
			Model model) {
		model.addAttribute("board", editService.getBoard(bidx));
		return"board/boardEditForm";
	}
	
	
	@RequestMapping(method = RequestMethod.POST)
	public String getBoardEdit(
			BoardEditRequest editRequest,
			HttpServletRequest request,
			Model model
			) throws IllegalStateException, IOException, SQLException {
		
		System.out.println("controller: "+editRequest);
		
		model.addAttribute("result", editService.boardEdit(editRequest,request));
				return "board/boardEdit";
		
	}
	

}
