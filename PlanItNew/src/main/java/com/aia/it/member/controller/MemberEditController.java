package com.aia.it.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aia.it.member.model.MemberEditRequest;
import com.aia.it.member.service.MemberEditService;
import com.aia.it.member.service.MyPageViewService;

@Controller
@RequestMapping("/member/memberEdit")
public class MemberEditController {
	
	@Autowired
	MemberEditService editService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String memberEditForm(
			@RequestParam("uidx") int uidx, 
			Model model
			) {
		
		model.addAttribute("member", editService.getMember(uidx));
		
		return "member/memberEditForm";
		
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String memberEdit(
			@RequestParam("uidx") int uidx,
			MemberEditRequest editReq,
			HttpServletRequest req, 
			Model model) {
		
		model.addAttribute("result", editService.memberEdit(uidx, editReq, req)); 
	
		return "member/memberEdit"; 
	}
	
	
	
}
