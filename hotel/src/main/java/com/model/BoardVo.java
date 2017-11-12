package com.model;


import java.util.Date;
import lombok.Data;
import lombok.EqualsAndHashCode;
 

@Data
@EqualsAndHashCode(callSuper = false)
public class BoardVo {
 
    private String userid;
    private String username;
    private String loginid;
    private String deptname;
    private String officephone;
    private String mobilephone;
 
   
 
}