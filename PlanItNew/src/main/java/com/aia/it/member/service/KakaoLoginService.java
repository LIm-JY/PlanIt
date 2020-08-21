package com.aia.it.member.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.member.dao.MemberDaoInterface;
import com.aia.it.member.model.LoginInfo;
import com.aia.it.member.model.LoginRequest;
import com.aia.it.member.model.Member;

@Service
public class KakaoLoginService {

	private MemberDaoInterface dao;

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public int kLogin(LoginRequest loginRequest, HttpSession session, HttpServletResponse response) {

		dao = sessionTemplate.getMapper(MemberDaoInterface.class);
		
		int result = 0; 
		
		Member member = null;

		member = dao.selectMemberById(loginRequest.getUid());
		System.out.println("카카오 로그인 서비스 1111 ->>>" + dao.selectMemberById(loginRequest.getUid()));
		System.out.println("카카오 로그인 서비스 멤버 정보 : " + member);


		if (member != null) {
			LoginInfo loginInfo = new LoginInfo(member.getUid(), member.getUname(), member.getUphoto());

			session.setAttribute("loginInfo", loginInfo);
			
			result = 1;
//			// 쿠키설정은 나중에
//
//			// 로그인 성공 시
//			result = "<script>" + "alert('로그인되었습니다.');" + "location.href='" + loginRequest.getRedirectUri() + "'" + "</script>";
									
					
		} else {
			// DB에 추가정보가 저장되어있지 않을 시
			result = 0;
		}

		return result;
	}

}