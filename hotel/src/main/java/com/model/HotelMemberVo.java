package com.model;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

import com.util.Constant;

import lombok.Data;
import lombok.EqualsAndHashCode;

/*
 * 170912 create = limitationOne 
 * 
 * accessToken, refreshToken 정보 확인 필요
 * 회원 계정타입에 따른 분류를 어떻게 해야하는지 확인 필요
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class HotelMemberVo {
	private int mem_id;
	
	@Column(nullable=false) 
	@NotNull(message=Constant.MemberSignup.NOT_INSERT_EMAIL)
	@Length(min=8, max=40, message=Constant.MemberSignup.NOT_LENGTH_EMAIL)
	@Email(message=Constant.MemberSignup.NOT_VALID_EMAIL)
	private String mem_email;
	
	@Column(nullable=false) 
	@NotNull(message=Constant.MemberSignup.NOT_INSERT_PASSWORD)
	@Length(min=8, max=30, message=Constant.MemberSignup.NOT_LENGTH_PASSWORD)
	private String mem_pw;
	
	private String mem_nm;
	private String mem_nickname;
	private String mem_level;
	private String mem_icon;
	private int mgr_id;
	private String first_date;
	private String last_date;
	private String mem_drawYn;
	private String access_token;
	private String refresh_token;
}