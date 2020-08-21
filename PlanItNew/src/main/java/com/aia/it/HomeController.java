package com.aia.it;


import java.util.Locale;
import java.util.logging.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
//
//	@RequestMapping(value = "/home")
//	    public String kakaoLogin() {
//	        
//	        return "home";
//	        
//	}
//	
//}
//	@RequestMapping("/home")
//	public String home() {
//		String str = null;
//		str.toString();
//
//		return "home";
//	}
	@RequestMapping("/home")
	public String home(Locale locale, Model model) {
		return "home"; 
	}
	
	@ExceptionHandler(NullPointerException.class)
	public String handleNullPointerException(NullPointerException e) {

		e.printStackTrace();

		return "error/nullPointer";

	}
}
