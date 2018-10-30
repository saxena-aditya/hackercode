package com.hackercode.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.hackercode.structures.StatBox;
import com.hackercode.structures.StudentForm;
import com.hackercode.structures.User;
import com.hackercode.structures.UserDetail;
import com.hackercode.constants.Constants;
import com.hackercode.services.AdminServiceImpl;
import com.hackercode.services.CommonServiceImpl;
import com.hackercode.services.StatBoxServiceImpl;
import com.hackercode.services.StudentFormServiceImpl;
import com.hackercode.util.Util;

public class TestController implements Controller{

	private UserDetail userDetail;
    private List<StatBox> statBox;
    private ModelAndView modelandview;
    private int isAddFieldActive=0;
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
    	ApplicationContext context = 
    	    		new ClassPathXmlApplicationContext("Beans.xml");
    	//int u_id = Integer.parseInt(request.getParameter("user"));
    	int u_id=0;
    	int page_id = Integer.parseInt(request.getParameter("id"));
    	if(u_id==0) u_id=1;
    	if(isAddFieldActive==1){
    		//add code for adding field to DB
    	}
    	if(page_id==101){
    		try{
    			modelandview =new ModelAndView("editStudentForm");
        		//List<String> fields = StudentFormServiceImpl.getAllFieldsById(u_id);
        		//modelandview.addObject(Constants.STUDENT_FORM_FIELDS,fields);
    		}catch(Exception ex){
    			System.out.println(ex.getMessage());
    		}
    		
    	}
    	else if(page_id==103){
	    	try{
	    		modelandview =new ModelAndView("runTest");
	    	//	List<StudentForm> studentForm = getStudentFormData(u_id);
	    	//	modelandview.addObject(Constants.STUDENT_FORM_FIELDS,studentForm);
	    	}
	    	catch(Exception ex){
	    		System.out.println(ex.getMessage());
	    	}
    	}
    	
    	//addHeaderAndLeftColumnAttributes(modelandview,u_id);
    	return modelandview;
	}
	/*private void addHeaderAndLeftColumnAttributes(ModelAndView modelandview,int u_id) {
		// TODO Auto-generated method stub
		try{
			User user = CommonServiceImpl.getUserById(u_id);
			modelandview.addObject(Constants.USER,user.getU_id());
			userDetail = AdminServiceImpl.getUserDetail(user.getEmail());
			statBox = (List<StatBox>) StatBoxServiceImpl.getStatBoxDetails(user.getU_id());
			modelandview.addObject(Constants.USER,user.getU_id());
			Util.setParameters(modelandview,userDetail);
			Util.setStatBoxParameters(modelandview, statBox);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	private List<StudentForm> getStudentFormData(int u_id) {
		// TODO Auto-generated method stub
		return StudentFormServiceImpl.getStudentFormFields(u_id);
	}*/
	
	public void setIsAddFieldActive(int isAddFieldActive) {
		this.isAddFieldActive = isAddFieldActive;
	}
}
