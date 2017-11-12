package com.model;


import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class RoomVo {
 
//	룸정보
    private int room_no;
    private String room_create_id;
    private String room_invite_id;
    private String room_gubun;
    private String room_title;
    private String insert_dt;
    private String hotel_no;
 
}