
package com.aia.it.comment.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aia.it.board.service.BoardDeleteService;
import com.aia.it.comment.service.CommentDeleteService;

@Controller
public class CommentDeleteController {

	@Autowired
	private CommentDeleteService deleteService;

	@RequestMapping("/comment/commentDelete")
	public String deleteComment(

			@RequestParam("cidx") int cidx,  Model model) {

		model.addAttribute("msg", deleteService.commentDelete(cidx));
		return "comment/commentDelete";

	}

}
