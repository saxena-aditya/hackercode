package com.hackercode.services;

import com.hackercode.dao.AdminDao;
import com.hackercode.structures.UserDetail;


public class AdminServiceImpl {
	
	public static AdminDao adminDao;

	public static UserDetail getUserDetail(String email){
		return adminDao.getUserDetail(email);
	}

	public static void setAdminDao(AdminDao statBoxDao) {
		AdminServiceImpl.adminDao = statBoxDao;
	}


}
