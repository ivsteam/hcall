package com.privateMapper;

import java.util.List;

import com.model.CustomerSearchVo;
import com.model.CustomerVo;
import com.model.PickdropSearchVo;
import com.model.PickdropVo;
import com.model.ReservationCusVo;

public interface ICustomerMapper {
	/* 
	 * 171010 create = limitationOne
	 */
	public List<CustomerVo> custList(int hotelSeq) throws Exception;
	public List<CustomerVo> searchCustList(CustomerSearchVo customerSearchVo) throws Exception;
	public void cmCreate(CustomerVo customerVo) throws Exception;
	public CustomerVo getCustomer(int custSeq) throws Exception;
	public void cmUpdate(CustomerVo customerVo) throws Exception;
	public void cmDelete(int custSeq) throws Exception;
	public List<PickdropVo> pickDrop(int hotelSeq) throws Exception;
	public List<PickdropVo> pickDropSearch(PickdropSearchVo pickdropSearchVo) throws Exception;
	public List<ReservationCusVo> reservationList(CustomerSearchVo customerSearchVo) throws Exception;
	public int addPickdrop(PickdropVo pickdropVo) throws Exception;
	public PickdropVo pickdropInfo(PickdropVo pickdropVo) throws Exception;
	public int pickdropDelete(PickdropVo pickdropVo) throws Exception;
	public int pickdropSuccess(PickdropVo pickdropVo) throws Exception;
}