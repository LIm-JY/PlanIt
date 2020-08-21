package com.aia.it.member.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aia.it.member.model.MemberRegRequest;
import com.aia.it.member.service.MemberRegService;

@Controller
@RequestMapping("/member/memberReg")
public class MemberRegController {
	
	@Autowired
	MemberRegService regService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getMemberRegForm() {
		return "member/memberRegForm"; 
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String getMemberReg(MemberRegRequest regRequest, 
								HttpServletRequest request,
								Model model) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException{
		
		model.addAttribute("result", regService.memberReg(regRequest, request));
		
		return "member/memberReg";
	}
	
}
