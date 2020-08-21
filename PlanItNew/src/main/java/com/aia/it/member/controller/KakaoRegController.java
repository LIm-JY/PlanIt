package com.aia.it.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aia.it.member.model.MemberRegRequest;
import com.aia.it.member.service.KakaoRegService;
import com.aia.it.member.service.MemberRegService;
@Controller
@RequestMapping("/member/completeKakaoReg")
public class KakaoRegController {
	
		@Autowired
		private KakaoRegService regService;
		
		@RequestMapping(method = RequestMethod.GET)
		public String getMemberRegForm() {
			return "member/kakaoMemberRegForm";	
			}
		
		@RequestMapping(method = RequestMethod.POST)
		public String getMemberReg(
				MemberRegRequest regRequest,
				HttpServletRequest request,
				Model model
				) {
			
			System.out.println("k멤버 reg 컨트롤러 확인 : >>>>>>>>> " + regRequest);
			
			model.addAttribute("result", regService.kMemberReg(regRequest, request));
			
			return "member/memberReg";
	
	
	
	
		}
}