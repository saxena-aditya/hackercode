package com.web.hackercode.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.hackercode.dao.TestDAO;
import com.web.hackercode.dao.UserDAO;
import com.web.hackercode.structures.User;

@Controller
public class UserController {
	
    ApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");

    @RequestMapping(value = "/save-profile-pic", method = RequestMethod.POST)
    @ResponseBody
    public boolean saveProfilePic(HttpServletRequest req, 
    		@RequestParam("profile-pic") MultipartFile file) {
    	
    	UserDAO userDao = ctx.getBean(UserDAO.class);
    	TestDAO testDao = ctx.getBean(TestDAO.class);
    	User user = (User) req.getSession().getAttribute("user");
    	String filePath = userDao.uploadFile(req, file);
    	if (filePath.length() != 0) {
    		boolean x = userDao.savePicture(user, filePath);
    		System.out.println("after request");
    		if (x) {
    			
    			req.getSession().setAttribute("user", testDao.getUser(user.getUsername(), req));
    			return true;
    		}
    	}
    	return false;
    }
}
