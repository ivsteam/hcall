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
public class ReservationAddVo {
	/* 
	 * 171011 create = limitationOne
	 * 예약문의 등록시 사용하는 vo
	 */
	private int reserv_seq;
	private int hotel_seq;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_ROOM)
	private int hrm_seq;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_CUSTOMER)
	private int cust_seq;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_CUSTOMER)
	@Length(min=1, max=200, message=Constant.Reservation.INVALID_RESERVATION)
	private String reservation_name;
	
	private String guest_name;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_ROOMNUM)
	@Length(min=1, max=100, message=Constant.Hrm.NOT_INSERT_HRM_ROOMNUM)
	private String room_num;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_PERSONNEL)
	private int personnel;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_ROOM_COUNT)
	private int hrm_count;
	
	private String add_date;
	
	@Column(nullable=false)
	@Length(min=1, max=100, message=Constant.Reservation.INVALID_FIRST_DATE)
	@NotNull(message=Constant.Reservation.INVALID_FIRST_DATE)
	private String first_date;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Reservation.INVALID_LAST_DATE)
	@Length(min=1, max=100, message=Constant.Reservation.INVALID_LAST_DATE)
	private String last_date;
	
	private String etc;
	private String state = Constant.State.RESERVATION_START;
	
//	 보류
//	@OneToMany(cascade=CascadeType.ALL)
//	@JoinColumn(name="reservSeq")
//	private List<ReservationDayVo> dayList;
	
//	private List<ReservationAddVo> list;
}