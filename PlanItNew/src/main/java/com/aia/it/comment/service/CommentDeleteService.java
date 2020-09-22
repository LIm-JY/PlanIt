package com.aia.it.comment.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.comment.dao.CommentDaoInterface;
import com.aia.it.comment.model.Comment;

@Service
public class CommentDeleteService {
	
   private CommentDaoInterface dao;
   
   @Autowired
   private SqlSessionTemplate sessionTemplate;
   
   
   public int commentDelete(int cidx ) {
      
      dao = sessionTemplate.getMapper(CommentDaoInterface.class);
      int result = 0;
      
      
      Comment comment = dao.selectByCidx(cidx);
      
      result = dao.commentDelete(comment);
      
      
      return result;
   }

}