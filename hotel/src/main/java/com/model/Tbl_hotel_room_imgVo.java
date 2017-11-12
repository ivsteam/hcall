package com.model;

import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import com.util.Constant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tbl_hotel_room_imgVo {
	/* 
	 * 171031 create = limitationOne
	 * 객실 이미지Vo
	 */
	private int u_no;
	private int ri_no;
	private int no;
	
	private String room_img;
	
	@NotNull(message=Constant.HrmImg.NOT_INSERT_HRM_IMG_FILE)
	private List<MultipartFile> qqfile;
	
	private String up_dir = Constant.Path.IMG_DEFAULT_PATH;
}