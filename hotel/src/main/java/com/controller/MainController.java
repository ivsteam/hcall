package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.http.Cookie; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
public class MainController {

	@RequestMapping("/")
	public String main(Model model, HttpServletRequest request, Integer th, HttpServletResponse response) {
		log.info(" - th : " + th);
		if(th != null) request.getSession().setAttribute("member", th);
		
		Cookie cookie = new Cookie("hcallHTno", th+"");
	    cookie.setMaxAge(60*60*24*365);            // 쿠키 유지 기간 - 1년
	    cookie.setPath("/");                               // 모든 경로에서 접근 가능하도록 
	    response.addCookie(cookie);                // 쿠키저장
	    
	    
		return "/member/login";
	}
	
	@RequestMapping("main")
	public String home(HttpSession session) {
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		return "main";
	}
	
}