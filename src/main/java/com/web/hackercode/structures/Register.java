package com.web.hackercode.structures;

import java.util.Arrays;

public class Register {
	private String fName;
	private String lName;
	private String username;
	private String email; 
	private String password;
	private String course;
	private String []programs;
	
	public String[] getPrograms() {
		return programs;
	}
	public void setPrograms(String[] programs) {
		this.programs = programs;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	@Override
	public String toString() {
		return "Register [fName=" + fName + ", lName=" + lName + ", username=" + username + ", email=" + email
				+ ", password=" + password + ", course=" + course + ", programs=" + Arrays.toString(programs) + "]";
	}

}
