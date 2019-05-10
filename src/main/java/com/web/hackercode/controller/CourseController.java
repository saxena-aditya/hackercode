package com.web.hackercode.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.paytm.merchant.CheckSumServiceHelper;
import com.web.hackercode.constants.PaytmConstants;
import com.web.hackercode.dao.CourseDAO;
import com.web.hackercode.structures.Course;
import com.web.hackercode.structures.User;

@Controller
public class CourseController {
    ApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
    
    @RequestMapping(value = "/get-live-courses", method = RequestMethod.GET)
    public ModelAndView getLiveCourses(HttpServletRequest req) throws InterruptedException{
    	Thread.sleep(1000);
    	CourseDAO cdao = ctx.getBean(CourseDAO.class);
    	
    	User user = (User) req.getSession().getAttribute("user");
    	return new ModelAndView("profile-courses")
    			.addObject("coursesMore", cdao.getEntityCourses(req))
    			.addObject("courses", cdao.getUserCourses(user.getUsername()));
    }
    
    @RequestMapping(value = "/get-course-lessions", method = RequestMethod.POST) 
    @ResponseBody
    public String getCourseLessions(HttpServletRequest req) throws InterruptedException {
    	Thread.sleep(1000);

		String courseCode = req.getParameter("code");
		CourseDAO cdao = ctx.getBean(CourseDAO.class);
		if (courseCode != null) {
			return cdao.getCourseJson(courseCode);
		}
		else {
			
		}
    	return null;
	}
    
    @RequestMapping(value = "/admin/add-courses", method = RequestMethod.GET)
    public ModelAndView addCourses(HttpServletRequest req) {
    	
    	return new ModelAndView("test-admin-add-course");
    }
    
    @RequestMapping(value = "/upload-course", method = RequestMethod.POST)
    @ResponseBody
    public boolean uploadCourse(HttpServletRequest req, 
    		@ModelAttribute("course") Course course,
    		BindingResult result) {
    	System.out.println(course.getFiles().size());
    	System.out.println(course.toString());
    	CourseDAO cdao = ctx.getBean(CourseDAO.class);
    	String courseCode = cdao.isCoursePresent(course.getName());
    	
    	if (courseCode != null) {
    		// save chapters and lessons
			if (cdao.saveChapterAndLessons(course, courseCode)) {
				return true;
			}
			else {
				return false;
			}
    	}
    	else {
    		// save course, chapter and lessons
    		courseCode = cdao.saveCourse(course);
    		if (courseCode != null) {
    			if (cdao.saveChapterAndLessons(course, courseCode)) {
    				return true;
    			}
    		}
    		else {
    			return false;
    		}
    	}
    	return false;
    } 
    
    @RequestMapping(value = "/api/get-course", method = RequestMethod.GET)
    @ResponseBody
    public String getCourses(HttpServletRequest req) {
    	CourseDAO cdao = ctx.getBean(CourseDAO.class);
    	return cdao.getCourseJson("NC3F9A");
    }
    
    @RequestMapping(value = "courses/{courseCode}/{courseName}", method = RequestMethod.GET)
    public ModelAndView showCourseDetails(HttpServletRequest req, 
    		@PathVariable String courseCode ,@PathVariable String courseName) {
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
    	
    	return new ModelAndView("course-details")
    			.addObject("course", cdao.getCourse(courseCode))
    			.addObject("doLogin", doLogin);
    }
    
