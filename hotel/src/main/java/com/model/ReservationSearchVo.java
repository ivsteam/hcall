package com.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.util.Constant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationSearchVo {
	/* 
	 * 171016 create = limitationOne
	 * 검색용Vo - 예약문의
	 */
	private int hotel_seq;
	
	@NotNull(message=Constant.Search.INVALID_TPYE)
	@Length(min=1, max=50, message=Constant.Search.INVALID_TPYE)
	private String valueType;
	
	@NotNull(message=Constant.Search.INVALID_VALUE)
	@Length(min=1, max=50, message=Constant.Search.INVALID_LENGTH_VALUE)
	private String searchValue;
	
	@NotNull(message=Constant.Search.INVALID_TPYE)
	@Length(min=1, max=50, message=Constant.Search.INVALID_TPYE)
	private String stateType;
}