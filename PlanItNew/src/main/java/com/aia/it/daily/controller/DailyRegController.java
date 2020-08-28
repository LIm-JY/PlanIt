package com.aia.it.daily.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aia.it.daily.model.DailyRegRequest;
import com.aia.it.daily.service.DailyRegService;

@Controller
@RequestMapping("/daily/dailyReg")
public class DailyRegController {

	@Autowired
	DailyRegService regService;

	@RequestMapping(method = RequestMethod.GET)
	public String getDailyRegForm() {
		return "daily/dailyRegForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String getDailyReg(HttpServletRequest request, DailyRegRequest regRequest, Model model) {

		System.out.println("controller : " + regRequest);
		model.addAttribute("result", regService.dailyReg(regRequest, request));

		return "daily/dailyReg";
	}

}
/*
 * @PostMapping public int getDailyReg ( HttpServletRequest request,
 * DailyRegRequest regRequest ) {
 * 
 * System.out.println("Daily REG controller : "+regRequest);
 * 
 * return regService.dailyReg(regRequest, request); }
 */
