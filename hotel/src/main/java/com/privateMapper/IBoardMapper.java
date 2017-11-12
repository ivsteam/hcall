package com.privateMapper;

import com.model.BoardVo;

public interface IBoardMapper {

	// user info
	public BoardVo selectUserInfo(String userid);

}