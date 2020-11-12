package com.aia.it.board.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.it.board.model.Like;
import com.aia.it.board.service.LikeDeleteService;
import com.aia.it.board.service.LikeInsertService;
import com.aia.it.board.service.LikeSelectService;

@RestController
@RequestMapping("/board/boardView")
public class LikeInsertController {
	
	@Autowired
	LikeInsertService likeInsertService;
	
	@Autowired
	LikeDeleteService likeDeleteService;
	
	@Autowired
	LikeSelectService likeSelectService;

	 
		
	/*
	 * @PostMapping public List<LikeCountList> getLikeList (LikeInsert list){
	 * 
	 * System.out.println("LIKEINFORMATION_CONTROLLER"+list.getLikeInsert());
	 * 
	 * return likeSelectService.boardLikeList(list); }
	 */
	
		
		
		
		
		
		@GetMapping("/{uidx}/{bidx}")
		public int getLikeSelect(
				@PathVariable("uidx") int uidx,
				@PathVariable("bidx") int bidx) {
			
			System.out.println("여기는 컨트롤러!!!"+uidx+"+"+bidx);
			
			return likeSelectService.selectLike(uidx, bidx);
		}
		
		@GetMapping("/{bidx}")
		public int getLikeSelectAll(
				@PathVariable("bidx") int bidx) {
			
			System.out.println("여기는 djfakdf;ladjflakdsjf;l!!!"+bidx);
			
			return likeSelectService.selectAllLike(bidx);
		}
	
	@PostMapping
	public int getLikeInsertReg(
			Like like,
			Model model){
		
		System.out.println(like);
		
		/* model.addAttribute("result", likeInsertService.likeInsert1(like)); */
		return likeInsertService.likeInsert1(like);
		
	}
	
	@DeleteMapping("/{uidx}/{bidx}")
	public int getLikeDelete(
			@PathVariable("uidx") int uidx,
			@PathVariable("bidx") int bidx) {
		
		System.out.println("여기는 컨트롤러!!!"+uidx+"+"+bidx);
		
		return likeDeleteService.deleteLike(uidx, bidx);
	}
	
	
	
	
	
	
	
	
	
	
	
//	@Autowired
//	private LikeInsertService insertService;
//	

//		@RequestMapping(method = RequestMethod.POST)
//	public int getInsert(
//			LikeInsert like
//			) {
//		System.out.println("컨트롤러까지 들어옴LikeInsert"+like);
//		return insertService.likeInsert(like);
//	}
//	
	

}
