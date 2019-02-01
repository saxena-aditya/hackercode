package com.hackercode.controller;


import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.apache.log4j.Logger;

import com.hackercode.constants.Constants;
import com.hackercode.dao.AdminDao;
import com.hackercode.dao.CommonDao;
import com.hackercode.structures.Admin;
import com.hackercode.structures.User;
import com.hackercode.util.Util;


@Controller
public class HelloController extends AbstractController{
	
	static Logger log = Logger.getLogger(HelloController.class.getName());
	private AdminDao admindao;
	private ModelAndView modelandview;
	
	ApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	protected ModelAndView showLoginAndRegiser() {
		return new ModelAndView("login");
	}
	
	
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

    	
    	//AdminDaoImpl dao=(AdminDaoImpl)context.getBean("adminDao"); 
    	CommonDao cdao = (CommonDao)ctx.getBean("CommonDao");
    	//modelandview = new ModelAndView("hello");
    	//return modelandview;
    //	System.out.println("Our DataSource is = " + dataSource);
    	
    	String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        pass = Util.covertToMd5(pass);
        String confirmPass = request.getParameter("confirm-password");
        if(confirmPass==null) {
        	//pass = Util.covertToMd5(pass);
        	try{
	        	Boolean userExists = cdao.isUserExists(email);  //checkUserPresent(email,pass);
	        	if(userExists == false){
	        		return wrongUserPass();
	        	}
	        	User user = cdao.getUser(email,pass);
	        	String userType = user.getUserType();
	        	if(userType.equals(Constants.ADMIN)){	
	        		return setAdminSpecificData(user);
	        	}
	        	else if(userType.equals(Constants.STUDENT)){
	        		 return setStudentSpecificData();
	        	}
	        	log.info("Inside login");
	        	
        	} catch(Exception e){
        			log.error(e);
        			System.out.println("Cannot find the user "+e);
        	}
        }
        else {
        	//System.out.println("inside Register ");
        	String username = request.getParameter("username");
        	cdao.registerNewUser(email,username,pass);
        	modelandview = new ModelAndView("student_dashboard");
        	return modelandview;
        }
      //  modelandview = new ModelAndView("student_dashboard");
    	return null;
	}
	
	@RequestMapping(value = "/login-user", method = RequestMethod.POST)
	public ModelAndView handleLoginRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException {
    	
    	@SuppressWarnings("resource")
		ApplicationContext ctx = 
    	    		new ClassPathXmlApplicationContext("Beans.xml");
    	
    	CommonDao cdao = (CommonDao) ctx.getBean(CommonDao.class);
    	modelandview = new ModelAndView("hello");
    	String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        pass = Util.covertToMd5(pass);
        System.out.println("username: " + username + ", pass: " + pass);
        try{
        	Boolean userExists = cdao.isUserExists(username);  //checkUserPresent(email,pass);
        	if(!userExists){
        		return wrongUserPass();
        	}
        	User user = cdao.getUser(username, pass);
        	String userType = user.getUserType();
        	if(userType.equals(Constants.ADMIN)){	
        		return setAdminSpecificData(user);
        	}
        	else if(userType.equals(Constants.STUDENT)){
        		 return setStudentSpecificData();
        	}
        }
       catch(Exception e){
        	System.out.println("Cannot find the user "+e);
        }
        
		return modelandview;
    }
    
   /* boolean checkUserPresent(String email, String pass){
    	return CommonServiceImpl.isUserExists(email);
    }*/
    
    private ModelAndView wrongUserPass() {
		// TODO Auto-generated method stub
    	modelandview = new ModelAndView("login");
		modelandview.addObject(Constants.WRONG_USERNAME_PASSWORD, Constants.FALSE);
		
		return modelandview;
	}
    
    
    private ModelAndView setAdminSpecificData(User user) {
		// TODO Auto-generated method stub
    	/*
    	user = AdminServiceImpl.getUserDetail(user.getEmail());
		statBox = (List<StatBox>) StatBoxServiceImpl.getStatBoxDetails(user.getId());
		modelandview = new ModelAndView("admin_home");
		modelandview.addObject(Constants.USER,user.getId());
		Util.setParameters(modelandview,Admin);
		Util.setStatBoxParameters(modelandview, statBox);*/
		//commonDao.setLastLogin(user.getId());
    	modelandview = new ModelAndView("admin-dashboard");
		return modelandview;
	}
    
	@RequestMapping(value = "home", method = RequestMethod.GET)
	protected ModelAndView sayHello() {
    	return new ModelAndView("home");
		
	}
	
	@RequestMapping(value = "admin", method = RequestMethod.GET)
	protected ModelAndView showAdminDashboard() {
		return new ModelAndView("admin-dashboard"); 
	}
	
	@RequestMapping(value = "show-admins", method = RequestMethod.GET)
	protected ModelAndView showAdminList() {
		
		admindao = ctx.getBean(AdminDao.class);
		ModelAndView mx = new ModelAndView("test");
		List<Admin> admins = admindao.getAllAdmins();
		
		mx.addObject("admins", admins);
		return mx;
	}
	
	/*public String printHello(ModelMap model) {
	    model.addAttribute("message", "Hello Spring MVC Framework!");
	    return "hello";
	 }*/

	
	private ModelAndView setStudentSpecificData() {
		// TODO Auto-generated method stub
    	modelandview =new ModelAndView("failed");
		return modelandview;
	}
}