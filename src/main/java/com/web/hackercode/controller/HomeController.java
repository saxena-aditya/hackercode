package com.web.hackercode.controller;


import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.hackercode.dao.CourseDAO;

@Controller
public class HomeController {

	String message = "Welcome to Spring MVC!";
    ApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");

	@RequestMapping("/hello")
	public ModelAndView showMessage(
			@RequestParam(value = "name", required = false, defaultValue = "World") String name) {
		System.out.println("in controller");

		ModelAndView mv = new ModelAndView("helloworld");
		mv.addObject("message", message);
		mv.addObject("name", name);
		return mv;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET) 
	  public ModelAndView showIndex(HttpServletRequest req) {
		CourseDAO cdao = ctx.getBean(CourseDAO.class);
		int doLogin = 1;
    	
    	if (req.getSession() == null) {
    		doLogin = 1;
    		System.out.println("Session Null");
    	}
    	else {
			System.out.println(req.getSession());
			  Enumeration<String> x =req.getSession().getAttributeNames();
			  while(x.hasMoreElements()) { System.out.println(x.nextElement()); }
			 
    		System.out.println("Session Not Null");
    		if (req.getSession().getAttribute("isLoggedIn") != null) {
        		System.out.println("Session Not Null isLoggedIn");

    			if (req.getSession().getAttribute("isLoggedIn").toString().equalsIgnoreCase("true")) {
    	    		System.out.println("Session Not Null false");

    				doLogin = 0;
    			}
    		}
    		
    	}
		return new ModelAndView("index-home")
				.addObject("courses", cdao.getEntityCourses(req))
				.addObject("doLogin", doLogin); 
		  
	  }
	  @RequestMapping(value = "/new-admin-login", method = RequestMethod.GET) 
	  public ModelAndView showAdminLogin(HttpServletRequest req) {
	  
		  return new ModelAndView("index"); 
	  }
	  
	  @RequestMapping(value = "/resources", method = RequestMethod.GET)
	  public ModelAndView showResources(HttpServletRequest req) {
		  CourseDAO cdao = ctx.getBean(CourseDAO.class);
		  int doLogin = 1;
	    	
	    	if (req.getSession() == null) {
	    		doLogin = 1;
	    		System.out.println("Session Null");
	    	}
	    	else {
				System.out.println(req.getSession());
				  Enumeration<String> x =req.getSession().getAttributeNames();
				  while(x.hasMoreElements()) { System.out.println(x.nextElement()); }
				 
	    		System.out.println("Session Not Null");
	    		if (req.getSession().getAttribute("isLoggedIn") != null) {
	        		System.out.println("Session Not Null isLoggedIn");

	    			if (req.getSession().getAttribute("isLoggedIn").toString().equalsIgnoreCase("true")) {
	    	    		System.out.println("Session Not Null false");

	    				doLogin = 0;
	    			}
	    		}	
	    	}
	    	
		  return new ModelAndView("resources")
				  .addObject("res", cdao.getResources())
				  .addObject("doLogin", doLogin);
	  }
}
