package com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.model.CheckInOutVo;
import com.model.CustomerVo;
import com.model.ReservationCusVo;
import com.model.ReservationMapVo;
import com.model.Tbl_hotel_guest_user_infoVo;
import com.model.Tbl_hotel_room_infoVo;
import com.privateMapper.IRsvMapper;
import com.publicMapper.IHrmMapper;
import com.util.Constant;

import lombok.extern.java.Log;

@Log
@Service
@Transactional
public class HrmService {
	/* 
	 * 171011 create = limitationOne
	 */
	
	@Autowired
	private IHrmMapper hrmMapper;
	
	@Autowired
	private IRsvMapper reservMapper;
	
	public List<ReservationMapVo> hrmList(int hotelSeq) throws Exception {
		// TODO 객실현황 페이지
		List<ReservationMapVo> mapVo = new ArrayList<ReservationMapVo>(); 
		
		List<Tbl_hotel_room_infoVo> roomList = hrmMapper.hrmList(hotelSeq);
		List<ReservationCusVo> reservList = reservMapper.hrmList(hotelSeq);
		// 변경필요
		List<Tbl_hotel_guest_user_infoVo> custList = hrmMapper.custList(hotelSeq);
		
		for(int i=0; i < roomList.size() ; ++i) {
			mapVo.add(new ReservationMapVo(null, roomList.get(i), null));
		}
		
		for(ReservationMapVo vo : mapVo) {
			for(ReservationCusVo reserv : reservList) {
				// 예약정보에 객실정보 맵핑
				if(vo.getRoomVo().getNo() == reserv.getHrm_seq()) {
					if(vo.getReservationVo() == null 
							|| Constant.State.CHECK_IN.equals(vo.getReservationVo().getState()) 
							|| vo.getReservationVo().getFirst_date().compareTo(reserv.getFirst_date()) > 0) {
						vo.setReservationVo(reserv);
						break;
					}
				}
			}
		}
		
		for(ReservationMapVo vo : mapVo) {
			for(Tbl_hotel_guest_user_infoVo guestVo : custList) {
				// 투숙객정보 맵핑
				if(vo.getReservationVo() != null && vo.getReservationVo().getCust_seq() == guestVo.getGuest_no()) {
					vo.setGuestVo(guestVo);
				}
			}
		}
		
		log.info(" - mapVo : " + mapVo);
		return mapVo;
	}
	
	public List<ReservationCusVo> hrmSearchList(int hotelSeq, String name) throws Exception {
		// TODO 객실현황 페이지
		if(name != null && name.length() > 0) name = "%" + name + "%";
		return hrmMapper.hrmSearchList(new CustomerVo(hotelSeq, 0, name, null, null, null, null, null, null));
	}
	
	public List<Tbl_hotel_room_infoVo> hrmInfoList(int hotelSeq, String hrmKinds, String personnel)  throws Exception {
		// TODO 객실정보 페이지
		Tbl_hotel_room_infoVo hrmVo = new Tbl_hotel_room_infoVo(hotelSeq, 0, null, null, null, personnel, null, hrmKinds, null, null, null, null);
		
		if(personnel != null) hrmVo.setRoom_people_rule(personnel);
		
		List<Tbl_hotel_room_infoVo> hrmVoList = hrmMapper.hrmInfoList(hrmVo);
		
//		for(Tbl_hotel_room_infoVo vo : hrmVoList) {
//			for(Tbl_hotel_room_imgVo imgVo : vo.getHrmImgList()) {
//				if(imgVo.getPath() != null) imgVo.setPath(imgVo.getPath().replace(Constant.Path.IMG_REPLACE_PATH, ""));
//			}
//		}
		
		return hrmVoList;
	}
	
	public boolean checkHotelInfo(int hotelSeq) throws Exception {
		// TODO 호텔 정보 입력 여부를 확인하기 위한 용도
		int count = hrmMapper.checkHotelInfo(hotelSeq);
		log.info(" - count : " + count);
		if(count == 0) return true;
		else return false;
	}
	
	public List<Tbl_hotel_room_infoVo> hrmInfo(int hotelSeq, int hrmSeq) throws Exception {
		// TODO 객실정보 상세정보 페이지
		return hrmMapper.hrmInfo(new Tbl_hotel_room_infoVo(hotelSeq, hrmSeq, null, null, null, null, null, null, null, null, null, null));
	}
	
	@Transactional
	public boolean checkInOut(int hotelSeq, CheckInOutVo checkInoutVo) throws Exception{
		// TODO 체크인/아웃
		checkInoutVo.setHotel_seq(hotelSeq);
		int check = reservMapper.checkInOut(checkInoutVo);
		
		if(check == 0) return false;
		else return true;
	}
}