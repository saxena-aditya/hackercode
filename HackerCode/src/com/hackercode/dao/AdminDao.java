package com.hackercode.dao;

import com.hackercode.structures.UserDetail;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hackercode.structures.Admin;
import com.hackercode.structures.User;

public interface AdminDao {
		
	//public Admin getAdminPass(String userName);
	public UserDetail getUserDetail(String email);
	public List<Admin> getAllAdmins();
	
}
