package com.web.hackercode.controller;

import java.sql.Date;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.web.hackercode.dao.UserDAO;
import com.web.hackercode.structures.User;
import com.web.hackercode.utility.Utility;

@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSenderObj;
	private final String emailFromRecipient = "hackercode.19@gmail.com";
    
	ApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
    Utility utils = new Utility();
    
    @RequestMapping(value = "/user/api/reset-password", method = RequestMethod.POST)
    @ResponseBody
    public String resetPasswordMailer(HttpServletRequest req, @RequestParam final String email) {
    	final String subject = "HackerCode | Password Reset Link";
    	final String resetLink =  utils.getMd5(email +  utils.getMd5(utils.randomAlphaNumeric(10)));
    	final String message = "localhost:8000/password-reset/" + resetLink;
		
    	UserDAO udao = ctx.getBean(UserDAO.class);
    	JsonObject obj = new JsonObject();
    	
    	obj.addProperty("isUser", false);
    	obj.addProperty("isMailSent", false);
    	
    	User user = udao.getUser(email);
    	
    	if (user != null) {
    		obj.addProperty("isUser", true);

    		// save md5 hash to database to compare it later with incoming request.
    		if (udao.saveResetLink(user.getUsername(), resetLink)) {
    			try {
        			mailSenderObj.send(new MimeMessagePreparator() {
                        public void prepare(MimeMessage mimeMessage) throws Exception {
             
                            MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");             
                            mimeMsgHelperObj.setTo(email);
                            mimeMsgHelperObj.setFrom(emailFromRecipient);               
                            mimeMsgHelperObj.setText( message);
                            mimeMsgHelperObj.setSubject(subject);
             
                            // Determine If There Is An File Upload. If Yes, Attach It To The Client Email              
                            /*if ((attachFileObj != null) && (attachFileObj.getSize() > 0) && (!attachFileObj.equals(""))) {
                                System.out.println("\nAttachment Name?= " + attachFileObj.getOriginalFilename() + "\n");
                                mimeMsgHelperObj.addAttachment(attachFileObj.getOriginalFilename(), new InputStreamSource() {                   
                                    public InputStream getInputStream() throws IOException {
                                        return attachFileObj.getInputStream();
                                    }
                                });
                            } else {
                                System.out.println("\nNo Attachment Is Selected By The User. Sending Text Email!\n");
                            }*/
                        }
                    });
        			
        			obj.addProperty("isMailSent", true);
        		}
        		catch(Exception e) {
        			e.printStackTrace();
        		}
    		}
    		
    	
    	} 
    	
    	return obj.toString();
    }
}

