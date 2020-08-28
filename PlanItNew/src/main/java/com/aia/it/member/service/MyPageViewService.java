package com.aia.it.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.aia.it.member.dao.MemberDaoInterface;
import com.aia.it.member.model.LoginInfo;
import com.aia.it.member.model.Member;

@Service
public class MyPageViewService {

	MemberDaoInterface dao;

	@Autowired
	SqlSessionTemplate template;
	
	
	public Member getMyInfo(int uidx) {
		
		dao =template.getMapper(MemberDaoInterface.class);
		
	
		Member myInfo= dao.selectByUidx(uidx); 
		
		return myInfo;
	}
	

	
	
	public Member getMyPageView(int uidx, HttpSession session, HttpServletRequest request) {

		dao = template.getMapper(MemberDaoInterface.class);
		Member member=null;
		// 세션을 가져온다.
		session = request.getSession(true);

		// Member member = (Member) HttpSession.getAttribute("loginInfo");
		LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");

		if (loginInfo != null) {
			// 세션이 있으면 세션에 있는 loginInfo의 uidx를 데려온다.
			loginInfo.getUidx();
			member = dao.selectByUidx(loginInfo.getUidx());
		} 

		
		System.out.println("내가멤버다!!!"+member);
		return member;

	}
}
