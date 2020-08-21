package com.aia.it.member.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogoutService {
	
	@Autowired
	KakaoLoginService loginService;
	
	public void logout(HttpSession session) {
		
		System.out.println("카카오 세션 만료 매핑 실행");
		session.removeAttribute("kakaoInfo");
		session.removeAttribute("uid");
		session.removeAttribute("uname");
//		session.removeAttribute("email");
		System.out.println("일반 세션 만료 매핑 실행 ");
		session.invalidate();

	}
	
}
