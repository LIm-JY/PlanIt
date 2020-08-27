package com.aia.it.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aia.it.admin.service.AdminService;
import com.aia.it.member.controller.LoginController;
import com.aia.it.member.model.Member;

@Controller
@RequestMapping("/admin/admin_member_forced_eviction_view")
public class AdminDeleteController {
	
	@Autowired // 서비스를 호출하기 위해서 의존성을 주입
	AdminService adminservice;

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class); // 로깅을 위한 변수

	// 메뉴 페이지에서 관리자 로그인 버튼을 클릭하면 맵핑되는 메소드
	// 관리자 로그인 페이지로 이동시킨다.
	
	


	// 관리자로 로그인 후에 회원을 강제 탈퇴시키는 페이지로 연결시키는 메소드
	@RequestMapping(method = RequestMethod.GET)
	public String admin_member_forced_evction_view() {

		return "admin/admin_member_forced_eviction_view";
	}

	// 관리자로 로그인 후에 강제 탈퇴시킬 회원의 아이디를 입력후 강제탈퇴 버튼을 누르면 연결되는 메소드
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView admin_member_forced_eviction(String uid) throws Exception {

		// 유저의 아이디를 삭제 (강제탈퇴) 시키기위해서 dto에 담는다.
		Member member = new Member();
		member.setUid(uid);

		// 회원탈퇴 체크를 하기위한 메소드, 탈퇴 시키려는 회원의 아이디가 있는지 검사한후에 result 변수에 저장한다.
		adminservice.admin_member_forced_evictionCheck(member);

		ModelAndView mav = new ModelAndView();

		if (member.getUid() != null) { // 회원 강제탈퇴가 성공했을시 출력되는 뷰

			mav.setViewName("home");

			mav.addObject("message", "회원이 정상적으로 강제탈퇴 처리 되었습니다.");

		} else {

			mav.setViewName("admin/admin_member_forced_eviction_view");

			mav.addObject("message", "회원 목록에 없는 회원입니다. 다시 확인해주세요.");
		}

		return mav;

	}
	
	

}
