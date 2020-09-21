package com.aia.it.member.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aia.it.member.service.MyPageViewService;

@Controller
public class MyPageViewController {


	
	@Autowired
	private MyPageViewService service; 
	
	@RequestMapping("/myPage/{uidx}")
	public String getMyInfo (
					@PathVariable("uidx") int uidx,
				    Model model, HttpSession session, HttpServletRequest request) {
		
		model.addAttribute("myInfo", service.getMyPageView(uidx, session, request));
		
		return "member/myPage";
		
		
	}
					
	   
	   
}
