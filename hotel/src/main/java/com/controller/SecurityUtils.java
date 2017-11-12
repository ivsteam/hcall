package com.controller;

import java.security.MessageDigest;

public class SecurityUtils {
	/*public static void main(String[] args) throws IOException {
		// 자바 기본 패키지
		BASE64Encoder encoder = new BASE64Encoder();
		BASE64Decoder decoder = new BASE64Decoder();

		String string = "snrk1234";
		String encode = null;
		String decode = null;

		// 자바 기본 패키지 테스트.....!!
		encode = encoder.encode(string.getBytes());
		decode = new String(decoder.decodeBuffer(encode));
		System.out.println("원본 ==> " + string);
		System.out.println("base64 encode ==> " + encode);
		System.out.println("base64 decode ==> " + decode);
		System.out.println("\r\n");

		// Apache commons codec 패키지 테스트.....!!
		encode = Base64.encodeBase64String(string.getBytes()).trim();
		decode = new String(Base64.decodeBase64(encode.getBytes()));
		System.out.println("원본 ==> " + string);
		System.out.println("base64 encode ==> " + encode);
		System.out.println("base64 decode ==> " + decode);

		System.out.println("sha256==11=>" + sha256("snrk1234"));
		System.out.println("testMD5===>" + testMD5("snrk1234"));
		System.out.println("testSHA256===>" + testSHA256("snrk1234"));

		String baset = "snrk1234";

		try {

			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(baset.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if (hex.length() == 1)
					hexString.append('0');
				hexString.append(hex);
			}

			// 출력
			System.out.println(hexString.toString());

		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}

	}*/

	public static String testSHA256(String str) {

		String SHA = "";

		try {

			MessageDigest sh = MessageDigest.getInstance("SHA-256");

			sh.update(str.getBytes());

			byte byteData[] = sh.digest();

			StringBuffer sb = new StringBuffer();

			for (int i = 0; i < byteData.length; i++) {

				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));

			}

			SHA = sb.toString();

		} catch (Exception e) {

			e.printStackTrace();

			SHA = null;

		}

		return SHA;

	}

	public static String testMD5(String str) {

		String MD5 = "";

		try {

			MessageDigest md = MessageDigest.getInstance("MD5");

			md.update(str.getBytes());

			byte byteData[] = md.digest();

			StringBuffer sb = new StringBuffer();

			for (int i = 0; i < byteData.length; i++) {

				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));

			}

			MD5 = sb.toString();

		} catch (Exception e) {

			e.printStackTrace();

			MD5 = null;

		}

		return MD5;

	}

	public static String sha256(String base) {
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(base.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if (hex.length() == 1)
					hexString.append('0');
				hexString.append(hex);
			}

			return hexString.toString();
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}
	
	
}
