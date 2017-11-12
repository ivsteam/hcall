package com.model;

import javax.persistence.Column;
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
public class PickdropVo {
	/* 
	 * 171023 create = limitationOne
	 * 픽드랍서비스용 Vo
	 */
	private int pd_seq;
	private int hotel_seq;
	private int reserv_seq;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Pickdrop.INVALID_CUSTOMMER)
	@Min(value=1, message=Constant.Pickdrop.INVALID_CUSTOMMER)
	private int cust_seq;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Pickdrop.INVALID_PERSONNEL)
	@Min(value=0, message=Constant.Pickdrop.INVALID_PERSONNEL)
	private int personnel;
	
	private String add_date;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Pickdrop.INVALID_DATE)
	private String want_date;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Pickdrop.INVALID_STARTPOINT)
	@Length(min=1, message=Constant.Pickdrop.INVALID_STARTPOINT)
	private String start_address;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Pickdrop.INVALID_STARTPOINT)
	@Length(min=1, message=Constant.Pickdrop.INVALID_STARTPOINT)
	private String start_point_width;
	
	private String start_point_height;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Pickdrop.INVALID_ENDPOINT)
	@Length(min=1, message=Constant.Pickdrop.INVALID_ENDPOINT)
	private String end_address;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Pickdrop.INVALID_ENDPOINT)
	@Length(min=1, message=Constant.Pickdrop.INVALID_ENDPOINT)
	private String end_point_width;
	
	private String end_point_height;
	
	private boolean complete_check;
	
	private CustomerVo customerVo;
	private ReservationAddVo reservationVo;
	
	private Tbl_hotel_guest_user_infoVo guestVo;
//	private Tbl_hotel_room_infoVo roomVo;
}