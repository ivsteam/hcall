package com.model;

import java.util.List;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import com.util.Constant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HrmImgVo {
	/* 
	 * 171016 create = limitationOne
	 * 객실 이미지Vo
	 */
	private int img_seq;
	
	@Column(nullable=false)
	@NotNull(message=Constant.HrmImg.NOT_INSERT_HRM_SEQ)
	private int hrm_seq;
	
	private String path;
	private String file_Ori_name;
	private String file_Change_name;
	
	@NotNull(message=Constant.HrmImg.NOT_INSERT_HRM_IMG_FILE)
	private List<MultipartFile> qqfile;
	
	private String up_dir = Constant.Path.IMG_DEFAULT_PATH;
}