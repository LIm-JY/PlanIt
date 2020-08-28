package com.aia.it.member.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.aia.it.member.dao.MemberDaoInterface;
import com.aia.it.member.model.Member;
import com.aia.it.member.model.MemberEditRequest;

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
			
			//이전 페이지 삭제 
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

