package com.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HrmInfoUpdateVo {
	/* 
	 * 171016 create = limitationOne
	 * 객실 세부정보 업데이트용
	 */
	private int hotel_seq;
	private int hrm_seq;
	private String hotel_name;
	private String room_num;
}