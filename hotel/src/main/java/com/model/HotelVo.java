package com.model;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.util.Constant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class HotelVo {
	/* 
	 * 171016 create = limitationOne
	 * 호텔Vo
	 */
	private int hotel_seq;
	
	@Column(nullable=false)
	@NotNull(message=Constant.HotelSignup.NOT_INSERT_HOTEL_NAME)
	@Length(min=1, max=200, message=Constant.HotelSignup.NOT_LENGTH_HOTEL_NAME)
	private String hotel_name;
	
	@Column(nullable=false)
	@NotNull(message=Constant.HotelSignup.NOT_INSERT_HOTEL_ADDRESS)
	@Length(min=2, max=400, message=Constant.HotelSignup.NOT_LENGTH_HOTEL_ADDRESS)
	private String hotel_address;
	
	@Column(nullable=false)
	@NotNull(message=Constant.HotelSignup.NOT_INSERT_HOTEL_WEBSITE)
	@Length(min=5, max=300, message=Constant.HotelSignup.NOT_LENGTH_HOTEL_WEBSITE )
	private String hotel_website;
	
	@Column(nullable=false)
	@NotNull(message=Constant.HotelSignup.NOT_INSERT_HOTEL_PHONE)
	@Length(min=7, max=25, message=Constant.HotelSignup.NOT_LENGTH_HOTEL_PHONE)
	private String hotel_phone;
	
	@Column(nullable=false)
	@NotNull(message=Constant.HotelSignup.NOT_INSERT_HOTEL_INFOMATION)
	@Length(min=1, max=4000, message=Constant.HotelSignup.NOT_LENGTH_HOTEL_INFOMATION)
	private String hotel_info;
	
	@Column(nullable=false)
	@NotNull(message=Constant.HotelSignup.NOT_INSERT_HOTEL_LOCATION)
	private String hotel_location_width;
	
	@Column(nullable=false)
	private String hotel_location_height;
	
	private String mem_email;
	
	private String hotel_first_date;
	private String hotel_last_date;
}