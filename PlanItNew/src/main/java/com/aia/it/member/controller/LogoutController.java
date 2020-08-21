package com.aia.it.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aia.it.member.service.LogoutService;

@Controller
public class LogoutController {

	@Autowired
	LogoutService logoutService;
	
	@RequestMapping("login/logout")
	public String logout(HttpSession session) {
	
	logoutService.logout(session);
	
	String viewName = "redirect:/home";
	
	return viewName;
	

	}
	
}
