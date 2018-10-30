package com.hackercode.daoimpl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import com.hackercode.dao.StudentDAO;
import com.hackercode.mappers.StudentMapper;
import com.hackercode.structures.Student;

public class StudentDaoImpl implements StudentDAO {
	 
	@Autowired
	private DataSource dataSource;
  //  private SimpleJdbcCall jdbcCall;
    private JdbcTemplate jdbcTemplateObject;

   public void setDataSource(DataSource dataSource) {
      this.dataSource = dataSource;
      //this.jdbcCall =  new SimpleJdbcCall(dataSource).withProcedureName("getRecord");
   }
   public void create(String name, Integer age) {
      jdbcTemplateObject = new JdbcTemplate(dataSource);
      String SQL = "insert into Students (name, age) values (?, ?)";

      jdbcTemplateObject.update( SQL, name, age);
      System.out.println("Created Record Name = " + name + " Age = " + age);
      return;
   }
   public Student getStudent(Integer id) {
      SqlParameterSource in = new MapSqlParameterSource().addValue("in_id", id);
    //  Map<String, Object> out = jdbcCall.execute(in);

      Student student = new Student();
      student.setId(id);
     // student.setName((String) out.get("out_name"));
     // student.setAge((Integer) out.get("out_age"));
      return student;
   }
   public List<Student> listStudents() {
      String SQL = "select * from Students";
      List <Student> students = jdbcTemplateObject.query(SQL, new StudentMapper());
      return students;
   }
}