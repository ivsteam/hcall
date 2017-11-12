package com.model;


import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class RoomOfLinkVo {
 
//	룸정보
    private int roomIdLink;
    private int rpaIdLink;
    private String roomNm;
    private String inviteRoomNm;
    private String roomUser;
    private String frstDate;
    private String lastDate;

    private String inviteNm;
    private String inviteEmail;
    private String inviteYn;
    
 
}