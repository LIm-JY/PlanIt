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
import com.aia.it.daily.model.DailyRegRequest;

@Service
public class DailyRegService {
	
private DailyDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public int dailyReg(DailyRegRequest regRequest, HttpServletRequest request) {
		dao = sessionTemplate.getMapper(DailyDaoInterface.class);
		
		int result = 0;
		System.out.println(regRequest.getDphoto());
		Daily daily = regRequest.toDaily();

		try {

			MultipartFile file = regRequest.getDphoto();

			System.out.println(regRequest);

			// 사진이 있다면 사진 파일을 물리적으로 저장하고, 없다면 기본 이미지 파일의 경로를 저장한다.
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

			} else {
				daily.setDphoto("defalult.png");
			}

			System.out.println("데일리1"+daily);

			
			result = dao.insertDaily(daily);
			
			System.out.println("데일리2"+daily);

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
