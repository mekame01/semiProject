package everyBB.common.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import everyBB.common.code.Code;
import everyBB.common.code.ErrorCode;
import everyBB.common.exception.ToAlertException;

public class MailSender {
	
	//1. Session객체 생성
	//2. MimeMessage 작성
	//	* Message header 작성
	//	* Multipart객체 생성
	//	* Message body 작성
	
	public void sendEmail(String to, String subject, String htmlText) {
		//3. 메세지 작성
		try {
			MimeMessage msg = new MimeMessage(getSession());
			msg.setFrom(new InternetAddress(Code.EMAIL.desc));
			msg.setRecipients(Message.RecipientType.TO, to);
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			
			//message의 바디에 추가
			msg.setContent(getMultipart(htmlText));
			//전송
			Transport.send(msg);
		} catch (MessagingException mex) {
			throw new ToAlertException(ErrorCode.MAIL01, mex);
		}	
	}
	
	public Session getSession() {
		//1. SMTP 통신을 위한 Session객체 생성
		PasswordAuthentication pa = new PasswordAuthentication("mekame01@gmail.com", "qlfdjajrdmf0)");
				
		//2. 통신할 SMTP서버 설정 작성
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 587);
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.auth", "true");
				
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return pa;
			}
		});
		return session;
	}
	
	private Multipart getMultipart(String htmlText) throws MessagingException {
		Multipart mp = new MimeMultipart();
		MimeBodyPart htmlPart = new MimeBodyPart();
		
		//보내고 싶은 html코드 작성
		//contentType 작성
		htmlPart.setContent(htmlText, "text/html; charset=utf-8");
		//Multipart객체에 추가
		mp.addBodyPart(htmlPart);
		
		return mp;
	}
	
}
