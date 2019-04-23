package com.web.hackercode.structures;

public class TestUser {
	
	private String userId;
	private String testId;
	private String data;
	private String timeLeft;
	private int marks;
	private boolean isTestFinished;
	private int maxMarks;
	private String date;
	private String username;
	private String institue;
	
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getInstitue() {
		return institue;
	}

	public void setInstitue(String institueName) {
		this.institue = institueName;
	}

	public int getMaxMarks() {
		return maxMarks;
	}

	public void setMaxMarks(int maxMarks) {
		this.maxMarks = maxMarks;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getMarks() {
		return marks;
	}

	public void setMarks(int marks) {
		this.marks = marks;
	}

	public boolean isTestFinished() {
		return isTestFinished;
	}

	public void setTestFinished(boolean isTestFinished) {
		this.isTestFinished = isTestFinished;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTestId() {
		return testId;
	}

	public void setTestId(String testId) {
		this.testId = testId;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getTimeLeft() {
		return timeLeft;
	}

	public void setTimeLeft(String timeLeft) {
		this.timeLeft = timeLeft;
	}

	public String toString() {
		return "id : " + userId + " " + testId + " " + data;
	}
}
