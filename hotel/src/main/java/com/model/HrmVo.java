package com.model;

import java.util.List;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.util.Constant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HrmVo {
	/* 
	 * 171011 create = limitationOne
	 * 호텔이 사용하는 객실vo
	 */
	private int hotel_seq;
	private int hrm_seq;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_NAME)
	@Length(min=1, max=200, message=Constant.Hrm.NOT_LENGTH_HRM_NAME)
	private String hrm_name;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_PERSONNEL_MAX)
	private int personnel_max;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_ROOMNUM)
	@Length(min=1, max=100, message=Constant.Hrm.NOT_INSERT_HRM_ROOMNUM)
	private String room_num;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_CONFIGURATION)
	@Length(min=1, max=200, message=Constant.Hrm.NOT_LENGTH_HRM_CONFIGURATION)
	private String hrm_configuration;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_INFORMATION)
	@Length(min=1, max=2000, message=Constant.Hrm.NOT_LENGTH_HRM_INFORMATION)
	private String hrm_information;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_SERVICE)
	@Length(min=1, max=4000, message=Constant.Hrm.NOT_LENGTH_HRM_SERVICE)
	private String hrm_service;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_FEE)
	private int hrm_fee;

	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_FEE_TYPE)
	@Length(min=1, max=10, message=Constant.Hrm.NOT_INSERT_HRM_FEE_TYPE)
	private String hrm_fee_type;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_KIND)
	@Length(min=1, max=10, message=Constant.Hrm.NOT_LENGTH_HRM_KIND)
	private String hrm_kinds;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_USE)
	private boolean hrm_use;
	
	private String state = Constant.State.ROOM_VACANCY;
	
	private List<HrmImgVo> hrmImgList;
	
	private int personnel;
	
	public void hrmImgListPathSet() {
		if(hrmImgList == null || hrmImgList.get(0).getPath() == null) return;
		
		for(int i=0; i < hrmImgList.size() ;++i) {
			hrmImgList.get(i).setPath(hrmImgList.get(i).getPath().replace(Constant.Path.IMG_REPLACE_PATH, ""));
		}
	}
}