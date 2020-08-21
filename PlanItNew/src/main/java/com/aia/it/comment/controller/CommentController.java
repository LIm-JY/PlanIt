package com.aia.it.comment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aia.it.board.service.BoardListService;
import com.aia.it.comment.model.Comment;
import com.aia.it.comment.model.CommentRequest;
import com.aia.it.comment.service.CommentService;

@Controller
@RequestMapping("/comment/comment")
public class CommentController {
	
	
	@Autowired
	CommentService cService;
	
	@Autowired
	BoardListService bService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getCommentForm(
			HttpServletResponse response,
			HttpServletRequest request,
			Model model
			) {
		
		
		model.addAttribute("listView",bService.getView(request, response));

		return "comment/commentForm";
		
	}
	
		
	@RequestMapping(method = RequestMethod.POST)
	public String getComment(Comment comment,
			HttpServletRequest request,
			Model model
			) {
		System.out.println("controller: "+comment);
		
		model.addAttribute("result", cService.commentWrite(comment, request));
		
		return "comment/comment";
		
		
	}
	

	
	
	
	
}
