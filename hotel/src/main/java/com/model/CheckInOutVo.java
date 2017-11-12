package com.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.util.Constant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CheckInOutVo {
	/* 
	 * 171022 create = limitationOne
	 * 체크인/아웃 을 위한 Vo
	 */
	private int hotel_seq;
	
	@NotNull(message=Constant.HrmCheckMessage.NOT_INSERT_CHECK_IN_RESERVATION)
	@Min(value=1, message=Constant.HrmCheckMessage.NOT_INSERT_CHECK_IN_RESERVATION)
	private int reserv_seq;
	
	@NotNull(message=Constant.HrmCheckMessage.NOT_INSERT_CHECK_IN_HRM)
	@Min(value=1, message=Constant.HrmCheckMessage.NOT_INSERT_CHECK_IN_HRM)
	private int hrm_seq;
	
//	@NotNull(message=Constant.HrmCheckMessage.NOT_INSERT_CHECK_IN_CUSTOMER)
//	@Min(value=1, message=Constant.HrmCheckMessage.NOT_INSERT_CHECK_IN_CUSTOMER)
	private int cust_seq;
	
	@NotNull(message=Constant.HrmCheckMessage.NOT_INSERT_CHECK_IN_GUESTNAME)
	@Length(min=1, max=50, message=Constant.HrmCheckMessage.NOT_LENGTH_CHECK_IN_GUESTNAME)
	private String guest_name;
	
	private boolean check_in_out;
	private String state;
}