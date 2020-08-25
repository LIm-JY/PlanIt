//package com.aia.it.comment.controller;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.swing.text.AbstractDocument.Content;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.aia.it.board.service.BoardListService;
//import com.aia.it.comment.model.Comment;
//import com.aia.it.comment.service.CommentDeleteService;
//import com.aia.it.comment.service.CommentEditService;
//import com.aia.it.comment.service.CommentListService;
//import com.aia.it.comment.service.CommentService;
//
//@RestController
//@RequestMapping("/comment/comment/*")
//public class CommentRestController {
//
//	@Autowired
//	CommentService cService;
//
//	@Autowired
//	BoardListService bService;
//
//	@Autowired
//	CommentDeleteService cDelService;
//
//	@Autowired
//	CommentEditService cEditService;
//	
//	@Autowired
//	CommentListService listService;
//
//	// 댓글 삭제
//	@DeleteMapping(value="/{cidx}")
//	public String deleteComment(@PathVariable int cidx) {
//
//		return cDelService.commentDelete(cidx);
//
//	}
//	
//	//댓글 리스트
//	
//	
//	
//	// 댓글 작성
//	@PostMapping(value="/")
//	public int insertComment(@RequestBody Comment comment) {
//
//		return cService.commentWrite(comment);
//	}
//	
//	// 댓글 수정
//	@RequestMapping(value="/commentEdit", method = RequestMethod.PUT)
//	public int editComment(@RequestBody Comment comment) {
//		
//		System.out.println("수정 댓글 받은 데이터 ======>" + comment);
//		return cEditService.commentEdit(comment);
//	}
//	
//	
//	
//	
//	
//	
//
////	@RequestMapping(method = RequestMethod.GET)
////	public String getCommentForm(HttpServletResponse response, HttpServletRequest request, Model model) {
////
////		model.addAttribute("listView", bService.getView(request, response));
////
////		return "comment/commentForm";
////
////	}
//
//	
////	  @RequestMapping(method = RequestMethod.POST) public String getComment(Comment
////	  comment, HttpServletRequest request, Model model ) {
////	  System.out.println("controller: "+comment);
////	  
////	  model.addAttribute("result", cService.commentWrite(comment));
////	  
////	  return "comment/comment";
////	  
////	  
////	  }
//	 
//
//}
