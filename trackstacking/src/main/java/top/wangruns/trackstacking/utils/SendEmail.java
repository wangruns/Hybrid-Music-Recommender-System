package top.wangruns.trackstacking.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	
	public static boolean sendemail(String theme, String messages,String email){
		Properties prop = new Properties();
		prop.put("mail.transport.protocol", "smtp");
		prop.put("mail.host", "smtp.163.com");
		prop.put("mail.smtp.auth", "true");
		Session session = Session.getInstance(prop);
		session.setDebug(true);
		Message message;
		try {
			message = createSimpleMail(session, theme, messages,email);
			Transport ts = session.getTransport();
			ts.connect("15923035603@163.com", "12345678910");
			ts.sendMessage(message, message.getAllRecipients());
			ts.close();
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}
	
	private static MimeMessage createSimpleMail(Session session, String theme, String messages,String email) throws Exception {
		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress("15923035603@163.com"));
		message.addRecipients(Message.RecipientType.TO, email);
		message.setSubject(theme);
		message.setText(messages);
		message.saveChanges();
		return message;
	}

}
