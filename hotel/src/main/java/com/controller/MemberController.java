package com.controller;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.HotelUserVo;
import com.publicMapper.IMemberMapper;
import com.service.MemberService;
import com.util.Constant;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/member")
public class MemberController {

	// service ==========================
	@Autowired
	private MemberService memberService;

	// mapper ==========================
	@Autowired
	private IMemberMapper memberMapper;
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		// TODO logout
		int th = (int) session.getAttribute("member");
		session.invalidate();
		return "redirect:/?th=" + th;
	}
	
	/****** login ******/
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void loginPage() {}
	
	@ResponseBody
	@RequestMapping(value="login", method=RequestMethod.POST)
	public Object login(HttpSession session,  HotelUserVo hotelMemberVo) throws Exception {
		// TODO login
		log.info(" :::: login Mem :::: " + hotelMemberVo);
		if(session == null || session.getAttribute("member") == null) {
			return new ResponseEntity<String>(Constant.Member.INVALID_HOTEL_SEQ, HttpStatus.OK);
		}
		hotelMemberVo = memberService.loginEmail(hotelMemberVo);
		
		if(hotelMemberVo == null || hotelMemberVo.getName().length() <= 0) {
			return new ResponseEntity<String>(Constant.Member.LOGIN_FAIL, HttpStatus.OK);
		}
		
		session.setAttribute("name", hotelMemberVo.getName());
		
		return new ResponseEntity<String>(Constant.Member.LOGIN_SUCCESS, HttpStatus.OK);
	}
	
	
//	/**
//	 * 로그인] login page 
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping("/loginFrm")
//	public String loginFrm( HttpServletRequest request, HttpServletResponse response) {
//		return "/member/loginFrm";
//	}
//	
//	/**
//	 * 회원가입 폼
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping("/joinFrm")
//	public String joinFrm( HttpServletRequest request, HttpServletResponse response) {
//		return "/member/join";
//	}
//
//	/**
//	 * id 중복
//	 * @param mvo
//	 * @param request
//	 * @return
//	 */
//	@ResponseBody
//	@RequestMapping("dupCheckID")
//	public Map<String, Object> dupCheckID(MemberVo mvo, HttpServletRequest request) {
//		System.out.println("mvo======"+ mvo);
//		Map<String, Object> jsonObject = new HashMap<String, Object>();
//		int retDupCnt = memberMapper.selectDupCheckID(mvo);
//		jsonObject.put("retDupCnt", retDupCnt);
//		return jsonObject;
//	}
//
//	/**
//	 * 회원가입]
//	 * @param mvo
//	 * @return
//	 */
//	@ResponseBody
//	@RequestMapping("join")
//	public Map<String, Object> join(MemberVo mvo) {
//		Map<String, Object> jsonObject = new HashMap<String, Object>();
//		
////		MemberVo retVo = memberMapper.selectOne(mvo);
////		System.out.println("retVo======="+ retVo);
//	
//		Boolean isBool = false;
//		if (memberservice.EmailChk(mvo)) {
//			jsonObject.put("success", true);
//			jsonObject.put("msg", Constant.Member.SUCCESS_LOGIN);
//			
//			isBool = memberservice.joinMember(mvo);
//			if (isBool) {
//				jsonObject.put("success", true);
//				jsonObject.put("msg", Constant.Member.SUCCESS_LOGIN);
//			} else {
//				jsonObject.put("success", false);
//				jsonObject.put("msg", Constant.Member.SUCCESS_FAIL);
//			}
//		
//		} else {
//			jsonObject.put("success", false);
//			jsonObject.put("msg", Constant.Member.DUP_EMAIL);
//		}
//		
//		
//		return jsonObject;
//	}
	
//	===================================================
//	/**
//	 * 회원가입후 로그인 안내페이지 
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping("/loginInfoFrm")
//	public String loginInfoFrm( HttpServletRequest request, HttpServletResponse response) {
//		return "/member/loginInfoFrm";
//	}
//	
//	
//	/**
//	 * 로그인] login page 
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping("/loginFrm")
//	public String loginFrm( HttpServletRequest request, HttpServletResponse response) {
//		return "/member/loginFrm";
//	}
//	
//	/**
//	 * logout]
//	 * @param session
//	 * @return
//	 */
//	@RequestMapping("logout")
//	public ModelAndView logout(HttpSession session) {
//		session.invalidate();
//		return new ModelAndView(new RedirectView("/member/loginFrm", true));
//	}
//	
//	/**
//	 * login] 
//	 * @param mvo
//	 * @param request
//	 * @return
//	 */
//	@ResponseBody
//	@RequestMapping("login")
//	public Map<String, Object> login(MemberVo mvo, HttpServletRequest request) {
//
//		Map<String, Object> jsonObject = new HashMap<String, Object>();
//		HttpSession session = request.getSession();
//
//		if (memberservice.login(mvo, session)) {
//			jsonObject.put("success", true);
//		} else {
//			jsonObject.put("success", false);
//			jsonObject.put("msg", Constant.Member.USER_PW_ERROR);
//		}
//		return jsonObject;
//	}
//	
//	
//	
//	/**
//	 * 회원가입 (간편회원가입)
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping("/joinFrm")
//	public String joinFrm( HttpServletRequest request, HttpServletResponse response, HttpSession session) {
//		
//		return "/member/joinFrm";
//	}
//
//	/**
//	 * 회원가입 ( 기본 ) 
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping("/joinFrm2")
//	public String joinFrm2( HttpServletRequest request, HttpServletResponse response) {
//		return "/member/joinFrm2";
//	}
//	
//	
//	
//	
//	
//
//	
//	/**
//	 * 비밀번호 찾기
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping("/pwFindFrm")
//	public String pwFindFrm( HttpServletRequest request, HttpServletResponse response) {
//		return "/member/pwFindFrm";
//	}
//	
//	/**
//	 * 비밀번호재설정
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping("/pwreSetFrm")
//	public String pwreSetFrm( HttpServletRequest request, HttpServletResponse response) {
//		return "/member/pwreSetFrm";
//	}
//
//	
//	/**
//	 * 개인정보수정 
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping("/myPageFrm")
//	public String myPageFrm( HttpServletRequest request, HttpServletResponse response) {
//		return "/member/myPage";
//	}
//
//	/**
//	 * 아이디 찾기
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping("/idFindFrm")
//	public String idFindFrm( HttpServletRequest request, HttpServletResponse response) {
//		return "/member/idFindFrm";
//	}

		
}
