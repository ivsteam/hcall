package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.model.RoomVo;
import com.privateMapper.IRoomMapper;


@Service
public class RoomService {
	
	@Autowired
	private IRoomMapper roomMapper;

	@Transactional
	public Boolean roomTxtChatCreateProc( RoomVo vo, String gb){
		Boolean isTxtChatBool = false;
		vo.setRoom_gubun(gb);
		vo.setRoom_invite_id("Hotel");
		
		// mv history 
		int retHistory = roomMapper.roomTxtChatCreateHistory(vo);
		if(retHistory >= 0){
			int retDel = roomMapper.roomTxtDelete(vo);
			
//			if( retDel > 0 ){
				int retVal = roomMapper.roomTxtChatCreate(vo);
				if(retVal > 0){
					isTxtChatBool = true;
				}
//			}
		}
		return isTxtChatBool;
	}
	
	
}
