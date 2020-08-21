package com.aia.it.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aia.it.board.service.BoardViewService;
import com.aia.it.comment.service.CommentListService;

@Controller
public class BoardViewController {
   
   @Autowired
   private BoardViewService viewService;
   
   @Autowired
	private CommentListService cListService ;
   
   //사용자가 요청하는거 : http://localhost:8080/it/board/view/숫자
   @RequestMapping("/board/{bidx}") 
   public String getBoardInfo(
         @PathVariable("bidx") int bidx,
         Model model,
         HttpServletRequest request,
			HttpServletResponse response) {
      
      model.addAttribute("viewBoard", viewService.getBoardInfo(bidx));
      model.addAttribute("commentistView", cListService.getView(bidx, request, response));
      return "board/boardView";
   }
   
   
   
   
   
   
   

}