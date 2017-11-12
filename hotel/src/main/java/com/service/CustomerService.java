package com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.CustomerSearchVo;
import com.model.CustomerVo;
import com.model.PickdropSearchVo;
import com.model.PickdropVo;
import com.model.ReservationAddVo;
import com.model.ReservationCusVo;
import com.model.Tbl_hotel_guest_user_infoVo;
import com.privateMapper.IPickdropMapper;
import com.publicMapper.ICustomerPublicMapper;

import lombok.extern.java.Log;

@Log
@Service
public class CustomerService {
	/* 
	 * 171013 create = limitationOne
	 */
	
	@Autowired
	private ICustomerPublicMapper guestMapper;
	
	@Autowired
	private IPickdropMapper pickdropMapper;
	
	public List<Tbl_hotel_guest_user_infoVo> custList(int hotelSeq, CustomerSearchVo customerSearchVo) throws Exception {
		customerSearchVo.setHotel_no(hotelSeq);
		
		if(customerSearchVo.getSearchValue() != null && customerSearchVo.getSearchValue().length() >= 0) {
			customerSearchVo.setSearchValue("%" + customerSearchVo.getSearchValue() + "%");
		}
		return guestMapper.custList(customerSearchVo);
	}
	
//	public List<CustomerVo> searchCustList(int hotelSeq, CustomerSearchVo customerSearchVo) throws Exception {
//		customerSearchVo.setHotel_seq(hotelSeq);
//		customerSearchVo.setSearchValue("%" + customerSearchVo.getSearchValue() + "%");
//		return mapper.searchCustList(customerSearchVo);
//	}
	
	@Transactional
	public void cmCreate(int hotelSeq, Tbl_hotel_guest_user_infoVo cust) throws Exception {
		cust.setHotel_no(hotelSeq);
		guestMapper.cmCreate(cust);
	}
	
//	public CustomerVo getCustomer(int custSeq) throws Exception {
//		return guestMapper.getCustomer(custSeq);
//	}
	
	@Transactional
	public void cmUpdate(CustomerVo customerVo) throws Exception{
		guestMapper.cmUpdate(customerVo);
	}
	
	public List<PickdropVo> pickDrop(int hotelSeq) throws Exception {
		List<PickdropVo> pickdropList = pickdropMapper.pickDrop(hotelSeq);
		List<Tbl_hotel_guest_user_infoVo> guestList = guestMapper.custList(new CustomerSearchVo(hotelSeq, null, null));
		
		// 픽드랍요청에 투숙객정보 맵핑
		for(PickdropVo pVo : pickdropList){
			for(Tbl_hotel_guest_user_infoVo gVo : guestList) {
				if(pVo.getCust_seq() == gVo.getGuest_no()) {
					pVo.setGuestVo(gVo);
					break;
				}
			}
		}
		
		return pickdropList;
	}
	
	public List<PickdropVo> pickDropSearch(int hotelSeq, PickdropSearchVo pickdropSearchVo) throws Exception {
		pickdropSearchVo.setHotel_seq(hotelSeq);
		pickdropSearchVo.setSearchValue("%" + pickdropSearchVo.getSearchValue() + "%");
		pickdropSearchVo.setBooleanType();
		return pickdropMapper.pickDropSearch(pickdropSearchVo);
	}
	
	public List<ReservationCusVo> reservationList(int hotelSeq, CustomerSearchVo customerSearchVo) throws Exception {
		customerSearchVo.setHotel_no(hotelSeq);
		customerSearchVo.setSearchValue("%" + customerSearchVo.getSearchValue() + "%");
		
		List<ReservationCusVo> reservList = pickdropMapper.reservationList(customerSearchVo);
		List<Tbl_hotel_guest_user_infoVo> guestList = guestMapper.pickdropGuestList(customerSearchVo);
		
		// 예약자 정보 매핑
		for(ReservationCusVo reserVo : reservList) {
			for(Tbl_hotel_guest_user_infoVo guestVo : guestList) {
				if(reserVo.getCust_seq() == guestVo.getGuest_no()) {
					reserVo.setCust_name(guestVo.getGuest_nm());
					reserVo.setCust_email(guestVo.getGuest_email());
					reserVo.setCust_id(guestVo.getGuest_id());
					reserVo.setAdd_date(guestVo.getInsert_dt());
					break;
				}
			}
		}
		
		return reservList;
	}
	
	@Transactional
	public boolean addPickdrop(int hotelSeq, PickdropVo pickdropVo) throws Exception {
		pickdropVo.setHotel_seq(hotelSeq);
		
		// 좌표값 수정
		String location = pickdropVo.getStart_point_width();
		int idx = pickdropVo.getStart_point_width().indexOf(", ");
		
		pickdropVo.setStart_point_width(location.substring(1, idx));
		pickdropVo.setStart_point_height(location.substring(idx+1, location.length()-1));
		
		location = pickdropVo.getEnd_point_width();
		idx = pickdropVo.getEnd_point_width().indexOf(", ");
		
		pickdropVo.setEnd_point_width(location.substring(1, idx));
		pickdropVo.setEnd_point_height(location.substring(idx+1, location.length()-1));
//		log.info(" - $$$$ pickdropVo : " + pickdropVo);
		int check = pickdropMapper.addPickdrop(pickdropVo);
		
		if(check == 0) return false;
		else return true;
	}
	
	public PickdropVo pickdropInfo(int hotelSeq, int pickdropSeq) throws Exception {
		PickdropVo pVo = pickdropMapper.pickdropInfo(new PickdropVo(pickdropSeq, hotelSeq, 0, 0, 0, null, null, null, null, null, null, null, null, false, null, null, null));
		log.info(" - pVo : " + pVo);
		ReservationAddVo reVo = pickdropMapper.getReservation(pVo.getReserv_seq());
		log.info(" - reVo : " + reVo);
		Tbl_hotel_guest_user_infoVo cVo = guestMapper.getCustomer(pVo.getCust_seq());
		log.info(" - cVo : " + cVo);
//		Tbl_hotel_room_infoVo roomVo = guestMapper.getRoomInfo(reVo.getHrm_seq());
		
		if(cVo != null) pVo.setGuestVo(cVo);
		if(reVo != null) pVo.setReservationVo(reVo);
//		if(roomVo != null) pVo.setRoomVo(roomVo);
		
		return pVo;
	}
	
	@Transactional
	public boolean pickdropDelete(int hotelSeq, int pickdropSeq) throws Exception {
		int check = pickdropMapper.pickdropDelete(new PickdropVo(pickdropSeq, hotelSeq, 0, 0, 0, null, null, null, null, null, null, null, null, false, null, null, null));
		
		if(check == 0) return false;
		else return true;
	}
	
	@Transactional
	public boolean pickdropSuccess(int hotelSeq, int pickdropSeq) throws Exception {
		int check = pickdropMapper.pickdropSuccess(new PickdropVo(pickdropSeq, hotelSeq, 0, 0, 0, null, null, null, null, null, null, null, null, false, null, null, null));
		
		if(check == 0) return false;
		else return true;
	}
}