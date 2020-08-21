package com.aia.it.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.aia.it.member.service.KakaoLoginService;
import com.aia.it.member.service.LoginService;
import com.fasterxml.jackson.databind.JsonNode;

// kakaoController 에서 생성된 코드와 토큰값을 통해 
// 카카오 로그인 정보를 JSON 형태로 리다이렉트 해주는 컨트롤러

@Controller
public class KakaoLoginController {

	@Autowired
	KakaoLoginService loginService;
	
	// 카카오 디벨로퍼스에서 미리 설정한 REST API의 리다이렉트 경로를 리턴하는 메서드
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public ModelAndView KakaoLoginForm(HttpSession session) {
		ModelAndView mav = new ModelAndView(); 

		String kakaoUrl = KakaoApiController.getAuthorizationUrl(session);
		mav.addObject("kakao_url", kakaoUrl);
		System.out.println("KakaoLoginController.kakaoLoginForm " + kakaoUrl);
		return mav;
	}
	
//	@RequestMapping(method=RequestMethod.GET)
//	public String kakaoLoginForm() {
//		return "member/kakaoInfo";
//	}

	// 리다이렉트로부터 토큰값을 받아 카카오 로그인정보를 세션에 저장하고 리턴하는 메서드
	@RequestMapping(value = "/kakaoLogin ", produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		// kakaoController로 부터 코드를 통해 발급받은 토큰값을 Json 형태로 저장
		JsonNode node = KakaoApiController.getAccessToken(code);
		
		// 발급 받은 토큰을 Json 형태로 저장
		JsonNode accessToken = node.get("access_token");

		// 엑세스 토큰을 통해 로그인 한 사용자의 정보를 Json형태로 저장
		JsonNode userInfo = KakaoApiController.getKakaoUserInfo(accessToken);

		System.out.println(userInfo);

		// json 형태로 저장된 사용자 정보를 추출하여 저장하는 과정
		String id = userInfo.path("id").asText();                              
		String nickname = null;
//		String uid = null;
		String profile_image = null;
		
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");

		if (properties.isMissingNode() && kakao_account.isMissingNode()) {

		} else {
			nickname = properties.path("nickname").asText();
			profile_image = properties.path("profile_image").asText();
//			uid = kakao_account.path("uid").asText();
		}
//		System.out.println("카카오 id : " + id);
//		System.out.println("카카오 닉네임 : " + nickname);
//		System.out.println("사진 경로: " + profile_image);
		// 추출한 사용자 정보를 세션에 저장
		session.setAttribute("uid", id);
		session.setAttribute("uname", nickname);
		session.setAttribute("photo", profile_image);
//		session.setAttribute("uid", uid);

		// 새로운 페이지로 리턴
		return "member/kakaoInfo";
	}

}

//import java.io.IOException;
//
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//@Controller
//@RequestMapping("login/kakao")
//public class KakaoLoginController {
//	
//	private KakaoApiController kakao_restapi=new KakaoApiController();
//	 
//	 @RequestMapping(value="/oauth",method= RequestMethod.GET)
//	 public String kakaoConnect() {
//
//	  StringBuffer url = new StringBuffer();
//	  url.append("https://kauth.kakao.com/oauth/authorize?");
//	  url.append("client_id=" + "자기의 client id를 넣어줍니다");
//	  url.append("&redirect_uri=http://localhost:8080/mytest04/kakao/callback");
//	  url.append("&response_type=code");
//
//	  return "redirect:" + url.toString();
//	 }
//	 
//	 @RequestMapping(value="/callback",produces="application/json",method= {RequestMethod.GET, RequestMethod.POST})
//	 public String kakaoLogin(@RequestParam("code")String code,RedirectAttributes ra,HttpSession session,HttpServletResponse response )throws IOException {
//	  
//	  
//	  System.out.println("kakao code:"+code); 
//
//	  return "home";
//	 }
//
//	}