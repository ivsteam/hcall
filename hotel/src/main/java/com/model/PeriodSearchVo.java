package com.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.validation.constraints.Future;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import com.util.Constant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PeriodSearchVo {
	/* 
	 * 171019 create = limitationOne
	 * 예약등록시 해당 기간의 사용가능 객실을 찾기 위한 vo
	 */
	@Column(name="personnel", nullable=false)
	@Min(value=1, message=Constant.PeriodSearch.INVALID_PERSONNEL)
	@NotNull(message=Constant.PeriodSearch.INVALID_PERSONNEL)
	private int personnel;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_ROOM_COUNT)
	private int hrm_count;
	
	@Column(nullable=false)
	@Future(message=Constant.PeriodSearch.INVALID_DATE_FUTURE)
	@NotNull(message=Constant.PeriodSearch.INVALID_FIRSTDATE)
	private Date first_date;
	
	@Column(nullable=false)
	@Future(message=Constant.PeriodSearch.INVALID_DATE_FUTURE)
	@NotNull(message=Constant.PeriodSearch.INVALID_LASTDATE)
	private Date last_date;
}