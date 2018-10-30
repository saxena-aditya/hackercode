package com.hackercode.services;

import org.springframework.beans.factory.annotation.Autowired;

import com.hackercode.dao.CommonDao;
import com.hackercode.structures.User;

public class CommonServiceImpl {

	@Autowired
	public static CommonDao commonDao;

	public  Boolean isUserExists(String email){
		return commonDao.isUserExists(email);
	}
	
	public static String getUserType(int userId){
		return commonDao.getUserType(userId);
	}
	
	public  User getUser(String email, String password){
		return commonDao.getUser(email,password);
	}
	
	/*public static boolean setLastLogin(Long id){
		return commonDao.setLastLogin(id);
	}
	
	public static Long getUserId(String email){
		return commonDao.getUserId(email);
	}*/
	
	public static void setCommonDao(CommonDao commonDao) {
		CommonServiceImpl.commonDao = commonDao;
	}

	public static User getUserById(int u_id) {
		return commonDao.getUserById(u_id);
	}

	public boolean registerNewUser(String email, String username, String pass) {
		return commonDao.registerNewUser(email,username,pass);
	}
	
}
