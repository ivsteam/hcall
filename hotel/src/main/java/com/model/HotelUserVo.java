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
public class HotelUserVo {
	private int u_no;
	@NotNull(message=Constant.MemberSignup.NOT_INSERT_ID)
	@Length(min=4, max=40, message=Constant.MemberSignup.NOT_LENGTH_ID)
	private String id;
	
	@NotNull(message=Constant.MemberSignup.NOT_INSERT_PASSWORD)
	@Length(min=4, max=30, message=Constant.MemberSignup.NOT_LENGTH_PASSWORD)
	private String pwd;
	
	private String name;
	private String auth;
}