package com.aia.it.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aia.it.member.service.VerifyEmailService;

@Controller
public class VerifyEmailController {
	
	@Autowired
	private VerifyEmailService verifyService; 
	
	@RequestMapping("/member/verify")
	public String verify(
							@RequestParam("uid") String uid, 
							@RequestParam("ucode") String ucode) {
		
		String verifyResult= verifyService.verify(uid, ucode); 
		
		return "member/verify"+verifyResult; 
	}
	
	
	//이메일 재발송 요청
	@ResponseBody
	@RequestMapping("/member/verify/reMailSend")
	public String reMailSend(@RequestParam("uid") String uid) {
		
		int rCnt = verifyService.reMailSend(uid); 
			
			return rCnt>0?"success":"fail"; 
		}
	
	}

