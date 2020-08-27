package com.aia.it.admin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.admin.dao.AdminDao;
import com.aia.it.admin.model.Admin;
import com.aia.it.member.model.Member;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDao dao;
	

	@Override
	public boolean loginCheck(Admin admin, HttpSession session) throws Exception {
		boolean result = dao.loginCheck(admin);
        
        if(result) {    //로그인 성공
            
        	session.setAttribute("adminId", admin.getAdminId());
        	session.setAttribute("adminPw", admin.getAdminPw());
            
        }
        
        return result;
	}

	@Override
	public void admin_member_forced_evictionCheck(Member member) throws Exception {
		 dao.admin_member_forced_evictionCheck(member);
	        
    }

}
