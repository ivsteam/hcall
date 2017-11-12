package com.controller;

import java.util.List;
import java.util.Map;

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

import com.model.CustomerSearchVo;
import com.model.PeriodSearchVo;
import com.model.ReservationAddVo;
import com.model.ReservationCusVo;
import com.model.ReservationSearchVo;
import com.model.Tbl_hotel_guest_user_infoVo;
import com.model.Tbl_hotel_room_infoVo;
import com.service.RsvService;
import com.util.Constant;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("reservation")
public class ReservationController {
	/* 
	 * 171015 create = limitationOne
	 */
	
	@Autowired
	private RsvService service;
	
	// 로그인검사 - 차후 aop를 이용한 로그인 검증 구현시 삭제
	
	@RequestMapping(value="reservation", method=RequestMethod.GET)
	public Object reservation(Model model, HttpSession session, ReservationSearchVo reservationSearchVo) throws Exception {
		// TODO 예약문의 페이지
		log.info(" :::: reservation :::: ");
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		List<ReservationCusVo> reservationVo = service.reservation(hotelSeq, reservationSearchVo);
		
		model.addAttribute("rVo", reservationVo);
		
		return "reservation/reservation";
	}
	
//	@RequestMapping(value="searchReservation", method=RequestMethod.POST)
//	public Object searchReservation(Model model, HttpSession session, ReservationSearchVo reservationSearchVo) throws Exception {
//		// TODO 예약문의 페이지
//		if(reservationSearchVo == null || reservationSearchVo.getSearchValue() == null || reservationSearchVo.getSearchValue().length() <= 0) {
//			return "redirect:/reservation/reservation";
//		}
//		
//		log.info(" :::: searchReservation :::: " + reservationSearchVo);
//		if(session == null || session.getAttribute("member") == null) {
//			return "redirect:/member/login";
//		}
//		
//		// 세션 유지 정보가 변경될 경우 변경 필요
//		int hotelSeq = (int) session.getAttribute("member");
//		
//		List<ReservationCusVo> reservationVo = service.searchReservation(hotelSeq, reservationSearchVo);
//		
//		reservationSearchVo.setSearchValue(reservationSearchVo.getSearchValue().replaceAll("%", ""));
//		
//		model.addAttribute("rVo", reservationVo);
//		model.addAttribute("reservationVo", reservationSearchVo);
//		
//		return "reservation/reservation";
//	}
	
	@RequestMapping(value="reservationInfo/{reservSeq}", method=RequestMethod.POST)
	public Object reservationInfo(HttpSession session, @PathVariable("reservSeq") int reservSeq) throws Exception {
		// TODO 예약문의 정보
		log.info(" :::: reservationInfo :::: " + reservSeq);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		ReservationCusVo reservationCusVo = service.reservationInfo(reservSeq);
		
		return new ResponseEntity<ReservationCusVo>(reservationCusVo, HttpStatus.OK);
	}
	
	@RequestMapping(value="updateReservationPage", method=RequestMethod.POST)
	public Object updateReservationPage(HttpSession session, @ModelAttribute("reservationVo") ReservationCusVo reservationCusVo) throws Exception {
		// TODO 예약문의 수정 페이지
		log.info(" :::: updateReservationPage :::: " + reservationCusVo);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		return "reservation/updateReservation";
	}
	
	@RequestMapping(value="updateReservation", method=RequestMethod.POST)
	public Object updateReservation(HttpSession session, @ModelAttribute("reservationVo") ReservationAddVo reservationCusVo) throws Exception {
		// TODO 예약문의 수정
		log.info(" :::: updateReservation :::: " + reservationCusVo);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		int check = service.reservationInfoUpdate(reservationCusVo);
		
		if(check < 1) return new ResponseEntity<String>(Constant.Reservation.HRM_RECOMMENDATION_FAIL, HttpStatus.OK);
		
		return new ResponseEntity<String>(Constant.Reservation.HRM_RECOMMENDATION_SUCCESS, HttpStatus.OK);
	}
	
