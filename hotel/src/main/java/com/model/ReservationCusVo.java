package com.model;

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
public class ReservationCusVo extends CustomerVo {
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
	private String cust_name;
	
	private String guest_name;
	private String hrm_name;
	private String hrm_kinds;
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
	private String first_date;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_TERM)
	private String last_date;
	
	private String check_in;
	private String check_out;
	private String etc;
	private String state;
	
	private String term;
	
	private Tbl_hotel_guest_user_infoVo guestVo;
	private Tbl_hotel_room_infoVo roomVo;
}