package com.util;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class EncodingUtil {
	private StandardPBEStringEncryptor pbeEnc = new StandardPBEStringEncryptor();
	 
	public EncodingUtil() {
        pbeEnc.setAlgorithm("PBEWithMD5AndDES");
        pbeEnc.setPassword("SAMPLE");
    }
     
    public String encrypt(String data) {
        return pbeEnc.encrypt(data);
    }
     
    public String decrypt(String data) {
        return pbeEnc.decrypt(data);
    }
}