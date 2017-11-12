package com.privateMapper;

import java.util.List;

import com.model.CustomerSearchVo;
import com.model.PickdropSearchVo;
import com.model.PickdropVo;
import com.model.ReservationAddVo;
import com.model.ReservationCusVo;

public interface IPickdropMapper {
	/* 
	 * 171031 create = limitationOne
	 */
	public List<PickdropVo> pickDrop(int hotelSeq) throws Exception;
	public List<PickdropVo> pickDropSearch(PickdropSearchVo pickdropSearchVo) throws Exception;
	public List<ReservationCusVo> reservationList(CustomerSearchVo customerSearchVo) throws Exception;
	public int addPickdrop(PickdropVo pickdropVo) throws Exception;
	public PickdropVo pickdropInfo(PickdropVo pickdropVo) throws Exception;
	public ReservationAddVo getReservation(int reservSeq) throws Exception;
	public int pickdropDelete(PickdropVo pickdropVo) throws Exception;
	public int pickdropSuccess(PickdropVo pickdropVo) throws Exception;
}