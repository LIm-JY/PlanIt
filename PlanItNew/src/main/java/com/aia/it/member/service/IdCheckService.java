package com.aia.it.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.member.dao.MemberDaoInterface;

@Service
public class IdCheckService {
	
	private MemberDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate template; 
	
	public String checkId(String uid) {	
		dao = template.getMapper(MemberDaoInterface.class);
		
		String result = "N"; 
		
		System.out.println("1번 :"+result);
		
		int resultCnt = dao.selectById(uid); 
		if(resultCnt < 1 ) { 
			result = "Y"; 
			System.out.println("2번 :"+result);
		}
		return result; 
	}
	
	public String checkName(String uname) {
		
		dao = template.getMapper(MemberDaoInterface.class);
		
		String result = "N"; 
		
		System.out.println("1번 :"+result);
		
		int resultCnt = dao.selectByUname(uname); 
		if(resultCnt < 1 ) { 
			result = "Y"; 
			System.out.println("2번 :"+result);
		}
		return result; 
	}
	
	
	
}
