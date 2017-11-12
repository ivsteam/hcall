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

import com.model.CustomerSearchVo;
import com.model.CustomerVo;
import com.model.PickdropSearchVo;
import com.model.PickdropVo;
import com.model.ReservationCusVo;
import com.model.Tbl_hotel_guest_user_infoVo;
import com.service.CustomerService;
import com.util.Constant;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("customer")
public class CustomerController {
	/* 
	 * 171013 create = limitationOne
	 */
	
	@Autowired
	private CustomerService service;
	
	// 로그인검사 - 차후 aop를 이용한 로그인 검증 구현시 삭제
	
	@RequestMapping(value="cmMain", method=RequestMethod.GET)
	public Object customerManage(Model model, HttpSession session, CustomerSearchVo customerSearchVo) throws Exception {
		// TODO 고객관리 메인페이지
		log.info(" ::: customer Management main :::: customerSearchVo : " + customerSearchVo );
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		List<Tbl_hotel_guest_user_infoVo> custList = service.custList(hotelSeq, customerSearchVo);
		model.addAttribute("custList", custList);
		
		return "customer/cmMain";
	}
	
//	@RequestMapping(value="cmMain", method=RequestMethod.POST)
//	public Object customerManagePOST(Model model, HttpSession session, CustomerSearchVo customerSearchVo) throws Exception {
//		// TODO 고객관리 메인페이지
//		log.info(" ::: customer Management main ::::" );
//		if(customerSearchVo == null || customerSearchVo.getSearchValue() == null  || customerSearchVo.getSearchValue().length() <= 0 ) {
//			return "redirect:/customer/cmMain";
//		}
//		if(session == null || session.getAttribute("member") == null) {
//			return "redirect:/member/login";
//		}
//		
//		// 세션 유지 정보가 변경될 경우 변경 필요
//		int hotelSeq = (int) session.getAttribute("member");
//		
//		List<CustomerVo> custList = service.searchCustList(hotelSeq, customerSearchVo);
//		model.addAttribute("custList", custList);
//		
//		return "customer/cmMain";
//	}
	
	@RequestMapping(value="cmCreate", method=RequestMethod.GET)
	public Object cmCreatePage(Model model, HttpSession session) throws Exception {
		// TODO 고객관리 - 고객등록페이지
//		log.info(" ::: customer create page ::::" );
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		return "customer/cmCreate";
	}
	
	@RequestMapping(value="cmCreate", method=RequestMethod.POST)
	public Object cmCreate(HttpSession session, @Valid Tbl_hotel_guest_user_infoVo cust) throws Exception {
		// TODO 고객관리 - 고객등록
//		log.info(" ::: customer create  :::: " + cust);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		// 고객 정보 중복 체크 필요
		
		service.cmCreate(hotelSeq, cust);
		
		return new ResponseEntity<String>(Constant.Customer.SIGNUP_SUCCESS, HttpStatus.OK);
	}
	
//	@RequestMapping(value="cmUpdate/{custSeq}", method=RequestMethod.GET)
//	public Object cmUpdatePage(Model model, HttpSession session, @PathVariable("custSeq") int custSeq) throws Exception {
//		// TODO 고객관리 - 고객정보 수정 페이지
////		log.info(" ::: customer update :::: " + custSeq);
//		if(session == null || session.getAttribute("member") == null) {
//			return "redirect:/member/login";
//		}
//		
//		CustomerVo customerVo = service.getCustomer(custSeq);
//		model.addAttribute("custVo", customerVo);
//		
//		return "customer/cmUpdate";
//	}
	
	@RequestMapping(value="cmUpdate/{custSeq}", method=RequestMethod.POST)
	public Object cmUpdate(HttpSession session, @PathVariable("custSeq") int custSeq, CustomerVo customerVo) throws Exception {
		// TODO 고객관리 - 고객정보 수정
//		log.info(" ::: customer update :::: " + custSeq + " // " + customerVo);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		customerVo.setCust_seq(custSeq);
		customerVo.setHotel_seq(hotelSeq);
		
		service.cmUpdate(customerVo);
		
		return new ResponseEntity<String>(Constant.Customer.UPDATE_SUCCESS, HttpStatus.OK);
	}
	
	@RequestMapping(value="pickdrop", method=RequestMethod.GET)
	public Object pickdropPage(Model model, HttpSession session) throws Exception {
		// TODO 픽드랍서비스 페이지
		log.info(" ::: pickdropPage :::: ");
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		List<PickdropVo> list = service.pickDrop(hotelSeq);
		log.info(" - pickdropList : " + list);
		model.addAttribute("pickdropList", list);
		
		return "customer/pickdrop";
	}
	
