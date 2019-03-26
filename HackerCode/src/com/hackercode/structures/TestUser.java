package com.hackercode.structures;

public class TestUser {
	String userId;
	int testId;
	String data;
	
	public void setUserId(String s) {
		userId = s;
	}
	
	public void setTestId(int s) {
		testId = s;
	}
	
	public void setData(String json) {
		data = json;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public int getTestId() {
		return testId;
	}
	
	public String getData() {
		return data;
	}
	
	public String toString() {
		return "id : " + userId + " " + testId + " " + data;
	}
}
