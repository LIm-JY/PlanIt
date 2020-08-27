package com.aia.it.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aia.it.admin.model.Admin;
import com.aia.it.member.model.Member;

@Repository
public class AdminDaoImpl implements AdminDao{
	
	@Autowired        //sql쿼리를 사용하기 위해서 의존성을 주입함
    SqlSessionTemplate sqlSession;
	
	
	
    
    
    //로그인 체크
    //id가 null이면 false를 리턴하고 값이 있으면 true를 리턴한다.
    @Override
    public boolean loginCheck(Admin admin) throws Exception{
        
        String name = sqlSession.selectOne("admin.loginCheck", admin);
        
        //조건식 ? true일때의 값 : false일때의 값
        return (name==null) ? false : true;
        
    }
 
    
    //회원 강제탈퇴 관련 메소드 구현
    @Override
    public void admin_member_forced_evictionCheck(Member member) throws Exception{
        
            sqlSession.delete("admin.admin_member_forced_evictionCheck", member);
 
    }
 

}
