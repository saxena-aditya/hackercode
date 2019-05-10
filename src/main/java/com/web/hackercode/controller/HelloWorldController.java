package com.web.hackercode.controller;


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
public class HelloWorldController {

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
		
		return new ModelAndView("index-home")
				.addObject("courses", cdao.getEntityCourses(req)); 
		  
	  }
	  @RequestMapping(value = "/new-admin-login", method = RequestMethod.GET) 
	  public ModelAndView showAdminLogin(HttpServletRequest req) {
	  
		  return new ModelAndView("index"); 
	  }

}
