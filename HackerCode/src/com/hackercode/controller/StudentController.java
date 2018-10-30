package com.hackercode.controller;

import java.util.List;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.hackercode.daoimpl.StudentDaoImpl;
import com.hackercode.structures.Student;

public class StudentController {
  /* public static void main(String[] args) {
      ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
      StudentDaoImpl studentJDBCTemplate = 
         (StudentDaoImpl)context.getBean("studentJDBCTemplate");
      
      System.out.println("------Records Creation--------" );
      studentJDBCTemplate.create("Zara", 11);
      studentJDBCTemplate.create("Nuha", 2);
      studentJDBCTemplate.create("Ayan", 15);

      System.out.println("------Listing Multiple Records--------" );
      List<Student> students = studentJDBCTemplate.listStudents();
      
      for (Student record : students) {
         System.out.print("ID : " + record.getId() );
         System.out.print(", Name : " + record.getName() );
         System.out.println(", Age : " + record.getAge());
      }
      System.out.println("----Listing Record with ID = 2 -----" );
      Student student = studentJDBCTemplate.getStudent(2);
      System.out.print("ID : " + student.getId() );
      System.out.print(", Name : " + student.getName() );
      System.out.println(", Age : " + student.getAge());
   }*/
}