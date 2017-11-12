package com.util;

import java.net.InetAddress;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

public class PostMail {

	
	/**
	 * 이메일] 비밀번호찾기
	 * @param toMail
	 * @param toName
	 * @param sendTitle
	 * @param sendRNm
	 * @param sendRPw
	 * @param sender
	 * @param emailParam
	 * @return
	 */
	public static String userFindPwMail(String toMail, String toName, String emailParam) {

		// 인증키 만들기
		long time = System.currentTimeMillis();
		UUID authkey = UUID.randomUUID();

		String sender = " 하모니위버";
		String host = "smtp.worksmobile.com";
		String subject = "안녕하세요.  하모니위버입니다. "; 
		String from = "youngsoo@invesume.com"; // 보내는 메일
		String fromName = "하모니위버"; // 보낸 사람 표기
		String to = toMail;
		String sendTitle = "개인정보(비밀번호) 찾기";
		
		
		try {
			
			InetAddress local = InetAddress.getLocalHost();
			// 개발
//			String ip = "192.168.0.60"; // local.getHostAddress();
			// 배포
			String ip = "211.110.229.231";
			// 내용
			String content = "<h2>" + toName + "님 </h2>안녕하세요" + "<br> " + sendTitle + " 메일입니다.<br>" + " <p>";
					content += "비밀번호를 설정하시려면 다음 링크를 클릭해주세요.<br>";
					content += "<a href='https://"+ip+":8443/member/changeUserPwFrm?"+emailParam+"'>하모니위버 비밀번호 변경(클릭)</a>";

					
			// Properties 값 인스턴스 생성과 기본 세션 (SMTP 서버 호스트 지정)
			Properties props = new Properties();

			// worksmobile SMTP 사용 시 적용되는 Properties
			props.put("mail.smtp.starttls.enable", "true"); // tls 사용 여부
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.auth", "true");

			MailAuthenticator auth = new MailAuthenticator("youngsoo@invesume.com", "hanys0523");

			Session mailSession = Session.getDefaultInstance(props, auth);

			Message msg = new MimeMessage(mailSession);

			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			InternetAddress[] address = { new InternetAddress(to) };

			msg.setRecipients(Message.RecipientType.TO, address); // 받는 사람설정

			msg.setSubject(subject); // 제목 설정
			msg.setSentDate(new java.util.Date()); // 보내는 날짜 설정
			msg.setContent(content, "text/html;charset=utf-8"); // 내용 설정(HTML형식)

			Transport.send(msg); // SEND MAIL!!

			System.out.println(toName + "님에게 메일 발송을 완료하였습니다.");

		} catch (Exception e) {
			System.out.println("error : " + e.getMessage());
		}

		return "" + authkey + time;

	}

