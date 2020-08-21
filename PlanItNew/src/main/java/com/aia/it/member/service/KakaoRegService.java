package com.aia.it.member.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.member.dao.MemberDaoInterface;
import com.aia.it.member.model.Member;
import com.aia.it.member.model.MemberRegRequest;

@Service
public class KakaoRegService {

	private MemberDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int kMemberReg(
				MemberRegRequest regRequest, 
				HttpServletRequest request) {
		
		int result = 0;  
		
		dao = template.getMapper(MemberDaoInterface.class);
		
		Member member = regRequest.toMember(); 
	
		result = dao.insertKakaoMember(member); 
		
			//회원가입 성공 시
//		if(result != 0) {
//			regResult = "<script>" + "alert('가입이 완료되었습니다.');" + "location.href=\"member/loginForm\"</script>";
//		} else {
//		// 회원가입 실패 시
//			regResult = "<script>" + "alert('가입에 실패했습니다.');" + "history.go(-1);" + "</script>";
//		}
//		
		System.out.println("kakaoRegService 받아온 멤버 값 : " + member);
		
		return result; 
		
	}
	
	
	
}
