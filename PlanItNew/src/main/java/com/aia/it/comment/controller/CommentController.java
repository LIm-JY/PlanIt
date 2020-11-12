
package com.aia.it.comment.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aia.it.board.service.BoardListService;
import com.aia.it.comment.model.Comment;
import com.aia.it.comment.service.CommentService;

@Controller

@RequestMapping("/comment/comment")
public class CommentController {

	@Autowired
	CommentService cService;

	@Autowired
	BoardListService bService;

	@RequestMapping(method = RequestMethod.GET)
	public String getCommentForm(HttpServletResponse response, 
			HttpServletRequest request, 
			Model model) throws SQLException {

		model.addAttribute("listView", bService.getView(request, response));

		return "comment/commentForm";

	}

	@RequestMapping(value = "/comment" , method = RequestMethod.POST)
	public ModelAndView getComment(Comment comment, HttpServletRequest request, ModelAndView model) {
		System.out.println("controller: " + comment);
		int res=-1;
		
		res = cService.commentWrite(comment);

		model.addObject("result", res);
		model.setViewName("jsonView");
		return model;

	}

}
