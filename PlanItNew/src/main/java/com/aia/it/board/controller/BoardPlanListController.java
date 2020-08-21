/*
 * package com.aia.it.board.controller;
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam;
 * 
 * import com.aia.it.board.service.BoardPlanListService;
 * 
 * @Controller public class BoardPlanListController {
 * 
 * @Autowired private BoardPlanListService boardPlanListService;
 * 
 * @RequestMapping("/board/boardWrite") public String getMemberList(
 * HttpServletRequest request, HttpServletResponse response, Model model,
 * 
 * @RequestParam("uidx") int uidx) {
 * 
 * model.addAttribute("boardPlanListService",
 * boardPlanListService.getBoardPlanList(request, response));
 * 
 * return "board/boardWriteForm"; }
 * 
 * }
 */