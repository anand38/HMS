package com.additional;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {
	 public static void doMail(String email,String num) {  
		  
		 String to=email;//change accordingly  
		  
		  
		  //Get the session object  
		  Properties props = new Properties();  
		  props.put("mail.smtp.starttls.enable", "true");
		  props.put("mail.smtp.host", "smtp.gmail.com");   //change put gmail here
		  props.put("mail.smtp.socketFactory.port", "25");  
		  //props.put("mail.smtp.socketFactory.class",  
		           // "javax.net.ssl.SSLSocketFactory");  
		  props.put("mail.smtp.auth", "true");  
		  props.put("mail.smtp.port", "25");  
		   
		  Session session = Session.getInstance(props,  
		   new javax.mail.Authenticator() {  
		   protected PasswordAuthentication getPasswordAuthentication() {  
		   return new PasswordAuthentication("anandbrahmadev@gmail.com","Godlygoodgoogle@1234");//change accordingly
		   }  
		  });  
		   
		  //compose message  
		  try {  
		   MimeMessage message = new MimeMessage(session);  
		   message.setFrom(new InternetAddress("anandbrahmadev@gmail.com"));//change accordingly  
		   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
		   message.setSubject("OTP");    //change
		   
		   message.setText("Dear Student, your otp is : " + num );  
		     
		   //send message  
		   Transport.send(message);  
		  
		   
		   
		  } catch (MessagingException e) {throw new RuntimeException(e);}  
		   
		 }  
}
