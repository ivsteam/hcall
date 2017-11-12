package com.privateMapper;

import com.model.RoomVo;

public interface IRoomMapper {

	public RoomVo selectReqChatInfo(RoomVo vo);
	
	public int roomTxtChatCreate(RoomVo vo);

	public int roomTxtDelete(RoomVo vo);

	public int roomTxtChatCreateHistory(RoomVo vo);

}