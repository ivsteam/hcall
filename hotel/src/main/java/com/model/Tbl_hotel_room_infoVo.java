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
public class Tbl_hotel_room_infoVo {
	/* 
	 * 171011 create = limitationOne
	 * 호텔이 사용하는 객실vo
	 */
	private int u_no;
	private int no;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_NAME)
	@Length(min=1, max=200, message=Constant.Hrm.NOT_LENGTH_HRM_NAME)
	private String room_name;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_USE)
	private String room_use_yn;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_FEE)
	private String room_money;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_PERSONNEL_MAX)
	private String room_people_rule;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_ROOMNUM)
	private String room_position;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_KIND)
	@Length(min=1, max=10, message=Constant.Hrm.NOT_LENGTH_HRM_KIND)
	private String room_bed_type;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_CONFIGURATION)
	@Length(min=1, max=200, message=Constant.Hrm.NOT_LENGTH_HRM_CONFIGURATION)
	private String room_comp;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_INFORMATION)
	@Length(min=1, max=2000, message=Constant.Hrm.NOT_LENGTH_HRM_INFORMATION)
	private String room_info;
	
	@Column(nullable=false)
	@NotNull(message=Constant.Hrm.NOT_INSERT_HRM_SERVICE)
	@Length(min=1, max=4000, message=Constant.Hrm.NOT_LENGTH_HRM_SERVICE)
	private String room_service;
	
	private List<Tbl_hotel_room_imgVo> hrmImgList;
	
//	public void hrmImgListPathSet() {
//		if(hrmImgList == null || hrmImgList.get(0).getPath() == null) return;
//		
//		for(int i=0; i < hrmImgList.size() ;++i) {
//			hrmImgList.get(i).setPath(hrmImgList.get(i).getPath().replace(Constant.Path.IMG_REPLACE_PATH, ""));
//		}
//	}
}