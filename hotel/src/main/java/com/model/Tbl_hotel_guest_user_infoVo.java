package com.model;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

import com.util.Constant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tbl_hotel_guest_user_infoVo {
	/* 
	 * 171016 create = limitationOne
	 * 투숙객Vo
	 */
	private int guest_no;
	private int hotel_no;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Customer.INVALID_ID)
	@Length(min=1, max=100, message=Constant.Customer.INVALID_LENGTH_ID)
	private String guest_id;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Customer.INVALID_NAME)
	@Length(min=1, max=100, message=Constant.Customer.INVALID_LENGTH_NAME)
	private String guest_nm;
	
	@Column(nullable=false) 
	@NotNull(message=Constant.Customer.INVALID_PASSWORD)
	@Length(min=8, max=30, message=Constant.Customer.INVALID_LENGTH_PASSDORD)
	private String guest_pwd;
	
	@Column(nullable=false) 
	@NotNull(message=Constant.Customer.INVALID_EMAIL)
	@Length(min=8, max=100, message=Constant.Customer.INVALID_LENGTH_MAIL)
	@Email(message=Constant.Customer.INVALID_MAIL)
	private String guest_email;
	
	private String insert_dt;
	private String update_dt;
	private String guest_draw;
}