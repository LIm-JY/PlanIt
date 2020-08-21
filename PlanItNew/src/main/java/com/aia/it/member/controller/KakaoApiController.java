package com.aia.it.member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class KakaoApiController {

	// 참고
	// 승연 git
	private final static String KKO_CID = "36d2bcd100f7b96e12d7e3b37ca39aa9";

	private final static String KKO_RE_URI = "http://localhost:8080/it/kakaoLogin";

	public static String getAuthorizationUrl(HttpSession session) {
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + KKO_CID + "&redirect_uri="
				+ KKO_RE_URI + "&response_type=code";

		return kakaoUrl;
	}

	// 참고힌 사이트
	// https://alpreah.tistory.com/122,
	// 승연 git:
	// https://github.com/NikkieS/w1f1/blob/kim/w1f1_login_kim/src/main/java/w1f1/ksy/login/controller/KakaoController.java
	public static JsonNode getAccessToken(String autorize_code) {

		final String REQUEST_URL = "https://kauth.kakao.com/oauth/token";

		final List<NameValuePair> POSTPARAMS = new ArrayList<NameValuePair>();

		// "authorization_code"로 고정
		POSTPARAMS.add(new BasicNameValuePair("grant_type", "authorization_code"));

		POSTPARAMS.add(new BasicNameValuePair("client_id", "36d2bcd100f7b96e12d7e3b37ca39aa9")); // 자신의 REST API 키

		// 아이피: 카카오에 등록된 사이트 도메인 http://127.0.0.1:56764
		// 최상위 경로 : pom.xml에 등록되어있는 최상위 경로
		// localhost 포트번호 8080으로 변경해서 사용하면 됨, AWS 배포시엔 AWS 도메인주소
		POSTPARAMS.add(new BasicNameValuePair("redirect_uri", "http://localhost:8080/it/kakaoLogin")); // 수정할 부분

		// 승연: 보안강화위해 추가 확인하는 코드
		POSTPARAMS.add(new BasicNameValuePair("client_secret", "8EFxOKmadqqhwq1xu0uVyxXzJsYNcxwV"));

		POSTPARAMS.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정 중 인증코드 받기 요청으로 얻은 code값

		final HttpClient client = HttpClientBuilder.create().build();

		final HttpPost post = new HttpPost(REQUEST_URL);

		JsonNode returnNode = null;

		try {

			post.setEntity(new UrlEncodedFormEntity(POSTPARAMS));

			final HttpResponse response = client.execute(post);

			// 오류 페이지 번호를 확인함
			final int RESPONSE_CODE = response.getStatusLine().getStatusCode();
			System.out.println(RESPONSE_CODE);

			ObjectMapper mapper = new ObjectMapper();

			returnNode = mapper.readTree(response.getEntity().getContent());

			System.out.println("발급된 회원코드 JSON 변환 확인 : " + returnNode);

		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();

		} catch (ClientProtocolException e) {

			e.printStackTrace();

		} catch (IOException e) {

			e.printStackTrace();

		} finally {

		}

		return returnNode;

	}

	public static JsonNode getKakaoUserInfo(JsonNode accessToken) {

								//사용자관리  https://developers.kakao.com/docs/latest/ko/reference/rest-api-reference 참고
		final String REQUEST_URL = "https://kapi.kakao.com/v2/user/me";
		final HttpClient CLIENT = HttpClientBuilder.create().build();
		final HttpPost POST = new HttpPost(REQUEST_URL);
		//테스트
		System.out.println("accessToken 정보: " + accessToken);
		
		POST.addHeader("Authorization", "Bearer " + accessToken);
	
		JsonNode returnNodeInfo = null;

		try {
			final HttpResponse response = CLIENT.execute(POST);
			// 오류 페이지 번호확인
			final int responseCode = response.getStatusLine().getStatusCode();

			System.out.println("Sending 'POST' request to URL 포스트  url 요청 : " + REQUEST_URL);
			System.out.println("Response Code : " + responseCode);

			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNodeInfo = mapper.readTree(response.getEntity().getContent());
			System.out.println("회원정보 JSON 변환 확인 : " + returnNodeInfo);

		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return returnNodeInfo;
	}
}
