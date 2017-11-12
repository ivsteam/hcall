package com.publicMapper;

import com.model.HotelUserVo;

public interface IHotelMemberMapper {
	public HotelUserVo loginEmail(HotelUserVo memberVo) throws Exception;
}