package com.web.hackercode.structures;

import org.springframework.web.multipart.MultipartFile;

public class User {

	private int u_id;
	private String firstName;
	private String lastName;
	private String email;
	private String institute;
	private boolean isAdmin;
	private boolean isDrafter;
	private String username;
	private  MultipartFile file;
	private String filePath;
	
	/**
	 * @return the isDrafter
	 */
	public boolean isDrafter() {
		return isDrafter;
	}

	/**
	 * @param isDrafter the isDrafter to set
	 */
	public void setDrafter(boolean isDrafter) {
		this.isDrafter = isDrafter;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	

	public String getUsername() {
		return username;
	}
	
	public void setUsername(String u) {
		this.username = u;
	}
	/**
	 * @return the u_id
	 */
	public int getU_id() {
		return u_id;
	}
	/**
	 * @param u_id the u_id to set
	 */
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}
	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}
	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the institute
	 */
	public String getInstitute() {
		return institute;
	}
	/**
	 * @param institute the institute to set
	 */
	public void setInstitute(String institute) {
		this.institute = institute;
	}
	/**
	 * @return the isAdmin
	 */
	public boolean isAdmin() {
		return isAdmin;
	}
	/**
	 * @param isAdmin the isAdmin to set
	 */
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getUserType() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public void setPassword(String string) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", institute=" + institute + ", isAdmin=" + isAdmin + ", isDrafter=" + isDrafter + ", username="
				+ username + ", file=" + file + ", filePath=" + filePath + "]";
	}
	
}
