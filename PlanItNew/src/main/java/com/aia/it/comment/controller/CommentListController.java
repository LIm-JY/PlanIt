package com.aia.it.comment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aia.it.comment.service.CommentListService;

@Controller
public class CommentListController {

	
	@Autowired
	private CommentListService cListService ;
	
	@RequestMapping("/comment/commentList")
	public String getCommentList(
			int bidx,
			Model model,
			HttpServletRequest request,
			HttpServletResponse response) {
		
	model.addAttribute("commentistView", cListService.getView(bidx, request, response));
	
	return "board/boardView";
	
}
	
}
