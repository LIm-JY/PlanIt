package com.aia.it.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aia.it.member.model.LoginRequest;
import com.aia.it.member.service.KakaoLoginService;
import com.aia.it.member.service.KakaoRegService;

@Controller
@RequestMapping("/member/kakaoLoginForm")
public class KakaoLoginFormController {

	@Autowired
	KakaoLoginService kService;	
	
	@RequestMapping(method= RequestMethod.GET)
	public String kloginForm() {
		return "member/kakaoLoginForm";
		
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String kLogin(
			LoginRequest loginRequest,
			HttpSession session,
			HttpServletResponse response,
			Model model
			) {
		
		model.addAttribute("result", kService.kLogin(loginRequest, session, response));
		
		return "member/kakaoLogin";
	}
	
	
	
}
