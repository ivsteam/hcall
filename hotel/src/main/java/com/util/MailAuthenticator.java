package com.util;

import javax.mail.Authenticator;

/**
 * 
 * @author young.soo
 * @param id
 * @param pw
 * 
 */
public class MailAuthenticator extends  Authenticator{
	
	private String id;
	private String pw;
	
	public MailAuthenticator(String id, String pw){
		this.id = id;
		this.pw = pw;
	}
	
	protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
		return new javax.mail.PasswordAuthentication(id, pw);
	}

}

