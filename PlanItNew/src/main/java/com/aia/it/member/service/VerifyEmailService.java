package com.aia.it.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.member.dao.MemberDaoInterface;
import com.aia.it.member.model.Member;

@Service("verifyService")
public class VerifyEmailService {
	
	@Autowired
	private MailSenderService mailService;

	@Autowired
	private SqlSessionTemplate template;
	
	private MemberDaoInterface dao;
	
	public String verify(String uid, String ucode) {
		
		dao = template.getMapper(MemberDaoInterface.class);
		
		int rCnt = dao.verify(uid, ucode);
		
		return rCnt>0?"Success":"Fail";
	}

	public int reMailSend(String uid) {
				
		dao = template.getMapper(MemberDaoInterface.class);
		
		System.out.println("email : " + uid);
		
		Member member = dao.selectMemberById(uid);
		System.out.println("check : " + member);
		
		mailService.reSend(member.getUid(), member.getUcode());
		
		
		return 1;
	}
}
