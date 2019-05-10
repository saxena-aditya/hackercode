package com.web.hackercode.dao;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.web.hackercode.structures.User;

public interface UserDAO {
	
	public String uploadFile(HttpServletRequest req, MultipartFile file);
	public boolean savePicture(User user, String filePath);
}
