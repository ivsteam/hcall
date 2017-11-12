package com.model;


import java.util.Date;
import lombok.Data;
import lombok.EqualsAndHashCode;
 

@Data
@EqualsAndHashCode(callSuper = false)
public class NotifyVo {
 
    private int nSeq;
    private String memId;
    private String roomID;
    private String senderID;
    private String recipientID;
    private String memTeam;
    private String nNotifyYN;
    private String frstDate;
    private String lastDate;
 
   
 
}