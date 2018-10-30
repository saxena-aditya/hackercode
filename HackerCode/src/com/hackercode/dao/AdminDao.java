package com.hackercode.dao;

import com.hackercode.structures.UserDetail;

public interface AdminDao {
	
	
	//public Admin getAdminPass(String userName);
	public UserDetail getUserDetail(String email);
	
}
