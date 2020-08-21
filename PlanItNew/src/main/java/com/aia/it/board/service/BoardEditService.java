package com.aia.it.board.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.aia.it.board.dao.BoardDaoInterface;
import com.aia.it.board.model.Board;
import com.aia.it.board.model.BoardEditRequest;

@Service
public class BoardEditService {
	
	private BoardDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public Board getBoard(int bidx) {

		dao=sessionTemplate.getMapper(BoardDaoInterface.class);
		
		Board board = null;
		
		board = dao.selectByBidx(bidx);
		
		return board;
	}
	
	public int boardEdit(BoardEditRequest editRequest, HttpServletRequest request) {
		
		dao = sessionTemplate.getMapper(BoardDaoInterface.class);

		int result = 0;
		System.out.println("수정전%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%result!"+result);

		// MemberEditRequest -> Member : 이전 파일을 photo에 저장하고 시작
		Board board = editRequest.toBoard();
		System.out.println("###########수@정@전!!"+board);
		System.out.println("입력 전 IDX ===> " + board.getBidx());

		MultipartFile file1 = editRequest.getBphoto1();
		MultipartFile file2 = editRequest.getBphoto2();
		
		try {


			// 1. 파일의 물리적인 저장 -> Member 객체의 photo 변수 데이터 설정
			// 2. 이전 저장된  파일 삭제
			if (file1 != null && !file1.isEmpty() && file1.getSize() > 0 ) {
				// 서버 내부의 경로
				String uri = request.getSession().getServletContext().getInitParameter("boardUploadPath");

				// 시스템의 실제(절대) 경로
				String realPath = request.getSession().getServletContext().getRealPath(uri);

				// 저장할 이미지 파일의 새로운 이름 생성
				String newFileName = System.nanoTime() + "_" + file1.getOriginalFilename();

				// 서버의 저장소에 실제 저장
				File saveFile = new File(realPath, newFileName);
				file1.transferTo(saveFile);
				System.out.println("저장 완료 : " + newFileName);

				// 데이터베이스에 저장할 Member 객체의 데이터를 완성한다. : 사진 경로
				board.setBphoto1(newFileName);

				// 이전 페이지를 지운다.
				// 이전 파일의 File 객체
				File oldFile1 = new File(realPath, editRequest.getOldFile1());

				// 파일이 존재하면
				if (oldFile1.exists()) {
					// 파일을 삭제
					oldFile1.delete();
				}

			}
			if (file2 != null && !file2.isEmpty() && file2.getSize() > 0 ) {
				// 서버 내부의 경로
				String uri = request.getSession().getServletContext().getInitParameter("boardUploadPath");

				// 시스템의 실제(절대) 경로
				String realPath = request.getSession().getServletContext().getRealPath(uri);

				// 저장할 이미지 파일의 새로운 이름 생성
				String newFileName = System.nanoTime() + "_" + file2.getOriginalFilename();

				// 서버의 저장소에 실제 저장
				File saveFile = new File(realPath, newFileName);
				file2.transferTo(saveFile);
				System.out.println("저장 완료 : " + newFileName);

				// 데이터베이스에 저장할 Member 객체의 데이터를 완성한다. : 사진 경로
				board.setBphoto2(newFileName);

				// 이전 페이지를 지운다.
				// 이전 파일의 File 객체
				File oldFile2 = new File(realPath, editRequest.getOldFile2());

				// 파일이 존재하면
				if (oldFile2.exists()) {
					// 파일을 삭제
					oldFile2.delete();
				}

			}


		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			}

		result=dao.editBoard(board);
		System.out.println("수정후////////////////////////result!"+result);
		return result;
	}

}
