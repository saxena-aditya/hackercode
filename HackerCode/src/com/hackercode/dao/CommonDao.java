package com.hackercode.dao;

import javax.sql.DataSource;

import com.hackercode.structures.User;




public interface CommonDao {
	
	public void setDataSource(DataSource ds);
	public Boolean isUserExists(String email);
	public String getUserType(int userId);
	public User getUser(String email, String password);
	//public boolean setLastLogin(Long id);
	//public Long getUserId(String email);
	public User getUserById(int u_id);
	public boolean registerNewUser(String email, String username, String password);
	
}
