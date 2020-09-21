package com.aia.it.board.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.it.board.dao.BoardDaoInterface;
import com.aia.it.board.model.Board;

@Service
public class BoardDeleteService {
	
   private BoardDaoInterface dao;
   
   @Autowired
   private SqlSessionTemplate sessionTemplate;
   
   
   public String boardDelete(int bidx, HttpServletRequest request) {
      
      dao = sessionTemplate.getMapper(BoardDaoInterface.class);
      int result = 0;
      
      String msg=null;
      
      Board board = dao.selectByBidx(bidx);
      
      result = dao.boardDelete(board);
      
      //게시글 삭제시 파일도 삭제
      String photo1 = board.getBphoto1();
      String photo2 = board.getBphoto2();
      
      try {
		if(photo1 != null && photo1.length()>0 && !photo1.equals("default.png")) {
		     // 서버 내부의 경로
		     String uri = request.getSession().getServletContext().getInitParameter("boardUploadPath");

		     // 시스템의 실제(절대) 경로
		     String realPath = request.getSession().getServletContext().getRealPath(uri);
		     
		     // 이전 페이지를 지운다.
		     // 이전 파일의 File 객체
		     File oldFile = new File(realPath, board.getBphoto1());

		     // 파일이 존재하면
		     if (oldFile.exists()) {
		        // 파일을 삭제
		        oldFile.delete();
		     }
		     
		  }
		  
		  if(photo2 != null && photo2.length()>0 && !photo2.equals("default.png")) {
		     // 서버 내부의 경로
		     String uri = request.getSession().getServletContext().getInitParameter("boardUploadPath");

		     // 시스템의 실제(절대) 경로
		     String realPath = request.getSession().getServletContext().getRealPath(uri);
		     
		     // 이전 페이지를 지운다.
		     // 이전 파일의 File 객체
		     File oldFile2 = new File(realPath, board.getBphoto2());

		     // 파일이 존재하면
		     if (oldFile2.exists()) {
		        // 파일을 삭제
		        oldFile2.delete();
		     }
		     
		  }
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      
      msg = result > 0 ? "정상적으로 삭제되었습니다." : "요청하신 게시물이 존재하지 않습니다.";
      
      
      return msg;
   }

}