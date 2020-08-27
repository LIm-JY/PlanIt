package com.aia.it.admin.service;

import javax.servlet.http.HttpSession;

import com.aia.it.admin.model.Admin;
import com.aia.it.member.model.Member;

public interface AdminService {

	
	
	     
	 
	    
	    void admin_member_forced_evictionCheck(Member member) throws Exception; //강제탈퇴 시킬때 해당 회원이 있는지 체크하는 메소드


		boolean loginCheck(Admin admin, HttpSession session)throws Exception; //관리자 로그인을 체크하는 메소드
}