    @RequestMapping(value = "/courses/{courseCode}/payment/redirect", method = RequestMethod.GET)
    public ModelAndView paytmentRedirect(HttpServletRequest req, 
    		@PathVariable String courseCode) throws Exception {
    	
    	StringBuilder outputHtml = new StringBuilder();
    	User user = (User) req.getSession().getAttribute("user");
    	CourseDAO cdao = ctx.getBean(CourseDAO.class);
    	String orderId = cdao.paymentInit(user, courseCode);
    	Course course = cdao.getCourse(courseCode);
    	if (orderId == null) {
    		// throw error msg
    	}
    	else {
    		Enumeration<String> paramNames = req.getParameterNames();
        	Map<String, String[]> mapData = req.getParameterMap();
        	TreeMap<String,String> parameters = new TreeMap<String,String>();
        	String paytmChecksum =  "";
        	
        	while(paramNames.hasMoreElements()) {
        		String paramName = (String)paramNames.nextElement();
        		System.out.println(paramName);
        		parameters.put(paramName, mapData.get(paramName)[0]);	
        	}
        	parameters.put("ORDER_ID", orderId);
        	parameters.put("MID",PaytmConstants.MID);
        	parameters.put("CUST_ID", "abcd");
        	parameters.put("TXN_AMOUNT", Integer.toString(course.getPrice()));
        	parameters.put("CHANNEL_ID",PaytmConstants.CHANNEL_ID);
        	parameters.put("INDUSTRY_TYPE_ID",PaytmConstants.INDUSTRY_TYPE_ID);
        	parameters.put("WEBSITE",PaytmConstants.WEBSITE);
        	parameters.put("MOBILE_NO","9876543210");
        	parameters.put("EMAIL","test@gmail.com");
        	parameters.put("CALLBACK_URL", "http://localhost:8080/WebHackerCode/courses/"+courseCode+"/payment/callback");
        	String checkSum =  CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum(PaytmConstants.MERCHANT_KEY, parameters);
        	outputHtml.append("<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>");
        	outputHtml.append("<html>");
        	outputHtml.append("<head>");
        	outputHtml.append("<title>Merchant Check Out Page</title>");
        	outputHtml.append("</head>");
        	outputHtml.append("<body>");
        	outputHtml.append("<center><h1>Please do not refresh this page...</h1></center>");
        	outputHtml.append("<form method='post' action='"+ PaytmConstants.PAYTM_URL +"' name='f1'>");
        	outputHtml.append("<table border='1'>");
        	outputHtml.append("<tbody>");
        	for(Map.Entry<String,String> entry : parameters.entrySet()) {
        		String key = entry.getKey();
        		String value = entry.getValue();
        		outputHtml.append("<input type='hidden' name='"+key+"' value='" +value+"'>");	
        	}	  
        		  
        	outputHtml.append("<input type='hidden' name='CHECKSUMHASH' value='"+checkSum+"'>");
        	outputHtml.append("</tbody>");
        	outputHtml.append("</table>");
        	outputHtml.append("<script type='text/javascript'>");
        	outputHtml.append("document.f1.submit();");
        	outputHtml.append("</script>");
        	outputHtml.append("</form>");
        	outputHtml.append("</body>");
        	outputHtml.append("</html>");
        	
        	return new ModelAndView("paytm-redirect").addObject("redirectForm", outputHtml);

    	}
    	
    	return null;
    	
    }
    
    @RequestMapping(value = "/courses/{courseCode}/payment/callback", method = RequestMethod.POST)
    public ModelAndView paytmentResponse(HttpServletRequest req, @PathVariable String courseCode) {
    	CourseDAO cdao = ctx.getBean(CourseDAO.class);
    	Enumeration<String> paramNames = req.getParameterNames();
    	Map<String, String[]> mapData = req.getParameterMap();
    	TreeMap<String,String> parameters = new TreeMap<String,String>();
    	String paytmChecksum =  "";
    	while(paramNames.hasMoreElements()) {
    		String paramName = (String)paramNames.nextElement();
    		if(paramName.equals("CHECKSUMHASH")){
    			paytmChecksum = mapData.get(paramName)[0];
    		}else{
    			parameters.put(paramName,mapData.get(paramName)[0]);
    		}
    	}
    	boolean isValideChecksum = false;
    	String outputHTML="";
    	try{
    		isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY,parameters,paytmChecksum);
    		if(isValideChecksum && parameters.containsKey("RESPCODE")){
    			if(parameters.get("RESPCODE").equals("01")){
    				outputHTML = parameters.toString();
    				if (cdao.completePayment(parameters)) {
    					if (cdao.addCourseToUser(req, courseCode))
    					outputHTML = "success";
    				}
    			}else{
    				System.out.println(parameters.toString());
    				outputHTML="<b>Payment Failed.</b>";
    			}
    		}else{
    			outputHTML="<b>Checksum mismatched.</b>";
    		}
    	}catch(Exception e){
    		outputHTML=e.toString();
    	}
    	RedirectView v = new RedirectView(req.getContextPath() + "/profile");
    	return new ModelAndView(v);
    }
    
}