	/**
	 * 이메일] 룸참여
	 * 
	 * @param toMail
	 * @param toName
	 * @param sendTitle
	 * @param sendRNm
	 * @param sendRPw
	 * @param sender
	 * @param emailParam
	 * @return
	 */
	public static String inviteMail(String toMail, String toName, String sendTitle, String sendRNm, String sendRPw,
			String sender, String emailParam) {

		// 인증키 만들기
		long time = System.currentTimeMillis();
		UUID authkey = UUID.randomUUID();

		String host = "smtp.worksmobile.com";
		String subject = "안녕하세요. " + toName + "님 " + sendTitle + "요청"; // 제목
		String from = "kg1942@invesume.com"; // 보내는 메일
		String fromName = "하모니아"; // 보낸 사람 표기
		String to = toMail;
		String publicYn = "";
		if (sendRPw == null || sendRPw.length() == 0) {
			sendRPw = "공개 방입니다. 비밀번호 없이 바로 접속 가능합니다.";
			publicYn = "N";
		}else{
			publicYn = "Y";
		}


		try {

			InetAddress local = InetAddress.getLocalHost();
			// 개발
//			String ip = "192.168.0.37"; // local.getHostAddress();
			// 배포
			String ip = "211.110.229.231";
			// 내용
			String content = "<h2>" + toName + "님</h2>" + "<br> " + sendTitle + " 메일입니다.<br>" + " <p>" + sender
					+ " 님 께서 화상 채팅 방으로 초대 하였습니다.</p>" + "<p>* 방이름 : " + sendRNm + " <br>"  	// * 비밀번호 : " + sendRPw + "</p>"
					+ "<a href='https://"+ip+":8443/room/roompage?" + emailParam +"&inviteYn=Y" + "&publicYn="+ publicYn + "' >하모니아 화상채팅 하기<---클릭!!</a>";
		
			
			// Properties 값 인스턴스 생성과 기본 세션 (SMTP 서버 호스트 지정)
			System.out.println("content===="+ content);
			Properties props = new Properties();

			// worksmobile SMTP 사용 시 적용되는 Properties
			props.put("mail.smtp.starttls.enable", "true"); // tls 사용 여부
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.auth", "true");

			MailAuthenticator auth = new MailAuthenticator("kg1942@invesume.com", "dmstjd43302");

			Session mailSession = Session.getDefaultInstance(props, auth);

			Message msg = new MimeMessage(mailSession);

			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			InternetAddress[] address = { new InternetAddress(to) };

			msg.setRecipients(Message.RecipientType.TO, address); // 받는 사람설정

			msg.setSubject(subject); // 제목 설정
			msg.setSentDate(new java.util.Date()); // 보내는 날짜 설정
			msg.setContent(content, "text/html;charset=utf-8"); // 내용 설정(HTML형식)

			Transport.send(msg); // SEND MAIL!!

			System.out.println(toName + "님에게 메일 발송을 완료하였습니다.");

		} catch (Exception e) {
			System.out.println("error : " + e.getMessage());
		}

		return "" + authkey + time;

	}

	
	public static String inviteMaiOfLinkl(String toMail, String toName, String sendTitle, String sendRNm, String sendRPw,
			String sender, String emailParam) {

		// 인증키 만들기
		long time = System.currentTimeMillis();
		UUID authkey = UUID.randomUUID();

		String host = "smtp.worksmobile.com";
		String subject = "안녕하세요. " + toName + "님 " + sendTitle + "요청"; // 제목
		String from = "kg1942@invesume.com"; // 보내는 메일
		String fromName = "하모니아"; // 보낸 사람 표기
		String to = toMail;
		String publicYn = "";
		if (sendRPw == null || sendRPw.length() == 0) {
			sendRPw = "공개 방입니다. 비밀번호 없이 바로 접속 가능합니다.";
			publicYn = "N";
		}else{
			publicYn = "Y";
		}


		try {

			InetAddress local = InetAddress.getLocalHost();
			// 개발
//			String ip = "192.168.0.37"; // local.getHostAddress();
			// 배포
			String ip = "211.110.229.231";
			// 내용
			String content = "<h2>" + toName + "님</h2>" + "<br> " + sendTitle + " 메일입니다.<br>" + " <p>" + sender
					+ " 님 께서 화상 채팅 방으로 초대 하였습니다.</p>" + "<p>* 방이름 : " + sendRNm + " <br>"  	// * 비밀번호 : " + sendRPw + "</p>"
					+ "<a href='https://"+ip+":8443/room/roomLink?" + emailParam +"&inviteYn=Y" + "&publicYn="+ publicYn + "' >하모니아 화상채팅 하기<---클릭!!</a>";
		
			
			// Properties 값 인스턴스 생성과 기본 세션 (SMTP 서버 호스트 지정)
			System.out.println("content===="+ content);
			Properties props = new Properties();

			// worksmobile SMTP 사용 시 적용되는 Properties
			props.put("mail.smtp.starttls.enable", "true"); // tls 사용 여부
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.auth", "true");

			MailAuthenticator auth = new MailAuthenticator("kg1942@invesume.com", "dmstjd43302");

			Session mailSession = Session.getDefaultInstance(props, auth);

			Message msg = new MimeMessage(mailSession);

			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			InternetAddress[] address = { new InternetAddress(to) };

			msg.setRecipients(Message.RecipientType.TO, address); // 받는 사람설정

			msg.setSubject(subject); // 제목 설정
			msg.setSentDate(new java.util.Date()); // 보내는 날짜 설정
			msg.setContent(content, "text/html;charset=utf-8"); // 내용 설정(HTML형식)

			Transport.send(msg); // SEND MAIL!!

			System.out.println(toName + "님에게 메일 발송을 완료하였습니다.");

		} catch (Exception e) {
			System.out.println("error : " + e.getMessage());
		}

		return "" + authkey + time;

	}

	
}
