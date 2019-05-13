package com.web.hackercode.dao;

import java.util.Enumeration;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import com.web.hackercode.structures.Course;
import com.web.hackercode.structures.EntityCourse;
import com.web.hackercode.structures.Resource;
import com.web.hackercode.structures.User;

public interface CourseDAO {
	public String isCoursePresent(String name);
	public String saveCourse(Course course);
	public boolean saveChapterAndLessons(Course course, String courseCode);
	public String getCourses();
	public  List<EntityCourse> getEntityCourses(HttpServletRequest req);
	public Course getCourse(String code);
	public String paymentInit(User user, String courseCode);
	public boolean completePayment(TreeMap<String, String> param);
	public boolean addCourseToUser(HttpServletRequest req, String courseCode);
	public List<Course> getUserCourses(String username);
	public String getCourseJson(String courseCode);
	public boolean addResource(String name, String source);
	public List<Resource> getResources();
}
