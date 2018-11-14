package com.hackercode.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.apache.log4j.Logger;

import com.hackercode.constants.Constants;
import com.hackercode.dao.AdminDao;
import com.hackercode.services.CommonServiceImpl;
import com.hackercode.structures.Admin;
import com.hackercode.structures.User;
import com.hackercode.util.Util;


@Controller
public class HelloController extends AbstractController{
	
	static Logger log = Logger.getLogger(HelloController.class.getName());
	private AdminDao admindao;
	private ModelAndView modelandview;
	
	ApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");

	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

    	
    	//AdminDaoImpl dao=(AdminDaoImpl)context.getBean("adminDao"); 
    	CommonServiceImpl cdao = (CommonServiceImpl)ctx.getBean("commonImplTarget");
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
	        	Boolean userExists =   cdao.isUserExists(email);  //checkUserPresent(email,pass);
	        	if(userExists==false){
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
   
	/*public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException {
    	
    	ApplicationContext context = 
    	    		new ClassPathXmlApplicationContext("Beans.xml");
    	AdminDaoImpl dao=(AdminDaoImpl)context.getBean("adminDao"); 
    	CommonDaoImpl cdao = (CommonDaoImpl)context.getBean("commonDao");
    	modelandview = new ModelAndView("hello");
    	return modelandview;*/
    	/*String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        pass = Util.covertToMd5(pass);
        try{
        	Boolean userExists =   cdao.isUserExists(email, pass);  //checkUserPresent(email,pass);
        	if(userExists.equals(Constants.FALSE)){
        		return wrongUserPass();
        	}
        	Admin user = CommonServiceImpl.getUser(email);
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
        
		return modelandview;*/
   // }
    
   /* boolean checkUserPresent(String email, String pass){
    	return CommonServiceImpl.isUserExists(email);
    }*/
    
    private ModelAndView wrongUserPass() {
		// TODO Auto-generated method stub
    	modelandview = new ModelAndView("failed");
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
    	modelandview = new ModelAndView("admin_dashboard2");
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
    	modelandview =new ModelAndView("student_dashboard");
		return modelandview;
	}
}