	@RequestMapping(value="pickdrop", method=RequestMethod.POST)
	public Object pickdropSearch(Model model, HttpSession session, @ModelAttribute(name="pickVo") PickdropSearchVo pickdropSearchVo) throws Exception {
		// TODO 픽드랍서비스 검색
		log.info(" ::: pickdropSearch :::: ");
		if(pickdropSearchVo == null || pickdropSearchVo.getSearchValue() == null || pickdropSearchVo.getSearchValue().length() <= 0) {
			return "redirect:/customer/pickdrop";
		}
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		List<PickdropVo> list = service.pickDropSearch(hotelSeq, pickdropSearchVo);
		pickdropSearchVo.setSearchValue(pickdropSearchVo.getSearchValue().replaceAll("%", ""));
		model.addAttribute("pickdropList", list);
		
		return "customer/pickdrop";
	}
	
	@RequestMapping(value="reservationList", method=RequestMethod.POST)
	public Object reservationList(HttpSession session, @Valid CustomerSearchVo customerSearchVo) throws Exception {
		// TODO 픽드랍서비스 - 등록페이지 - 예약찾기
		log.info(" ::: reservationList :::: customerSearchVo : " + customerSearchVo);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		List<ReservationCusVo> list = service.reservationList(hotelSeq, customerSearchVo);
		
		return new ResponseEntity<List<ReservationCusVo>>(list, HttpStatus.OK);
	}
	
	@RequestMapping(value="addPickdrop", method=RequestMethod.GET)
	public Object addPickdropPage(HttpSession session) throws Exception {
		// TODO 픽드랍서비스 - 등록페이지
		log.info(" ::: add pickdrop Page :::: ");
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		return "customer/addPickdrop";
	}
	
	@RequestMapping(value="addPickdrop", method=RequestMethod.POST)
	public Object addPickdrop(HttpSession session, @Valid PickdropVo pickdropVo) throws Exception {
		// TODO 픽드랍서비스 - 등록
		log.info(" ::: add pickdrop :::: pickdropVo : " + pickdropVo);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		if(!service.addPickdrop(hotelSeq, pickdropVo)) {
			return new ResponseEntity<String>(Constant.Pickdrop.PICKDROP_FAIL, HttpStatus.OK);
		}
		return new ResponseEntity<String>(Constant.Pickdrop.PICKDROP_ADD_SUCCESS, HttpStatus.OK);
	}
	
	@RequestMapping(value="pickdropInfo/{pickdropSeq}", method=RequestMethod.POST)
	public Object pickdropInfo(HttpSession session, @PathVariable("pickdropSeq") int pickdropSeq) throws Exception {
		// TODO 픽드랍서비스 - 상세페이지
		log.info(" ::: pickdropInfo :::: pickdropSeq : " + pickdropSeq);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		PickdropVo pickdropVo = service.pickdropInfo(hotelSeq, pickdropSeq);
		log.info(" - pickdropVo : " + pickdropVo);
		return new ResponseEntity<PickdropVo>(pickdropVo, HttpStatus.OK);
	}
	
	@RequestMapping(value="pickdropDelete/{pickdropSeq}", method=RequestMethod.POST)
	public Object pickdropDelete(HttpSession session, @PathVariable("pickdropSeq") int pickdropSeq) throws Exception {
		// TODO 픽드랍서비스 - 삭제
		log.info(" ::: pickdropInfo :::: pickdropDelete : " + pickdropSeq);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		if(!service.pickdropDelete(hotelSeq, pickdropSeq)) {
			return new ResponseEntity<String>(Constant.Pickdrop.PICKDROP_DELETE_FAIL, HttpStatus.OK);
		}
		return new ResponseEntity<String>(Constant.Pickdrop.PICKDROP_DELETE_SUCCESS, HttpStatus.OK);
	}
	
	@RequestMapping(value="pickdropSuccess/{pickdropSeq}", method=RequestMethod.POST)
	public Object pickdropSuccess(HttpSession session, @PathVariable("pickdropSeq") int pickdropSeq) throws Exception {
		// TODO 픽드랍서비스 - 완료
		log.info(" ::: pickdropInfo :::: pickdropSuccess : " + pickdropSeq);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		// 세션 유지 정보가 변경될 경우 변경 필요
		int hotelSeq = (int) session.getAttribute("member");
		
		if(!service.pickdropSuccess(hotelSeq, pickdropSeq)) {
			return new ResponseEntity<String>(Constant.Pickdrop.PICKDROP_SUCCESS_FAIL, HttpStatus.OK);
		}
		return new ResponseEntity<String>(Constant.Pickdrop.PICKDROP_SUCCESS, HttpStatus.OK);
	}
}