package com.privateMapper;

import com.model.NotifyVo;

public interface INotifyMapper {

	public NotifyVo selectNotify(NotifyVo vo);
	
	public int insertNotify(NotifyVo vo);

	public int updateNotify(NotifyVo vo);

	public int clearNotify(NotifyVo vo);
	
}
