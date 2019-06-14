package com.web.hackercode.dao;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.web.hackercode.structures.InternshipForm;
import com.web.hackercode.structures.Register;
import com.web.hackercode.structures.User;

public interface UserDAO {
	public User getUser(String username, HttpServletRequest request);
	public int getUserWithEmail(String email,String username, HttpServletRequest request);
	public User getUser(String username);
	public User saveUser(HttpServletRequest req, Register user);
	public void updateUserInfo(User u, User currentUser);
	public String returnImagePath(MultipartFile file) throws IOException;
	public String uploadFile(HttpServletRequest req, MultipartFile file);
	public boolean isUser(String username, String password, HttpServletRequest request);
	public boolean savePicture(User user, String filePath);
	public boolean saveResetLink(String username, String resetLink);
	public boolean isGoodKey(String resetLink);
	public boolean dropKey(String resetLink);
	public boolean updatePassword(String password, String resetKey);
	public boolean applyForInternship(InternshipForm itn);
	public List<InternshipForm> getInternshipApplications();
}
