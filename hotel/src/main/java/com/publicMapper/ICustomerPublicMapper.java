package com.publicMapper;

import java.util.List;

import com.model.CustomerSearchVo;
import com.model.CustomerVo;
import com.model.ReservationCusVo;
import com.model.ReservationMapVo;
import com.model.ReservationSearchVo;
import com.model.Tbl_hotel_guest_user_infoVo;
import com.model.Tbl_hotel_room_infoVo;

public interface ICustomerPublicMapper {
	/* 
	 * 171010 create = limitationOne
	 */
	public List<Tbl_hotel_guest_user_infoVo> custList(CustomerSearchVo customerSearchVo) throws Exception;
	public List<CustomerVo> searchCustList(CustomerSearchVo customerSearchVo) throws Exception;
	public void cmCreate(Tbl_hotel_guest_user_infoVo customerVo) throws Exception;
	public Tbl_hotel_guest_user_infoVo getCustomer(int custSeq) throws Exception;
	public Tbl_hotel_room_infoVo getRoomInfo(int hrmSeq) throws Exception;
	public void cmUpdate(CustomerVo customerVo) throws Exception;
	public void cmDelete(int custSeq) throws Exception;
	
	public List<Tbl_hotel_guest_user_infoVo> pickdropGuestList(CustomerSearchVo csVo) throws Exception;
	public List<Tbl_hotel_guest_user_infoVo> searchCustomer(CustomerSearchVo csVo) throws Exception;
	public List<Tbl_hotel_guest_user_infoVo> reservation(ReservationSearchVo reservationSearchVo) throws Exception;
	public List<Tbl_hotel_room_infoVo> reservationHrmList(int hotelSeq) throws Exception;
	public ReservationMapVo reservationInfo(ReservationCusVo vo) throws Exception;
}