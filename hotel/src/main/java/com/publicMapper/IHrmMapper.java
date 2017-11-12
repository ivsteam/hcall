package com.publicMapper;

import java.util.List;

import com.model.CustomerVo;
import com.model.HotelVo;
import com.model.ReservationCusVo;
import com.model.Tbl_hotel_guest_user_infoVo;
import com.model.Tbl_hotel_room_infoVo;

public interface IHrmMapper {
	/* 
	 * 171011 create = limitationOne
	 */
	public List<Tbl_hotel_room_infoVo> hrmList(int hotelSeq) throws Exception;
	public List<Tbl_hotel_guest_user_infoVo> custList(int hotelSeq) throws Exception;
	public List<ReservationCusVo> hrmSearchList(CustomerVo customerVo) throws Exception;
	public List<Tbl_hotel_room_infoVo> hrmInfoList(Tbl_hotel_room_infoVo hrmVo) throws Exception ;
	public int checkHotelInfo(int hotelSeq) throws Exception;
	public HotelVo hotelInfo(int hotelSeq) throws Exception;
	public List<Tbl_hotel_room_infoVo> hrmInfo(Tbl_hotel_room_infoVo hrmVo) throws Exception;
	public List<Tbl_hotel_room_infoVo> periodSearchHrmList(int hotelSeq) throws Exception;
	public List<Tbl_hotel_room_infoVo> hrmListReser(int hotelSeq) throws Exception;
}