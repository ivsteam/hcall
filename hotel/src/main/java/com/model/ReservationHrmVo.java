package com.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.util.Constant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationHrmVo extends HrmVo {
	/* 
	 * 171011 create = limitationOne
	 * 예약 관련 vo
	 */
	private int reserv_seq;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_ROOM)
	private int hotel_seq;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_ROOM)
	private int hrm_seq;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_CUSTOMER)
	private int cust_seq;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_CUSTOMER)
	@Length(min=1, max=200, message=Constant.Hrm.NOT_LENGTH_HRM_NAME)
	private String reservation_name;
	
	private String guest_name;
	private String room_num;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_PERSONNEL)
	private int personnel;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_ROOM_COUNT)
	private int hrm_count;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_TERM)
	private String add_date;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_TERM)
	private Date first_date;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_TERM)
	private Date last_date;
	
	private String check_in;
	private String check_out;
	private String etc;
	private String state;
	
	private String term;
}