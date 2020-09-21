/*
 * package com.aia.it.planner.controller;
 * 
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.RequestMapping;
 * 
 * import com.aia.it.planner.service.PlannerListService2;
 * 
 * @Controller
 * 
 * @RequestMapping("/planner/plannerList") public class PlannerListController2 {
 * 
 * @Autowired PlannerListService2 listService;
 * 
 * @GetMapping public String getPlannerListView2( Model model,
 * HttpServletRequest request, HttpServletResponse response, int uidx) {
 * 
 * model.addAttribute("listView", listService.getPlannerList(uidx, request,
 * response));
 * 
 * return "planner/plannerList"; }
 * 
 * 
 * 
 * 
 * }
 */