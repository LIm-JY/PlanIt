package com.aia.it.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.member.dao.MemberDaoInterface;
import com.aia.it.member.model.Member;

@Service
public class MemberDeleteService {
	
	private MemberDaoInterface dao; 
	
	@Autowired
	private SqlSessionTemplate template;

	
	public String memberDelete(int uidx, HttpServletRequest request) {
		
		dao = template.getMapper(MemberDaoInterface.class); 
		
		int result = 0; 
		String msg = null; 
		
		Member member = dao.selectByUidx(uidx); 
		
		result = dao.memberDisabled(member); 
		
		msg = result > 0 ? "이용해주셔서 감사합니다." : "관리자에게 문의하여 주십시오. (관리자: 임재영)" 	;
		
		return msg; 
		
		
	}
	
}
