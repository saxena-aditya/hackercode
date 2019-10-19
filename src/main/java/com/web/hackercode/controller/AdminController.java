package com.web.hackercode.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.hackercode.dao.CategoryDAO;
import com.web.hackercode.utility.Utility;

@Controller

public class AdminController {
	ApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
	Utility utils = new Utility();

	@RequestMapping(value = "/admin/categories", method = RequestMethod.GET)
	public ModelAndView showEditCategory() {
		CategoryDAO catdao = ctx.getBean(CategoryDAO.class);

		return new ModelAndView("test-admin-dashboard-add-categories").addObject("nav", catdao.getNavJSON());
	}

}
