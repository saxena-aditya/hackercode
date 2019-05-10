package com.web.hackercode.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class AuthController {
    ApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest req) {
    	req.getSession().setAttribute("isLoggedIn", false);
    	req.getSession().setAttribute("user", null);
    	// req.getSession().invalidate();
    	RedirectView home = new RedirectView("/WebHackerCode/");
    	return new ModelAndView(home);
    }
}
