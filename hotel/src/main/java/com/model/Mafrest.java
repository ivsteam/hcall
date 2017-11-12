package com.model;



import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class Mafrest  {

	private List<Docsumary> DocsumaryList;	
	private String totalCount	;
	private String extra;
	private String success;
	private String msg;
	
	private String q_keyword;
	private String pageNo;
	private String pageOffset;
	private String pageListCnt;
	private String fromDate;
	private String toDate;
	private String q_filetype;
	private String q_owner;
	private String q_dept;
	private String sort;
	
	private String userId;
}
