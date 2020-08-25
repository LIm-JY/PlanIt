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
   
   
   public String commentDelete(int cidx ) {
      
      dao = sessionTemplate.getMapper(CommentDaoInterface.class);
      int result = 0;
      
      String msg=null;
      
      Comment comment = dao.selectByCidx(cidx);
      
      result = dao.commentDelete(comment);
      
      
      msg = result > 0 ? "정상적으로 삭제되었습니다." : "요청하신 댓글이 존재하지 않습니다.";
      
      
      return msg;
   }

}