package com.model;



import lombok.Data; 
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class Docsumary  {

	private String seqId;
	private String fileName;
	private String filePath;
	private String fileSize;
	private String fileType;
	private String fileTypeGubun;
	private String contents; 
	private String owner;
	private String dept;
	private String cdate; 
	private String userId; 
	
	
}
