package com.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationMapVo {
	private Tbl_hotel_guest_user_infoVo guestVo;
	private Tbl_hotel_room_infoVo roomVo;
	private ReservationCusVo reservationVo;
}