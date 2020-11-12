package com.aia.it.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.it.board.model.LikeInsert;
import com.aia.it.board.service.LikeInsertService;

@RestController
@RequestMapping("/board/likeInsert")
public class LController {
	
	@Autowired
	LikeInsertService lService;
	
	@PostMapping
	public int inLike(LikeInsert inLike) {
		
		return lService.likeInsert(inLike);
	}

}
