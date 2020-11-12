package com.aia.it.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.it.board.model.LikeCountList;
import com.aia.it.board.model.LikeInsert;
import com.aia.it.board.service.LikeSelectService;

@RestController
@RequestMapping("/board/like")
public class LikeBoardController {

	@Autowired
	LikeSelectService likeSelectService;

	 
		
		@PostMapping
		public List<LikeCountList> getLikeList (LikeInsert list){

			System.out.println("LIKEINFORMATION_CONTROLLER"+list.getLikeInsert());

			return likeSelectService.boardLikeList(list);
		}
	
	
	
	
}
