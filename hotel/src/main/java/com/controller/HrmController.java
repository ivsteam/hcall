package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.CheckInOutVo;
import com.model.ReservationCusVo;
import com.model.ReservationMapVo;
import com.model.Tbl_hotel_room_infoVo;
import com.service.HrmService;
import com.util.Constant;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("hrm")
public class HrmController {
	/* 
	 * 171011 create = limitationOne
	 */
	
	@Autowired
	private HrmService service;

	// 로그인검사 - 차후 aop를 이용한 로그인 검증 구현시 삭제
	
	@RequestMapping(value="hrmList", method=RequestMethod.GET)
	public String hrmList(Model model, HttpSession session) throws Exception {
		// TODO 객실현황 - 객실 리스트
//		log.info(" :::: hotel room list :::: ");
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		List<ReservationMapVo> hrmList = service.hrmList(hotelSeq);
//		log.info(" - hrmList : " + hrmList);
		model.addAttribute("hrmList", hrmList);
		
		return "hrm/hrmList";
	}
	
	@RequestMapping(value="hrmList/{name}", method=RequestMethod.GET)
	public String hrmSearchList(Model model, HttpSession session, @ModelAttribute @PathVariable("searchName") String name)  throws Exception{
		// TODO 객실현황 - 객실 리스트
//		log.info(" :::: hotel room list search :::: " + name);
		if(name == null || name.length() <= 0) return "redirect:/hrm/hrmList";
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		List<ReservationCusVo> hrmList = service.hrmSearchList(hotelSeq, name);
//		log.info(" - hrmList : " + hrmList);
		model.addAttribute("hrmList", hrmList);
		
		return "hrm/hrmList";
	}
	
	@RequestMapping(value="hrmInfoList", method=RequestMethod.GET)
	public Object hrmInfoList(Model model, HttpSession session, String room_bed_type, String room_people_rule) throws Exception {
		// TODO 객실 정보 리스트
		log.info(" :::: hotel room infomation list :::: ");
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		List<Tbl_hotel_room_infoVo> hrmList = service.hrmInfoList(hotelSeq, room_bed_type, room_people_rule);
		log.info(" - hrmList : " + hrmList);
		if(room_people_rule != null) model.addAttribute("personnel", room_people_rule);
		model.addAttribute("hrmList", hrmList);
		
		return "hrm/hrmInfoList";
	}
	
	@RequestMapping(value="hrmInfo", method=RequestMethod.GET)
	public String hrmInfo(Model model , HttpSession session, @RequestParam("hrmSeq") int hrmSeq) throws Exception {
		// TODO 객실 상세정보 페이지
//		log.info(" :::: hrmInfo :::: - hrmSeq : " + hrmSeq);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		List<Tbl_hotel_room_infoVo> hVo;
		
		try {
			hVo = service.hrmInfo(hotelSeq, hrmSeq);
			
			model.addAttribute("hrm", hVo);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/hrm/hrmInfoList";
		}
		
		return "hrm/hrmInfo";
	}
	
	@RequestMapping(value="checkIn", method=RequestMethod.POST)
	public Object checkIn(HttpSession session, @Valid CheckInOutVo checkInoutVo) throws Exception{
		// TODO 체크인
		log.info(" :::: checkIn :::: - checkInoutVo : " + checkInoutVo);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		// 세션 유지 정보가 변경될 경우 변경 필요		
		int hotelSeq = (int) session.getAttribute("member");
		
		checkInoutVo.setCheck_in_out(Constant.HrmCheckMessage.CHECKIN);
		checkInoutVo.setState(Constant.State.CHECK_IN);
		
		if(!service.checkInOut(hotelSeq, checkInoutVo)) {
			return new ResponseEntity<String>(Constant.HrmCheckMessage.CHECK_IN_FAIL, HttpStatus.OK);
		}
		return new ResponseEntity<String>(Constant.HrmCheckMessage.CHECK_IN_SUCCESS, HttpStatus.OK);
	}
	
	@RequestMapping(value="checkOut", method=RequestMethod.POST)
	public Object checkOut(HttpSession session, @Valid CheckInOutVo checkInoutVo) throws Exception{
		// TODO 체크아웃
		log.info(" :::: checkOut :::: - checkInoutVo : " + checkInoutVo);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		// 세션 유지 정보가 변경될 경우 변경 필요		
		int hotelSeq = (int) session.getAttribute("member");
		
		checkInoutVo.setCheck_in_out(Constant.HrmCheckMessage.CHECKOUT);
		checkInoutVo.setState(Constant.State.RESERVATION_FINISH);
		
		if(!service.checkInOut(hotelSeq, checkInoutVo)) {
			return new ResponseEntity<String>(Constant.HrmCheckMessage.CHECK_OUT_FAIL, HttpStatus.OK);
		}
		return new ResponseEntity<String>(Constant.HrmCheckMessage.CHECK_OUT_SUCCESS, HttpStatus.OK);
	}
}