package com.web.hackercode.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;

@Controller
public class CategoryController {
	ApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
}
