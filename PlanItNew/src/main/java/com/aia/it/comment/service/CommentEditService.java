package com.aia.it.comment.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.comment.dao.CommentDaoInterface;
import com.aia.it.comment.model.Comment;
import com.aia.it.comment.model.CommentEditRequest;

@Service
public class CommentEditService {
	
	private CommentDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public Comment getComment(int cidx) {

		dao=sessionTemplate.getMapper(CommentDaoInterface.class);
		
		Comment comment = null;
		
		comment = dao.selectByCidx(cidx);
		
		return comment;
	}
	
	public int commentEdit(Comment comment) {
		
		dao = sessionTemplate.getMapper(CommentDaoInterface.class);

		int result = 0;
		System.out.println("수정전%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%result!"+result);

		System.out.println("###########수@정@전!!"+comment);
		System.out.println("입력 전 IDX ===> " + comment.getCidx());
	

		result=dao.editComment(comment);
		
		System.out.println("수정후////////////////////////result!"+result);
		return result;
	}


}
