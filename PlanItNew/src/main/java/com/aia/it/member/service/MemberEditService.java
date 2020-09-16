package com.aia.it.member.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.aia.it.member.dao.MemberDaoInterface;
import com.aia.it.member.model.LoginInfo;
import com.aia.it.member.model.LoginRequest;
import com.aia.it.member.model.Member;
import com.aia.it.member.model.MemberEditRequest;
import com.aia.it.util.CookieBox;

@Service
public class MemberEditService {
	
	private MemberDaoInterface dao; 
	
	@Autowired
	private SqlSessionTemplate template;
	
	public Member getMember(int uidx) {
		
		dao = template.getMapper(MemberDaoInterface.class);
		
		Member member = null;
		
		member = dao.selectByUidx(uidx);
		
		return member;
	}
	
//	public String editChk(
//			LoginRequest loginRequest, 
//			HttpSession session, 
//			HttpServletResponse response) {
//		
//		
//		// inteface의 Mapper 객체 생성
//		dao = template.getMapper(MemberDaoInterface.class);
//		
//		
//		String loginResult = "";
//
//		// 로그인 처리
//		Member member = null;
//
//		member = dao.selectByIdpw(loginRequest.getUid(), loginRequest.getUpw());
//
//		System.out.println("LoginService Member(멤버정보) : " + member);
//
//		if (member != null && member.getUverify() == 'Y') {
//
//			LoginInfo loginInfo = new LoginInfo(member.getUidx(), member.getUid(), member.getUname(), member.getUphoto());
//
//			session.setAttribute("loginInfo", loginInfo);
//
//			// 쿠키 설정에 사용한 변수
//			String cookieName = "uid";
//			String cookiepath = session.getServletContext().getContextPath();
//
//			// 회원 아이디 쿠키 설정
//			if (loginRequest.getRemember() != null) {									
//				response.addCookie(CookieBox.createCookie(cookieName, loginRequest.getUid(), cookiepath, 60 * 60 * 24 * 365));
//			} else {
//				response.addCookie(CookieBox.createCookie(cookieName, loginRequest.getUid(), cookiepath, 0));
//			}
//
//			// 로그인 이 필요했던 이전 페이지
//			loginResult = "<script>" + "location.href='" + loginRequest.getRedirectUri() + "'" + "</script>";
//
//		} else if(member != null && member.getUverify() == 'N') 
//
//
//		return loginResult;
//
//	}
//	
	
	
	
	
	public int memberEdit(int uidx, MemberEditRequest editRequest, HttpServletRequest request) {
		
		dao = template.getMapper(MemberDaoInterface.class); 		

		int result = 0; 
		
		Member member = editRequest.toMember(); 
		
		System.out.println("입력 전 idx ->" + member.getUidx());

		try {
		MultipartFile file = editRequest.getPhoto(); 
		System.out.println(editRequest);
		
		//사진 있을 때 물리적으로 저장, 없을 경우 기본이미지 파일의 경로를 저장
		if(file != null && !file.isEmpty() && file.getSize() > 0) {
			
			String uri = request.getSession().getServletContext().getInitParameter("memberUploadPath");
			String realPath = request.getSession().getServletContext().getRealPath(uri); 
			String newFileName = System.nanoTime() +  "_" + file.getOriginalFilename(); 
			
			File saveFile = new File(realPath, newFileName); 	
			file.transferTo(saveFile);
			System.out.println("저장완료: " + newFileName);
		
			member.setUphoto(newFileName); 
			
			//이전 파 삭제 
			File oldFile = new File(realPath, editRequest.getOldFile());
			
			if(oldFile.exists()) {
				oldFile.delete(); 
			}
			
			
			}
		}
	 catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
		}
		
		result = dao.editMember(member); 
		
		return result; 
	}

		
}

