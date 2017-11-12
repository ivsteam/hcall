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
public class CustomerVo {
	/* 
	 * 171016 create = limitationOne
	 * 투숙객Vo
	 */
	private int hotel_seq;
	private int cust_seq;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Customer.INVALID_NAME)
	@Length(min=1, max=100, message=Constant.Customer.INVALID_LENGTH_NAME)
	private String cust_name;
	
	@Column(nullable=false) 
	@NotNull(message=Constant.Customer.INVALID_PASSWORD)
	@Length(min=8, max=30, message=Constant.Customer.INVALID_LENGTH_PASSDORD)
	private String cust_pw;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Customer.INVALID_PHONE)
	@Length(min=5, max=20, message=Constant.Customer.INVALID_LENGTH_PHONE)
	private String cust_phone;
	
	@Column(nullable=false) 
	@NotNull(message=Constant.Customer.INVALID_EMAIL)
	@Length(min=8, max=100, message=Constant.Customer.INVALID_LENGTH_MAIL)
	@Email(message=Constant.Customer.INVALID_MAIL)
	private String cust_email;
	
	private String cust_id;
	private String cust_rating;
	private String signup_date;
}