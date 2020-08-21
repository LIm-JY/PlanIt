package com.aia.it.comment.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.comment.dao.CommentDaoInterface;
import com.aia.it.comment.model.Comment;

@Service
public class CommentService {
	
	private CommentDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public int commentWrite(Comment comment, HttpServletRequest request) {
		
		dao = sessionTemplate.getMapper(CommentDaoInterface.class);
		
		int result = 0;
		
		result = dao.insertComment(comment);
		
		return result;
	}


	
}
