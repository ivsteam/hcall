package com.privateMapper;

import java.util.List;

import com.model.CheckInOutVo;
import com.model.PeriodSearchVo;
import com.model.ReservationAddVo;
import com.model.ReservationCusVo;
import com.model.ReservationSearchVo;

public interface IRsvMapper {
	/* 
	 * 171015 create = limitationOne
	 */
	public List<ReservationCusVo> hrmList(int hotelSeq) throws Exception;
	public List<ReservationCusVo> reservation(ReservationSearchVo reservationSearchVo) throws Exception;
	public List<ReservationCusVo> searchReservation(ReservationSearchVo reservationSearchVo) throws Exception;
	public ReservationCusVo reservationInfo(int reservSeq) throws Exception;
	public int reservationInfoUpdate(ReservationAddVo reservationCusVo) throws Exception;
	public int addReservation(ReservationAddVo reservationHrmVo) throws Exception;
	public List<ReservationAddVo> periodSearch(PeriodSearchVo periodSearchVo) throws Exception;
	public int addReservationRegistration(ReservationAddVo reservationAddVo) throws Exception;
	public int checkInOut(CheckInOutVo checkInoutVo) throws Exception;
}