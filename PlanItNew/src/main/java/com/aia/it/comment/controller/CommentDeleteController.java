package com.aia.it.comment.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aia.it.board.service.BoardDeleteService;
import com.aia.it.comment.service.CommentDeleteService;

@Controller
public class CommentDeleteController {

	@Autowired
	private CommentDeleteService deleteService;

	@RequestMapping("/comment/commentDelete")
	public ModelAndView deleteComment(

			@RequestParam("cidx") int cidx,  ModelAndView model) {
		int result = deleteService.commentDelete(cidx);
		model.addObject("result", result);
		model.setViewName("jsonView");
		return model;

	}

}
