package com.aia.it.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aia.it.board.service.BoardDeleteService;

@Controller
public class BoardDeleteController {
   
@Autowired
   private BoardDeleteService deleteService;
   
   @RequestMapping("/board/boardDelete")
   public String deleteBoard(
            @RequestParam("bidx") int bidx,
            HttpServletRequest request,
            Model model
         ) {
      
      model.addAttribute("msg", deleteService.boardDelete(bidx,request));
      return "board/boardDelete";
      
   }

}