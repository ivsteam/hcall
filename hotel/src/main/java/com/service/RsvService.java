package com.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.CustomerSearchVo;
import com.model.PeriodSearchVo;
import com.model.ReservationAddVo;
import com.model.ReservationCusVo;
import com.model.ReservationHrmVo;
import com.model.ReservationMapVo;
import com.model.ReservationSearchVo;
import com.model.Tbl_hotel_guest_user_infoVo;
import com.model.Tbl_hotel_room_infoVo;
import com.privateMapper.IRsvMapper;
import com.publicMapper.ICustomerPublicMapper;
import com.publicMapper.IHrmMapper;
import com.util.Constant;

import lombok.extern.java.Log;

@Log
@Service
public class RsvService {
	/* 
	 * 171015 create = limitationOne
	 */
	
	@Autowired
	private IRsvMapper mapper;
	
	@Autowired
	private IHrmMapper hrmMapper;
	
	@Autowired
	private ICustomerPublicMapper custMapper;
	
	public List<ReservationCusVo> reservation(int hotelSeq, ReservationSearchVo reservationSearchVo) throws Exception {
		
		reservationSearchVo.setHotel_seq(hotelSeq);
		if(reservationSearchVo.getSearchValue() != null && reservationSearchVo.getSearchValue().length() >= 0) {
			reservationSearchVo.setSearchValue("%" + reservationSearchVo.getSearchValue() + "%");
		}
		
		List<ReservationCusVo> reservationList = mapper.reservation(reservationSearchVo);
		List<Tbl_hotel_guest_user_infoVo> custList = custMapper.reservation(reservationSearchVo);
		List<Tbl_hotel_room_infoVo> hrmList = custMapper.reservationHrmList(hotelSeq);
		
		// 고객정보 맵핑
		for(ReservationCusVo reVo : reservationList) {
			for(Tbl_hotel_guest_user_infoVo guestVo : custList) {
				if( reVo.getCust_seq() == guestVo.getGuest_no() ) {
					reVo.setGuestVo(guestVo);
					break;
				}
			}
		}
		
		// 객실정보 맵핑
		for(ReservationCusVo reVo : reservationList) {
			for(Tbl_hotel_room_infoVo roomVo : hrmList){
				if(reVo.getHrm_seq() == roomVo.getNo()) {
					reVo.setHrm_name(roomVo.getRoom_name());
					reVo.setRoom_num(roomVo.getRoom_position());
					break;
				}
			}
		}
		return reservationList;
	}
	
	public List<ReservationCusVo> searchReservation(int hotelSeq, ReservationSearchVo reservationSearchVo) throws Exception {
		reservationSearchVo.setHotel_seq(hotelSeq);
		reservationSearchVo.setSearchValue("%" + reservationSearchVo.getSearchValue() + "%");
		return mapper.searchReservation(reservationSearchVo);
	}
	
	public ReservationCusVo reservationInfo(int reservSeq) throws Exception {
		ReservationCusVo vo = mapper.reservationInfo(reservSeq);
		ReservationMapVo mapVo = custMapper.reservationInfo(vo);
		
		vo.setGuestVo(mapVo.getGuestVo());
		vo.setRoomVo(mapVo.getRoomVo());
		
		return vo;
	}
	
	@Transactional
	public int reservationInfoUpdate(ReservationAddVo reservationCusVo) throws Exception {
		reservationCusVo.setState(Constant.State.RESERVATION_SUCCESS);
		return mapper.reservationInfoUpdate(reservationCusVo);
	}
	
	@Transactional
	public int addReservation(int hotelSeq, ReservationAddVo reservationHrmVo) throws Exception {
		reservationHrmVo.setHotel_seq(hotelSeq);
		return mapper.addReservation(reservationHrmVo);
	}
	
	public List<Tbl_hotel_guest_user_infoVo> searchCustomer(int hotelSeq, CustomerSearchVo csVo) throws Exception {
		csVo.setHotel_no(hotelSeq);
		csVo.setSearchValue("%" + csVo.getSearchValue() + "%");
		return custMapper.searchCustomer(csVo);
	}
	
	public Map<String, List> periodSearch(int hotelSeq, PeriodSearchVo periodSearchVo) throws Exception {
		HashMap<String, List> map = new HashMap<String, List>();
		
		List<Tbl_hotel_room_infoVo> roomList = new ArrayList<Tbl_hotel_room_infoVo>();
		
		ReservationHrmVo hrmVo = new ReservationHrmVo();
		hrmVo.setHotel_seq(hotelSeq);
		hrmVo.setState(Constant.State.RESERVATION_SUCCESS);
		hrmVo.setPersonnel_max(periodSearchVo.getPersonnel());
		
		hrmVo.setFirst_date(periodSearchVo.getFirst_date());
		hrmVo.setLast_date(periodSearchVo.getLast_date());
		
		List<ReservationAddVo> searchList = mapper.periodSearch(periodSearchVo);
		List<Tbl_hotel_room_infoVo> hrmList = hrmMapper.periodSearchHrmList(hotelSeq);
		
//		log.info(" - searchList : " + searchList);
//		log.info(" - hrmList : " + hrmList);
		
		for(Tbl_hotel_room_infoVo hrm : hrmList) {
			boolean addSwitch = true;
			
			for(ReservationAddVo reVo : searchList) {
				if(hrm.getNo() == reVo.getHrm_seq()) {
					addSwitch = false;
					break;
				}
			}
			
			if(addSwitch) roomList.add(hrm);
		}
		
		log.info(" - roomList : " + roomList);
		map.put("hrmList", roomList);
		
		return map;
	}
	
	@Transactional
	public boolean addReservationRegistration(int hotelSeq, ReservationAddVo reservationAddVo) throws Exception {
//		log.info(" - reservationDayVoList : " + reservationAddVo);
		
		reservationAddVo.setHotel_seq(hotelSeq);
		reservationAddVo.setState(Constant.State.RESERVATION_SUCCESS);
		
		int check = mapper.addReservationRegistration(reservationAddVo);
		
		if(check == 0)return false;
		return false;
	}
	
	
	public List<Tbl_hotel_room_infoVo> hrmList(int hotelSeq) throws Exception {
		return hrmMapper.hrmListReser(hotelSeq);
	}
}