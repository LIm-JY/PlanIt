package com.aia.it.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aia.it.board.service.BoardDeleteService;
import com.aia.it.member.model.MemberEditRequest;
import com.aia.it.member.service.MemberEditService;
import com.aia.it.member.service.MyPageViewService;

@Controller
@RequestMapping("/member/memberDelete")
public class MemberDeleteController {
	
	@Autowired
	   private MemberDeleteService service;
	   
	   @RequestMapping("/member/memberDelete")
	   public String deleteMember(
	            @RequestParam("uidx") int uidx,
	            HttpServletRequest request,
	            Model model
	         ) {
	      
	      model.addAttribute("msg", service.memberDelete(uidx,request));
	      return "member/memberDelete";
	      
	   }
	
	
}