	@RequestMapping(value="reservationInfoUpdate", method=RequestMethod.POST)
	public Object reservationInfoUpdate(HttpSession session, @Valid ReservationAddVo reservationCusVo) throws Exception {
		// TODO 예약문의 정보
		log.info(" :::: reservationInfoUpdate :::: " + reservationCusVo);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		service.reservationInfoUpdate(reservationCusVo);
		
		return new ResponseEntity<String>(Constant.Reservation.RESERVATION_UPDATE_SUCCESS, HttpStatus.OK);
	}
	
	@RequestMapping(value="addReservation", method=RequestMethod.GET)
	public Object addReservationPage(Model model, HttpSession session) throws Exception{
		// TODO 예약문의 등록 페이지
		log.info(" :::: reservation add page :::: ");
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		List<Tbl_hotel_room_infoVo> hrmList = service.hrmList(hotelSeq);
		
		model.addAttribute("hrmList", hrmList);
		
		return "reservation/addReservation";
	}
	
	@RequestMapping(value="addReservation", method=RequestMethod.POST)
	public Object addReservation(HttpSession session, @Valid ReservationAddVo reservationHrmVo) throws Exception{
		// TODO 예약문의 등록
		log.info(" :::: add reservation :::: reservationHrmVo : " + reservationHrmVo);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		int check = service.addReservation(hotelSeq, reservationHrmVo);
		
//		log.info(" - check : " + check);
		if(check == 0) return new ResponseEntity<String>(Constant.Reservation.RESERVATION_FAIL, HttpStatus.OK);
		
		return new ResponseEntity<String>(Constant.Reservation.RESERVATION_SUCCESS, HttpStatus.OK);
	}
	
	@RequestMapping(value="searchCustomer", method=RequestMethod.POST)
	public Object searchCustomer(HttpSession session, @Valid CustomerSearchVo csVo) throws Exception {
		// TODO 고객 찾기
		log.info(" :::: search customer:::: csVo : " + csVo);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		List<Tbl_hotel_guest_user_infoVo> custList = service.searchCustomer(hotelSeq, csVo);
//		log.info(" - custList : " + custList);
		return new ResponseEntity<List<Tbl_hotel_guest_user_infoVo>>(custList, HttpStatus.OK);
	}
	
	@RequestMapping(value="reservationRegistration", method=RequestMethod.GET)
	public String reservationRegistration(Model model, HttpSession session) throws Exception {
		// TODO 예약등록 페이지 - 전달받을 데이터가 없는 경우
		log.info(" :::: reservationRegistration - get ::::");
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		return "reservation/reservationRegistration";
	}
	
	@RequestMapping(value="reservationRegistration", method=RequestMethod.POST)
	public String reservationRegistration(@ModelAttribute("ReservationAddVo") ReservationAddVo reservationAddVo, HttpSession session) throws Exception {
		// TODO 예약등록 페이지 - 전달받을 데이터가 있는 경우
		log.info(" :::: reservationRegistration -post :::: reservationAddVo : " + reservationAddVo);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		return "reservation/reservationRegistration";
	}
	
	@RequestMapping(value="periodSearch", method=RequestMethod.POST)
	public Object periodSearch(HttpSession session, @Valid PeriodSearchVo periodSearchVo) throws Exception{
		// TODO 예약등록 - 예약가능 객실 검색
		log.info(" :::: periodSearch -post :::: periodSearchVo : " + periodSearchVo);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		Map<String, List> map = service.periodSearch(hotelSeq, periodSearchVo);
//		log.info(" -- map : " + map);
		return new ResponseEntity<Map<String, List>>(map, HttpStatus.OK);
	}
	
	@RequestMapping(value="addReservationRegistration", method=RequestMethod.POST)
	public Object addReservationRegistration(HttpSession session, @Valid ReservationAddVo reservationAddVo) throws Exception {
		// TODO 예약등록
		log.info(" :::: addReservationRegistration :::: reservationDayVo : " + reservationAddVo);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		if(!service.addReservationRegistration(hotelSeq, reservationAddVo)) {
			return new ResponseEntity<>(Constant.ReservationRegistration.ADD_FAIL, HttpStatus.OK);
		}
		return new ResponseEntity<>(Constant.ReservationRegistration.ADD_SUCCESS, HttpStatus.OK);
		
	}
}