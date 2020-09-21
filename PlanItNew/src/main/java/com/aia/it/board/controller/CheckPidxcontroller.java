package com.aia.it.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aia.it.board.service.CheckPidxService;

@Controller
public class CheckPidxcontroller {
	
	@Autowired
	private CheckPidxService checkPidxService;
	
	@RequestMapping("/board/checkPidx")
	@ResponseBody
	public String checkPidx(
			@RequestParam("pidx") int pidx,
			Model model) {
		
		return checkPidxService.checkPidx(pidx);
	}
	

}
