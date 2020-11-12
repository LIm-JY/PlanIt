package com.aia.it.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.it.board.model.LikeList;
import com.aia.it.board.service.LikeJoinMemberService;

@RestController
@RequestMapping("/board/boardList")
public class JoinBMLController {
	
	@Autowired
	LikeJoinMemberService LJMService;
	
	@GetMapping("/{bidx}")
	public List<LikeList> getBandMSelect(
			@PathVariable("bidx") int bidx,
			Model model) {
		
		System.out.println("여기는 조인했다!!!!"+bidx);
		return LJMService.bAndMSelect(bidx);
	}
	
	

}
