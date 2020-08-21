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
import com.aia.it.util.CookieBox;

@Service
public class LoginService {
	
//	@Autowired
//	MemberDao dao;
	
	private MemberDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate ;
	

	public String login(
			LoginRequest loginRequest, 
			HttpSession session, 
			HttpServletResponse response) {
		
		
		// inteface의 Mapper 객체 생성
		dao = sessionTemplate.getMapper(MemberDaoInterface.class);
		
		
		String loginResult = "";

		// 로그인 처리
		Member member = null;

		member = dao.selectByIdpw(loginRequest.getUid(), loginRequest.getUpw());

		System.out.println("LoginService Member(멤버정보) : " + member);

		if (member != null && member.getUverify() == 'Y') {

			LoginInfo loginInfo = new LoginInfo(member.getUidx(), member.getUid(), member.getUname(), member.getUphoto());

			session.setAttribute("loginInfo", loginInfo);

			// 쿠키 설정에 사용한 변수
			String cookieName = "uid";
			String cookiepath = session.getServletContext().getContextPath();

			// 회원 아이디 쿠키 설정
			if (loginRequest.getRemember() != null) {									
				response.addCookie(CookieBox.createCookie(cookieName, loginRequest.getUid(), cookiepath, 60 * 60 * 24 * 365));
			} else {
				response.addCookie(CookieBox.createCookie(cookieName, loginRequest.getUid(), cookiepath, 0));
			}

			// 로그인 이 필요했던 이전 페이지
			loginResult = "<script>" + "alert('hi~');" + "location.href='" + loginRequest.getRedirectUri() + "'" + "</script>";

		} else if(member != null && member.getUverify() == 'N') {

			loginResult = "<script>"; 
			loginResult += "	if(confirm('회원 가입 후 메일인증이 안되었습니다.\n인증메일을 다시 보내시겠습니까?')) {";
			loginResult += "		$.ajax(\'../member/verify/reMailSend?uid="+member.getUid()+"\',{})";
			loginResult += "	}";
			loginResult += "	location.href=\'" + loginRequest.getRedirectUri() + "\';"; 
			loginResult += "</script>";
			
		} else{
			loginResult = "<script>" + "alert('아이디 또는 비밀번호가 잘못되었습니다.');" + "history.go(-1);" + "</script>";
		}

		return loginResult;

	}

}
