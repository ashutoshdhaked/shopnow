package mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendTextMail {
	public static boolean sendMail(String msg,String subject,String to,String from,String password) {
		String host ="smtp.gmail.com";
		// getting the system properties
		Properties properties = System.getProperties();
		System.out.println("propeties : "+properties);
		properties.put("mail.smtp.host",host);
		properties.put("mail.smtp.port","465");
		properties.put("mail.smtp.ssl.enable","true");
		properties.put("mail.smtp.auth","true");
       Session session= Session.getInstance(properties,new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from,password);
			}
        	
		});
		
		session.setDebug(true);
		
		MimeMessage mimeMessage = new MimeMessage(session);
		try {
			mimeMessage.setFrom(from);
			// if there is multipal email for which we send this then you can take array of InternetAdderss() and send array
			mimeMessage.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
			mimeMessage.setSubject(subject);
			mimeMessage.setText(msg);
			/**
			 * We have to change this url when we host our site 
			 * 
			 * 
			 * **/
			String link ="http://192.168.43.21:8090/ShopeNow/resetpassword.jsp";   
			String showlink= "<p>Click the button below:</p><p><a href=\"" + link + "\"><button> Reset Now </button></a></p>";
			mimeMessage.setContent(showlink,"text/html");
			Transport.send(mimeMessage);
			System.out.println(" mail is successfully sended ");
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
		
	}
	

}
