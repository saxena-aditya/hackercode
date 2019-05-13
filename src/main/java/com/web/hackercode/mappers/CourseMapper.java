package com.web.hackercode.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import com.web.hackercode.structures.Course;

public class CourseMapper implements RowMapper<Course> {
   public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
       Course course = new Course();
       course.setName(rs.getString("c_name"));
       course.setDesc(rs.getString("c_desc"));
       course.setCode(rs.getString("c_code"));
       //course.setCreator(rs.getString("c_creator"));
       course.setPrice(rs.getInt("c_price"));
       course.setTags(rs.getString("c_tags"));
       course.setMrp(rs.getInt("c_mrp"));
       course.setTotalDays(rs.getInt("c_total_days"));
       
	   return course;
   }
}