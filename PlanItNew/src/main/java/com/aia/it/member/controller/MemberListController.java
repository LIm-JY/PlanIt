package com.aia.it.member.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aia.it.member.model.Member;
import com.aia.it.member.service.MemberListService;

@Controller
public class MemberListController {
	
	@Autowired
	MemberListService listService;
	
	
	//멤버리스트 가져오기
	@RequestMapping("/member/memberList")
	public String getMemberList(
			Model model, 
			HttpServletRequest request, 
			HttpServletResponse response) throws SQLException {
		
		model.addAttribute("listView", listService.getView(request, response));
		return "/member/memberList";
	}
	
	//제이슨 멤버리스트
	@RequestMapping("/member/memberList.json")
	@ResponseBody
	public List<Member> getMemberJson(){
		
		System.out.println("서비스에서 넘어오는거: " + listService.getMemberList());
		
		return listService.getMemberList();		
	}
	
}
 