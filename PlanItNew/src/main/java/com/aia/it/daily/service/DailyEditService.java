package com.aia.it.daily.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.aia.it.daily.dao.DailyDaoInterface;
import com.aia.it.daily.model.Daily;
import com.aia.it.daily.model.DailyEditRequest;

@Service
public class DailyEditService {

private DailyDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
public int editDaily (DailyEditRequest editRequest, HttpServletRequest request) {
		
		dao = sessionTemplate.getMapper(DailyDaoInterface.class);
		
		int result = 0;

		Daily daily = editRequest.toDaily();
		
		MultipartFile file = editRequest.getDphoto();

		try {

			// 새로운 업데이트 파일이 있으면
			// 1. 파일의 물리적인 저장 -> Member 객체의 photo 변수 데이터 설정
			// 2. 이전 저장된  파일 삭제
			if (file != null && !file.isEmpty() && file.getSize() > 0) {
				// 서버 내부의 경로
				String uri = request.getSession().getServletContext().getInitParameter("memberUploadPath");

				// 시스템의 실제(절대) 경로
				String realPath = request.getSession().getServletContext().getRealPath(uri);

				// 저장할 이미지 파일의 새로운 이름 생성
				String newFileName = System.nanoTime() + "_" + file.getOriginalFilename();

				// 서버의 저장소에 실제 저장
				File saveFile = new File(realPath, newFileName);
				file.transferTo(saveFile);
				System.out.println("저장 완료 : " + newFileName);

				// 데이터베이스에 저장할 Member 객체의 데이터를 완성한다. : 사진 경로
				daily.setDphoto(newFileName);

				// 이전 페이지를 지운다.
				// 이전 파일의 File 객체
				File oldFile = new File(realPath, editRequest.getOldFile());

				// 파일이 존재하면
				if (oldFile.exists()) {
					// 파일을 삭제
					oldFile.delete();
				}

			}
		
			// 데이터베이스 : update
			result = dao.editDaily(daily);

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
		
		
		
		
		
		return result;
	}
	
	
	
	
	
}
