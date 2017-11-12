package com.model;


import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MemberVo {
 
    private int guestNo;
    private int hotelNo;
    private String guestId;
    private String guestNm;
    private String guestPwd;
    private String guestPwd_Re;
    private String guestEmail;
    private String insert_dt;
    private String update_dt;
    private String guest_draw;
    
    /**
     * 검색
     */
    private String  groupMemberNm;
    private int tot_record;
    
  
    /* paging*/
    private int groupInfoCurrentPage;
    
}