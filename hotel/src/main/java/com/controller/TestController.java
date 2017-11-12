package com.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.NotifyVo;
import com.privateMapper.INotifyMapper;
import com.util.GoogleTranslate;


@Controller
@RequestMapping("/test")
public class TestController {

	// mapper ==========================
	@Autowired
	private INotifyMapper notifyMapper;
	private GoogleTranslate gt;
	@RequestMapping("/pdfviwer")
	public String QnaFrm( HttpServletRequest request, HttpServletResponse response, @RequestParam("tmp") String tmp) {
		
		String translate = "";
		try {
			System.out.println("=2========"+ URLEncoder.encode(tmp.trim(), "UTF-8"));
			System.out.println("=3========"+ URLDecoder.decode(tmp.trim(), "UTF-8"));
			translate = GoogleTranslate.translte(URLEncoder.encode(tmp.trim(), "UTF-8"), "ko", "en");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("tt===" + translate);
		
		
		return "/testFolder/pdfviwer";
	}
	
	
	@RequestMapping("/test")
	public String QnaFr2m( HttpServletRequest request, HttpServletResponse response) {
		return "/member/joinFrm2";
	}
	
	
	@ResponseBody
	@RequestMapping("/reqCall")
	public Map<String, Object> reqCall( HttpServletRequest request, HttpServletResponse response, NotifyVo vo) {
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		
		try {
			int trunVal = notifyMapper.updateNotify(vo);
			System.out.println("trunVal========"+ trunVal);
	
			int resultVal = notifyMapper.insertNotify(vo);
			System.out.println("resultVal ==" + resultVal );
			if( resultVal < 1){
				jsonObject.put("success", false);
			}else{
				jsonObject.put("success", true);
			}
		} catch (Exception e) {
			// TODO: handle exception
			jsonObject.put("success", false);
			e.printStackTrace();
		}
		
		return jsonObject;
	}
	
	
}
