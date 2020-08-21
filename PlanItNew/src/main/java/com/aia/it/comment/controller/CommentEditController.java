package com.aia.it.comment.controller;

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
import com.aia.it.comment.model.CommentEditRequest;
import com.aia.it.comment.service.CommentEditService;

@Controller
@RequestMapping("/comment/commentEdit")
public class CommentEditController {
	
	@Autowired
	private CommentEditService editService;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String getCommentdEditForm(
			@RequestParam("cidx") int cidx,
			Model model) {
		model.addAttribute("comment", editService.getComment(cidx));
		return"comment/commentEditForm";
	}
	
	
	@RequestMapping(method = RequestMethod.POST)
	public String getCommentEdit(
			CommentEditRequest editRequest,
			HttpServletRequest request,
			Model model
			) throws IllegalStateException, IOException, SQLException {
		
		System.out.println("controller: "+editRequest);
		
		model.addAttribute("result", editService.commentEdit(editRequest,request));
				return "comment/commentEdit";
		
	}
	

}
