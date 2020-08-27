package com.aia.it.admin.dao;

import com.aia.it.admin.model.Admin;
import com.aia.it.member.model.Member;

public interface AdminDao {
	
	
	 boolean loginCheck(Admin admin) throws Exception;    //로그인을 체크하는 메소드
	 
	 
	 void admin_member_forced_evictionCheck(Member member) throws Exception;    //회원 강제탈퇴 관련 메소드



}
